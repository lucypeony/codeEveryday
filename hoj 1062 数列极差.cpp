/*
 数列极差

 在黑板上写了N个正整数组成的一个数列，进行如下操作： 每次擦去其中的两个数a和b，然后在数列中加入一个数a×b＋1，如此下去直至黑板上 剩下一个数，在所有按这种操作方式最后得到的数中，最大的为max，最小的为min， 则该数列的极差定义为M＝max－min。
 请你编程，对于给定的数列，计算极差。

 利用贪心算法

 输入n个数
 求出最大值：选取数组中最小的两个数，形成的结果放进去。重复执行
 求最小值：选取数组中的最大的两个数，形成的结果放进去，重复执行。
*/
#include<iostream>
#include<fstream>
#include<algorithm>

using namespace std; 

int cmp(int a, int b) {
	return a > b;
}

int cmp2(int a, int b) {
	return a < b;
}

int main() {
	ifstream fin("shulie.in");
	int n;
	const int MAX_N = 50001;
	int a[MAX_N], b[MAX_N];
	fin>> n;
	for (int i = 0; i < n; i++) {
		fin >> a[i];
		b[i] = a[i];
	}
	fin.close();

	//calculate the MAX value
	int t = n;
	while (t >2) {
		sort(a, a+t,cmp);
		a[t-2] = a[t-1] * a[t-2] + 1;
		t=t-1;
	}
	int x = a[0] * a[1] + 1;

	//calculate the MIN value
	t = n;
	while (t >2) {
		sort( b, b + t,cmp2);
		b[t - 2] = b[t - 2] * b[t - 1] + 1;
		t--;
	}
	int y = b[0] * b[1] + 1;


	cout << x-y << endl;

	return 0;
}
