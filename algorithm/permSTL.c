#include<iostream>
#include<cstdio>
#include<algorithm>
#define maxN 4

using namespace std;

int main(){
	int p[maxN]={-1}；
	for(int i=0;i<maxN;++i)
		p[i]=i+1;
	
	do{
		for(int i=0;i<maxN;++i)
			printf("%d\t",p[i]);
		
		printf("\n");
	}while(next_permutation(p,p+maxN));
	return 0;
}