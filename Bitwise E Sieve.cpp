/*
E-Sieve 
*/

#include<iostream>

using namespace std;


//implement normal Sieve of Eratosthenes 
//using simple optimization to reduce size of prime array to half and reducing iterations

void normalSieve(int n) {
	//prime[i] is going to store true if i*2+1 is composite
	const int N = 1000000;
	bool prime[N / 2];
	memset(prime, false, sizeof(prime));

	//ignore 2 . loop starts from 3
	for (int i = 3; i*i < n; i += 2) {
		//if i is prime, mark all its multiples as composite
		if (prime[i / 2] == false)
			for (int j = i * i; j < n; j += i * 2)
				prime[j / 2] = true;
	}

	//writing 2 separately
	printf("2 ");

	//printing other primes
	for (int i = 3; i < n; i += 2)
		if (prime[i / 2] == false)
			printf("%d ", i);
}

//---------------------------------------------------------------------------------------------------

//Implement bitwise Sieve of Eratosthenes. 


//checks whether x is prime or composite
bool ifnotPrime(int prime[], int x) {
	/*
	checking whether the value of element is set or not. 
	Using prime[x/64], we find the slot in prime array. 
	To find the bit number, we divide x by 2 and take its mod with 32
	*/
	return (prime[x / 64] & (1 << ((x >> 1) & 31)));
}

//Mark x composite in prime[]
bool makeComposite(int prime[], int x) {
	/*
	Set a bit corresponding to given element. 
	Using prime[x/64], we find the slot in prime array. 
	To find the bit number, we divide x by 2 and take its mod with 32. 
	*/
	return prime[x / 64] |= (1 << ((x >> 1) & 31));
}

//prints all prime numbers smaller than n 
void bitWiseSieve(int n) {
	//Assuming that n takes 32 bits, we reduce size to n/64 from n/2
	const int N = 1000000;
	int prime[N / 64];

	//initializing values to 0
	memset(prime, 0, sizeof(prime));

	//2 is the only even prime so we can ignore that .
	//loop starts from 3 as we have used in sieve of Eratosthenes.
	for (int i = 3; i*i <= n; i += 2) {
		//if i is prime, mark all its multiple as composite.
		if (!ifnotPrime(prime, i))
			for (int j = i * i, k = i << 1; j < n; j += k)
				makeComposite(prime, j);
	}

	//writing 2 separately
	printf("2 ");

	//printing other primes
	for (int i = 3; i <= n; i += 2) {
		if (!ifnotPrime(prime, i))
			printf("%d ", i);
	}
}

//Driver code
int main() {
	int n = 100000;
	bitWiseSieve(n);

	cout << "hello world!";
	return 0;
}


