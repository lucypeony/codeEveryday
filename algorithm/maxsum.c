int maxsum(int *v,int n,int *besti,int *bestj){
	int sum=0;
	int i,j;
	for (i=1;i<=n;i++){
		int thissum=0;
		for(j=i;j<=n;j++){
			thissum+=v[j];
			if(thissum>sum){
				sum=thissum;
				*besti=i;
				*bestj=j;
			}
		}
	}
	return sum;
}

int maxsum_div(int *v,int l,int r){
	int k,sum=0;
	if(l==r)
		return v[l]>=0?v[l]:0;
	else{
		int center=(l+r)/2;
		int lsum=maxsum_div(v,l,center);
		int rsum=maxsum_div(v,center+1,r);
		
		int s1=0;
		int lefts=0;
		for(k=center;k>=l;k--){
			lefts+=v[k];
			if(lefts>s1)
				s1=lefts;
		}
		int s2=0;
		int rights=0;
		for (k=center+1;k<=r;k++){
			rights+=v[k];
			if(rights>s2)
				s2=rights;
		}
		
		sum=s1+s2;
		if(sum<lsum)
			sum=lsum;
		if(sum<rsum)
			sum=rsum;
		
	}
	return sum;
}

int maxsum_dyn(int *v,int n){
	int sum=0,b=0;
	int i;
	for(i=1;i<=n;i++){
		if(b>0)
			b+=v[i];
		else
			b=v[i];
		if(b>sum)
			sum=b;
	}
	return sum;
}