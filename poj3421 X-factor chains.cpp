/*
lucypeony@hotmail.com

poj 3421 :X-factor chains
x <=220. 

1,get the prime factorilization of x: p1^m1 *p2^m2 *... ... * pn^mn
2, the longest list equals m1+m2+... ... +mn
3, the number of longest lists equals: (m1+m2+... ...+mn)! / (m1!)(m2!)...(mn!).
理解为，最长的列表必然为所有的质因数一个一个乘上去，一个乘上去，就是一个单独的数。所以，有多少个质因数，最长的列表就有多长。
例如：120=2*2*2*3*5
那么，其中一个序列就是： 2 (1*2),4(*2), 8(*2),24(*3),120(*5)
另外一种乘法顺序：3，6(*2),12(*2),60(*5),120(*2)
因此最长列表的种类就是所有质因数的排列（其中相同因子没有区别）。
*/
#include<iostream>
#include<fstream>
using namespace std; 

int primes[220], nums[220],total;
/*
There are 25 primes under 220. 
*/
void generate_primes(int n) {
	bool t[220];
	for (int i = 3; i*i < n; i += 2)
		if (!t[i])
			for (int j = i * i; j < n; j += 2 * i)
				t[j] = 1;
	primes[++total] = 2;
	for(int i=3;i<n;i+=2)
		if (!t[i])
		{
			primes[++total] = i;
		}
}

long long factorials[20];
void generate_factorials() {
	memset(factorials, 1, sizeof(factorials));
	factorials[1] = 1;
	for (int i = 2; i <= 20; i++) {
		factorials[i] = factorials[i - 1] * i;
	}
}

int main() {
	//ofstream cout("poj3421.txt");
	int n;
	//cin >> n; 
	n = 100;
	cout << "Hello 50";
	generate_primes(n);
	
	long long ans;
	int i = 1;

	int ans_1 = 0;
	while (n > 1) {
		while (n%primes[i]) {
			n /= primes[i];
			nums[i]++;
		}
		ans_1+=nums[i];
		i++;
	}

	generate_factorials();
	ans = factorials[ans_1];
	for (int j = 1; j <= i; j++) {
		ans /= factorials[nums[j]];
		cout << primes[j] << " " << nums[j] << endl;
	}
	cout << ans;
	cout << "Hello " << endl;
	cout << "hello" << endl;
	//cout.close();
	return 0;
	
}
