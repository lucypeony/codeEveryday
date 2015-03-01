include<stdio.h>

void main(){
	printf("please input a number");
	int n;
	scanf("%d",&n);
	int len =log10(n);
	int count[10]={0};
	int pow10[12] ={1,10,100,1000,10000,100000,1000000,10000000,100000000,1000000000,10000000000,100000000000};
	int n1 =n;
	
	int m[len+1]={0};
	i = 0;
	while(n<>0){
		m[i]=n%10;
		n =n / 10;
		i++;
	}
	
	for(i=len;i<=0;i--){
		for(j=0;j<10;j++){
			count[j]=m[i]*(i+1)*10*pow[i];
		}
		for(j=1;j<m[i];j++){
			count[j] +=pow[i];
		}
		count[m[i]] += n1 - m[i]*pow[i];
		
	}
}