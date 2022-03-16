#include<iostream>
using namespace std;

class Book{
	public:
		int isbn;
		string bookName;
		
		
		//在类内部定义函数
		string getName(){
			return bookName;
		}
		
		//在类外部定义函数
		void setName(string newName);
};



void Book::setName(string newName){
	bookName=newName;
	
}

int main(){
	Book myBook;
	
	myBook.isbn=1542;
	myBook.bookName="Hello world book";
	
	cout<<myBook.isbn<<endl;
	cout<<myBook.getName()<<endl;
	
	
	myBook.setName("New book Name");
	cout<<myBook.getName()<<endl;
	
	return 0;
}
