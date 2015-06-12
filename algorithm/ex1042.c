#include<iostream>
#define MAX 1000
using namespace std;

int main(void)
{
	int n;
	while(scanf("%d",&n)==1 && n>=0)
	{
		int i,j;
		int a[MAX];
		int p,h;
		a[1]=1;
		p=1;
		for(i=2;i<=n;i++)
		{
			for(j=1,h=0;j<=p;j++)
			{
				a[j]=a[j]*i+h;
				h=a[j]/10;
				a[j]=a[j]%10;
			}
			while(h>0)
			{
				a[j]=h%10;
				h=h/10;
				j++;
			}
			p=j-1;
		}
		for(i=p;i>=2;i--)
		{
			printf("%d",a[i]);
		}
		printf("%d\n",a[i]);
	}
	return 0;
}