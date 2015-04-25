var

begin 

	readln(n);
	for i:=1 to n do 
	readln(d[i],w[i]);
	
	{对d[i]进行排序}
	repeat 
	 swapped :=false;
	 for i:=1 to n-1 do 
	  if w[i]<w[i+1] then 
		 begin 
		  swap(d[i],d[i+1]);
		  swap(w[i],w[i+1]);
		  swapped :=true;
		  end;
	until not swapped;
	
	{greedy }
	for i:=1 to n do 
	begin 
	if 
	
	end;
		  

end.