void statNumber_iterative(int n){
	int len,i,k,h,m;
	int count[10] ={0};
	int pow10[12] ={1,10,100,1000,10000,100000,1000000,10000000,100000000,1000000000,10000000000,100000000000};
	char d[16];  
	
	len = log10(n);
	m = len;
	sprintf(d,"%d",n);
	k = 0;
	h =d[k] - '0';
	n %=pow10[len];
	while(len > 0){
		if (h==0){
			count[0] += n+1;
			h =d[++k] -'0';
			--len;
			n %=pow10[len];
			continue;
		}
		for(i =0;i<10;i++){
			count[i] += h*len*pow10[len -1];
		}
		for(i = 0;i<h;i++){
			count[i] +=pow10[len];
		}
		
		count[h] += n + 1;
		
		--len;
		
		h =d[++k] -'0';
		n %=pow10[len];
	}
	
	for(i =0;i<=h;i++){
		count[i] += 1;
	}
	
	/**/
	for(i=0;i<=m;i ++){
		count[0] -= pow10[i];
	}
	for(i=0;i<10;i++){
		printf("%d/n",count[i]);
	}
}


		
int main(){
	int n;
	scanf("%d", &n);

	statNumber_iterative(n);
}