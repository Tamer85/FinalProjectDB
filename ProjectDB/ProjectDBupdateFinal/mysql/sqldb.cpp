#include "sqlDb.h"
#include <mysqlx/xapi.h>



//חיוב למסד תונים
static mysqlx_session_t* sessConn()
{
	mysqlx_error_t* err;
	mysqlx_session_t* sess = mysqlx_get_session("localhost", DEFAULT_MYSQLX_PORT, "root", "root", "tamer", &err);
	return sess;
}

// נתונים הוספה
//void ConnDatabase::insertAlbum(int id, string name, string Lname)
//{
//	char query[] = { "INSERT INTO `tamer`.`table1` (`idnew_table`,`fname`, `lname`) VALUES(?,?, ?);"
//	};
//	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query, MYSQLX_NULL_TERMINATED);
//	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(id), PARAM_STRING(name.c_str()), PARAM_STRING(Lname.c_str()), PARAM_END)) {
//		cerr << "error binding parameters\n";
//		exit(2);
//	}
//	mysqlx_execute(stmt);
//	cout << "Add successful" << endl;
//}


//הצגה הנתוניים
//mysqlx_result_t* ConnDatabase::SelectAlbum(int id, string name)
//{
//	char query[] = { "SELECT idnew_table,fname, "
//						"FROM `table1` "
//						"WHERE idnew_table > ?;"};
//	
//	cout << "Here is the List" << endl;
//	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query, MYSQLX_NULL_TERMINATED);
//	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(1), PARAM_STRING(name.c_str()), PARAM_END)) {
//		cerr << "error binding parameters\n";
//		exit(2);
//	}
//	cout << "No successful" << endl;
//	return mysqlx_execute(stmt);
//}


static void ResFunc(mysqlx_result_t* res)
{
	mysqlx_error_t* err;
	mysqlx_session_t* sess = mysqlx_get_session("localhost", DEFAULT_MYSQLX_PORT, "root", "root", "tamer", &err);

	if (NULL != res) {
		char buff[256];
		size_t size = 0;
		uint32_t cols = mysqlx_column_get_count(res);

		do {
			mysqlx_row_t* row = mysqlx_row_fetch_one(res);
			while (NULL != row) {
				for (uint32_t i = 0; i < cols; ++i) {
					int64_t id;

					size = sizeof(buff);
					if (i > 0)
						mysqlx_get_bytes(row, i, 0, buff, &size);
					else mysqlx_get_sint(row, 0, &id);
					//Bind
					switch (i) {
					case 0:
						cout << id;
						break;
					case 1:
					case 2:
					case 3:
						cout << buff;
						break;
					default:
						cout << "undefined";
					}
					if (9 > size)
						cout << "\t";
					cout << "\t \t";
				}
				cout << endl;
				row = mysqlx_row_fetch_one(res);
			}
		} while (RESULT_OK == mysqlx_next_result(res));
	}
	else {
		cerr << mysqlx_error_message(sess) << endl;
		exit(mysqlx_error_num(sess));
	}
	mysqlx_session_close(sess);
}

void ConnDatabase::SelectAlbum_1(string d1, string d2)
{
	string query = { "SELECT count(*) as album_count FROM albums where albumRecordingBegining between '" + d1 + "' and albumRecordingEnd <='" + d2 + "'" };
	//SELECT count(*) as album_count FROM albums where albumRecordingBegining between "01-01-2009" and albumRecordingEnd <="01-01-2019"

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query1, MYSQLX_NULL_TERMINATED);

	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(0), PARAM_END)) {
		cerr << "error binding parameters\n";
		exit(2);
	}
	mysqlx_result_t* res = mysqlx_execute(stmt);
	ResFunc(res);
}


void ConnDatabase::SelectAlbum_2(string name, string d1, string d2)
{
	string query = { "SELECT count(*) as num_of_songs FROM albums "\
					"inner join musician_albums "\
					"on musician_albums.albumId = albums.albumId "\
					"inner join musicians "\
					"on musicians.musicianId = musician_albums.musicianId "\
					"inner join album_songs "\
					"on album_songs.albumId = albums.albumId "\
					"where musicianName = '" + name + "' and albumRecordingBegining between '" + d1 + "' and albumRecordingEnd <= '" + d1 + "';" };
					//where musicianName = 'losy' and albumRecordingBegining between "01-01-2009" and albumRecordingEnd <= "01-01-2019";

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query1, MYSQLX_NULL_TERMINATED);

	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(0), PARAM_END)) {
		cerr << "error binding parameters\n";
		exit(2);
	}
	mysqlx_result_t* res = mysqlx_execute(stmt);
	ResFunc(res);
}


void ConnDatabase::SelectAlbum_3(string name, string d1, string d2)
{
	string query = { "Select COUNT(*) as count FROM albums INNER JOIN musician_albums "\
					"ON albums.albumId = musician_albums.albumId INNER JOIN musicians "\
					"ON musicians.musicianId = musician_albums.musicianId WHERE(Select musicianId from musicians WHERE "\
					"musicians.musicianName = '" + name + "') = musicians.musicianId and albumRecordingEnd between '" + d1 + "' and albumRecordingEnd <= '" + d2 + "';" };
					//musicians.musicianName = 'losy') = musicians.musicianId and albumRecordingEnd between "01-01-200+" and albumRecordingEnd <= "01-01-2019"

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query1, MYSQLX_NULL_TERMINATED);

	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(0), PARAM_END)) {
		cerr << "error binding parameters\n";
		exit(2);
	}
	mysqlx_result_t* res = mysqlx_execute(stmt);
	ResFunc(res);
}


void ConnDatabase::SelectAlbum_4()
{
	char query[] = { "select instruments.instrumentName from musical_numbers "\
					"inner join musical_numbers_instruments on musical_numbers.musicalNumberId = musical_numbers_instruments.musicalNumberId "\
					"inner join instruments on instruments.instrumentId = musical_numbers_instruments.instruemntId "\
					"group by instruments.instrumentId limit 1;" };

	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query, MYSQLX_NULL_TERMINATED);

	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(0), PARAM_END)) {
		cerr << "error binding parameters\n";
		exit(2);
	}
	mysqlx_result_t* res = mysqlx_execute(stmt);
	ResFunc(res);
}


void ConnDatabase::SelectAlbum_5(string nameAlbum)
{
	string query = { "select instrumentName from instruments inner join albums_instruments on instruments.instrumentId = albums_instruments.instrumentId "\
					 "where albums_instruments.albumId = (select albums.albumId from albums where albums.albumName = '" + nameAlbum + "');" };

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query1, MYSQLX_NULL_TERMINATED);

	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(0), PARAM_END)) {
		cerr << "error binding parameters\n";
		exit(2);
	}
	mysqlx_result_t* res = mysqlx_execute(stmt);
	ResFunc(res);
}


void ConnDatabase::SelectAlbum_6(string Mafikname, string d1, string d2)
{
	string query = { "Select producerName, max(reps) from (Select producerName, count(albumId) as reps "\
					"FROM producers INNER JOIN producer_albums ON producer_albums.producerId = producers.producerId "\
					"group by producer_albums.producerId) as temp_table;" };

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query1, MYSQLX_NULL_TERMINATED);

	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(0), PARAM_END)) {
		cerr << "error binding parameters\n";
		exit(2);
	}
	mysqlx_result_t* res = mysqlx_execute(stmt);
	ResFunc(res);
}


void ConnDatabase::SelectAlbum_7()
{
	char query[] = { "select instruments.instrumentMaker from instruments "\
					"where instruments.instrumentName = (select instruments.instrumentName from musical_numbers "\
					"inner join musical_numbers_instruments on musical_numbers.musicalNumberId = musical_numbers_instruments.musicalNumberId "\
					"inner join instruments on instruments.instrumentId = musical_numbers_instruments.instruemntId "\
					"group by instruments.instrumentId limit 1);" };

	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query, MYSQLX_NULL_TERMINATED);

	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(0), PARAM_END)) {
		cerr << "error binding parameters\n";
		exit(2);
	}
	mysqlx_result_t* res = mysqlx_execute(stmt);
	ResFunc(res);
}


void ConnDatabase::SelectAlbum_8()
{
	char query[] = { "Select count(*) as count1 from musicians;" };

	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query, MYSQLX_NULL_TERMINATED);

	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(0), PARAM_END)) {
		cerr << "error binding parameters\n";
		exit(2);
	}
	mysqlx_result_t* res = mysqlx_execute(stmt);
	ResFunc(res);
}


void ConnDatabase::SelectAlbum_9()
{
	char query[] = { "select musicianName, max(participants) from "\
					"(Select musicians.musicianName,albumId,count(*) as participants from musicians "\
					"INNER JOIN musician_albums "\
					"ON musicians.musicianId = musician_albums.musicianId "\
					"group by albumId) as tablu;" };

	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query, MYSQLX_NULL_TERMINATED);

	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(0), PARAM_END)) {
		cerr << "error binding parameters\n";
		exit(2);
	}
	mysqlx_result_t* res = mysqlx_execute(stmt);
	ResFunc(res);
}


void ConnDatabase::SelectAlbum_10()
{
	char query[] = { "SELECT songGenre , count(songGenre) AS ct FROM songs GROUP BY songs.songGenre "\
			"ORDER BY ct DESC LIMIT 1" };

	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query, MYSQLX_NULL_TERMINATED);

	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(100), PARAM_END)) {
		cerr << "error binding parameters\n";
		exit(2);
	}
	mysqlx_result_t* res = mysqlx_execute(stmt);
	ResFunc(res);
}


void ConnDatabase::SelectAlbum_11(string d1, string d2)
{
	string query = { "SELECT*, count(*) as songs FROM songs inner join recorders on songs.recorderId = recorders.recorderId "\
					"inner join album_songs on album_songs.songId = songs.songId inner join albums "\
					"on albums.albumId = album_songs.albumId where albumRecordingBegining between '" + d1 + "' and albumRecordingEnd <= '" + d2 + "' "\
					"group by recorderName order by songs DESC limit 1" };
					//on albums.albumId = album_songs.albumId where albumRecordingBegining between "01-01-2009" and albumRecordingEnd <= "01-01-2019"

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query1, MYSQLX_NULL_TERMINATED);

	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(100), PARAM_END)) {
		cerr << "error binding parameters\n";
		exit(2);
	}
	mysqlx_result_t* res = mysqlx_execute(stmt);
	ResFunc(res);
}


void ConnDatabase::SelectAlbum_12()
{
	char query[] = { "SELECT * FROM albums order by albumRecordingEnd ASC;" };

	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query, MYSQLX_NULL_TERMINATED);

	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(100), PARAM_END)) {
		cerr << "error binding parameters\n";
		exit(2);
	}
	mysqlx_result_t* res = mysqlx_execute(stmt);
	ResFunc(res);
}


void ConnDatabase::SelectAlbum_13()
{
	char query[] = {
		"Select*, count(*) as rep from album_songs "\
		"inner join songs "\
		"on album_songs.songId = songs.songId "\
		"group by songName "\
		"having rep > 1;" };

	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query, MYSQLX_NULL_TERMINATED);

	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(0), PARAM_END)) {
		cerr << "error binding parameters\n";
		exit(2);
	}
	mysqlx_result_t* res = mysqlx_execute(stmt);
	ResFunc(res);
}


void ConnDatabase::SelectAlbum_14()
{
	char query[] = {
	"SELECT*, count(*) as number_of_tracks FROM recorders "\
	"inner join songs "\
	"on recorders.recorderId = songs.recorderId "\
	"inner join album_songs "\
	"on album_songs.songId = songs.songId "\
	"inner join albums "\
	"on albums.albumId = album_songs.albumId "\
	"group by albums.albumId "\
	"having albums.albumNumberOfTracks = number_of_tracks;" };

	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query, MYSQLX_NULL_TERMINATED);

	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(0), PARAM_END)) {
		cerr << "error binding parameters\n";
		exit(2);
	}
	mysqlx_result_t* res = mysqlx_execute(stmt);
	ResFunc(res);
}


void ConnDatabase::SelectAlbum_15(string musicianName)
{
	string query = {
		"select musicians.musicianName from musicians "\
		"inner join musician_songs on musicians.musicianId = musician_songs.musicianId "\
		"inner join songs on songs.songId = musician_songs.songId "\
		"group by musicians.musicianName "\
		"order by count(songs.songGenre) desc "\
		"limit 1;" };

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

	mysqlx_stmt_t* stmt = mysqlx_sql_new(sessConn(), query1, MYSQLX_NULL_TERMINATED);

	if (RESULT_OK != mysqlx_stmt_bind(stmt, PARAM_SINT(0), PARAM_STRING(musicianName.c_str()), PARAM_END)) {
		cerr << "error binding parameters\n";
		exit(2);
	}
	mysqlx_result_t* res = mysqlx_execute(stmt);
	ResFunc(res);
}


void ConnDatabase::Dbconn()
{
	char err_msg[256] = {};
	int err_code = 0;

	//creration of an sql connection aka session to the mysql server
	mysqlx_error_t* err;
	mysqlx_session_t* sess = mysqlx_get_session("localhost", DEFAULT_MYSQLX_PORT, "root", "root", "tamer", &err);
	if (NULL == sess) {
		cerr << mysqlx_error_message(err) << endl;
		exit(err_code);
	}
}




