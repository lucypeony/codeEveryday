//C++ 类和指针

#include<iostream>
using namespace std;


class Rectangle{
	int width, height;
	
	public:
	Rectangle(int x, int y):width(x),height(y){}
	int area(void){return width * height;}
};

int main(){
	Rectangle first(3,4);
	Rectangle *second;
	second=&first;
	
	cout<<"first rectangles area :"<<first.area()<<endl;
	cout<<"second rectangles area:"<<second->area()<<endl;
	
	return 0;
	
}
