/*
sakura
bzoj 2717 sakura
get input n, output the divisor number of (n!)^2



/*
sakura 
bzoj 2717 sakura
get input n, output the divisor number of (n!)^2
*/
#include<iostream>
using namespace std;

const int MAX_N = 1000000;
bool p[MAX_N];
int total;
int primes[MAX_N / 10],nums[MAX_N/10];
void generate_primes(int n) {
	//p[i]=0,i is prime
	//p[i]=1,i is not prime
	//two is also prime
	primes[1] = 2; total++;
	for (int i = 3; i*i< n; i += 2)
		if (!p[i]) {
			for (int j = i * i; j < n; j += 2 * i)
				p[j] = 1;
		}
	for (int i = 3; i < n; i += 2)
		if (!p[i])
			primes[++total] = i;
}
int main() {
	int n;
	cin >> n;
	generate_primes(n);

	for (int i = 2; i <= n; i++) {
		int i1 = 1; int x = i;
		while (x > 1) {
			while (x%primes[i1] == 0) {
				nums[i1]++;
				x/= primes[i1];
			}
			i1++;
		}
	}
	long long ans = 1;
	for (int i = 1; i <= total; i++)
		ans = (nums[i] * 2 + 1)*ans % 1000000007;

	cout << ans << endl;
	return 0;
}















*/
#include<iostream>
using namespace std;

const int MAX_N = 1000000;
bool p[MAX_N];
int total;
int primes[MAX_N / 10], nums[MAX_N / 10],rev[MAX_N];
void generate_primes(int n) {
	//p[i]=0,i is prime
	//p[i]=1,i is not prime
	//two is also prime
	primes[1] = 2; total++; rev[2] = 1;
	for (int i = 3; i*i< n; i += 2)
		if (!p[i]) {
			for (int j = i * i; j < n; j += 2 * i)
				p[j] = 1;
		}
	for (int i = 3; i < n; i += 2)
		if (!p[i])
		{
			primes[++total] = i;
			rev[i] = total;
		}
}
int main() {
	int n;
	cin >> n;
	generate_primes(n);

	for (int i = 2; i <= n; i++) {
		int x = i;
		for (int j = 1; j < total && x>1 && primes[j] * primes[j] <= x; ++j) {
			if (x%primes[j] == 0) {
				while (x%primes[j] == 0) {
					++nums[j];
					x /= primes[j];
				}
			}
		}
		if (x > 1) ++nums[rev[x]];
	}
	long long ans = 1;
	for (int i = 1; i <= total; i++)
		ans = (nums[i] * 2 + 1)*ans % 1000000007;

	cout << ans << endl;
	return 0;
}
