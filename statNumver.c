void statNumber(int n){
	int m,i,j,k,t,x,len = log10(n);
	char d[16];
	int pow10[12] ={1},count[10]={0};
	
	for(i = 1;i < 12;i++){
		pow10[i] = pow10[i-1]*10;
	}
	sprintf(d,"%d",n);
	m = n + 1;
	for(i = 0;i<=len;i++){
		x = d[i] -'0';
		t = (m-1)/pow10[len-1];
		
		count[x] += m - t*pow10[len -i];
		
		t /= 10;
		j =0;
		while(j<=x-1){
			count[i] += (t+1)*pow10[len - i];
			j++;
		}
		while(j < 10){
			count[j] += t * pow10[len - i];
			j++;
		}
		count[0] -= pow10[len-i];
	}
	for(j =0;j < 10; j++){
		printf("%d/n",count[j]);
	}
}
			
	