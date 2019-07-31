#include <mysqlx/xapi.h>
#include <iostream>
#include<stdint.h>
#include <iostream>
#include "sqlDb.h"
#include<stdio.h>

using namespace std;
int main() {
	
	ConnDatabase DbMusican;
	DbMusican.Dbconn();

	string pass;
top:
	system("cls");

	cout << "\n==================================" << endl;
	cout << "    Welcome to The Music Project " << endl;
	cout << "==================================\n" << endl;

	cout << "Please Enter the Password to Gain Access to This Program:  ";
	{
		int choice_database;
		cin >> pass;
		if (pass == "1")
		{
			cin.ignore();
listMenu:		system("cls");
			cout <<
				"  \n  Main list of questions\n"
				"-----------------------------------------------:\n  "
				"1.  How much albums were recorded between Y1 and Y2.\n  "
				"2.  How much different songs a musician X recorded from date Y1 to date Y2.\n  "
				"3.  How much albums were a musician X involved from date Y1 to Y2.\n  "
				"4.  What is the most popular instrument from all over the years.\n  "
				"5.  Get list of all instruments from album A.\n  "
				"6.  Get the most successfull from date Y1 to Y2 (largest number of albums).\n  "  
				"7.  Get the most popular manufacturer (the manufacturer whose instruments were involved in the most musical number).\n  "
				"8.  How much musicians recorded over all the years.\n  "
				"9.  Who is the musician with the highest cooperations with other musicians.\n  "
				"10. What is the most popular janer.\n  "
				"11. Who is the recorder who has the largest number of songs from date Y1 to Y2.\n  "
				"12. What is the first album that was recorded in the studio.\n  "
				"13. List of all songs that included in 2 albums or more.\n  "
				"14. List of all technicans that was involved in the recording of a full album.\n  "
				"15. who is the most liked musician (the one that recorded songs in the largest number of janers).\n  "
				"16. Exit\n\n"
				<< endl;
			cout << "  Enter your choice(1-16):\n ";
			cout << "-----------------------------------------------:\n ";
			cin >> choice_database;
			cin.ignore();
			system("cls");

			if (choice_database == 1)
			{
				
				//cout << "the number of songs that " << fname << " " << last << " praticipate between dates: " << x << endl << endl;
				DbMusican.SelectAlbum_1("d1", "d2");  // The question Number 1
				system("pause");
				goto  top;
			}
			

			else if (choice_database == 2)
			{
				DbMusican.SelectAlbum_2("name", "d1", "d2"); // The question Number 1
				system("pause");
				goto  top;
			}

			else if (choice_database == 3)
			{
				DbMusican.SelectAlbum_3("name", "d1", "d2");   // The question Number 3
				system("pause");
				goto  top;
			}

			else if (choice_database == 4)
			{
				DbMusican.SelectAlbum_4();     // The question Number 4
				system("pause");
				goto  top;
			}

			else if (choice_database == 5)
			{
				DbMusican.SelectAlbum_5("NameAlbum");   // The question Number 5
				system("pause");
				goto  top;
			}

			else if (choice_database == 6)
			{
				DbMusican.SelectAlbum_6("name", "d1", "d2");  // The question Number 6
				system("pause");
				goto  top;
			}

			else if (choice_database == 7)
			{
				DbMusican.SelectAlbum_7();;    // The question Number 7
				system("pause");
				goto  top;
			}

			else if (choice_database == 8)
			{
				DbMusican.SelectAlbum_8();    // The question Number 8
				system("pause");
				goto  top;
			}

			else if (choice_database == 9)
			{
				DbMusican.SelectAlbum_9();    // The question Number 9
				system("pause");
				goto  top;
			}

			else if (choice_database == 10)
			{
				DbMusican.SelectAlbum_10();   // The question Number 10
				system("pause");
				goto  top;
			}

			else if (choice_database == 11)
			{
				DbMusican.SelectAlbum_11("d1", "d2");   // The question Number 11
				system("pause");
				goto  top;
			}

			else if (choice_database == 12)
			{
				DbMusican.SelectAlbum_12();    // The question Number 12
				system("pause");
				goto  top;
			}

			else if (choice_database == 13)
			{
				DbMusican.SelectAlbum_13();    // The question Number 13
				system("pause");
				goto  top;
			}

			else if (choice_database == 14)
			{
				DbMusican.SelectAlbum_14();    // The question Number 14
				system("pause");
				goto  top;
			}

			else if (choice_database == 15)
			{
				DbMusican.SelectAlbum_15("aa");  // The question Number 15
				system("pause");
				goto  top;
			}

			else if (choice_database == 16) // The question Number 16
			{
				return 0;   //exit
			}
		}
		else
		{
			cout << "Wrong Password Entered" << endl << endl << endl;
end:		system("pause");

			system("cls");
			goto top;
		}
		

		}
	}

