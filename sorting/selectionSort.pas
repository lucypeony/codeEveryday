var
n,i,j,iMin:integer;
a:array[1..1000] of integer;

begin
   readln(n);
   for i:=1 to n do
      read(a[i];

   for j:=1 to n do
   begin
      iMin:=j;
      for i:=j+1 to n do
	 if a[i]<a[iMin] then
	    iMin:=i;

      if iMin <> j then
      begin
	 t:=a[j];
	 a[j]:=a[iMin];
	 a[iMin]:=t;
	   end;
	   end;
	   

    for i:=1 to n do
      write(a[i]:4);
	   end.