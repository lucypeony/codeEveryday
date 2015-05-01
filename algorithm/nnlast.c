#include<stdio.h>
int a[10][4]={{0},{1},{6,2,4,8},{1,3,9,7},{6,4},{5},{6},
		{1,7,9,3},{6,8,4,2},{1,9}};
int main(){
	
	int n,number;
	scanf("%d",&number);
	while(scanf("%d",&number)){
		switch(number%10){
			case 0:
			case 1:
			case 5:
			case 6：
				printf("%d\n",a[number%10][0]);
				break;
			case 2:
			case 3:
			case 7:
			case 8:
				printf("%d\n",[number%10][number%4]);
				break;
			case 4:
			case 9:
				printf("%d\n",a[number%10][number%2]);
				break;
				}
	}
	return 0;
}	
		