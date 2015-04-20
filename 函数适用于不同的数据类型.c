/*c语言，适用不同数据类型的函数*/



int in_array(const void *arr,int arr_len,const void *elem,int elem_size){
	int i;
	const void *p=arr;
	for(i=0;i<arr_len;i++,p+=elem_size)
		if(memcmp(p,elem,elem_size)==0)
			return 1;
		
	return 0;
}