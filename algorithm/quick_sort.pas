//quick sort
const n=5;
type myarray=array[1..n] of integer;
var
	a:myarray;
	i,j,k,r:integer;

procedure quick_sort(var a:myarray;bp,ep:integer);
var fp,flag,t:integer;
begin
	fp:=(bp+ep)div 2 ;
	flag:=a[fp];
	i:=bp;
	j:=ep;
	repeat
		while a[i]<flag do inc(i);
		while a[j]>flag do dec(j);
		if i<=j then
		begin
			t:=a[i];
			a[i]:=a[j];
			a[j]:=t;

			inc(i);
			dec(j);
		end;
	until  i>j;
	
	if i<ep then quick_sort(a,i,ep);
	if j>bp then quick_sort(a,bp,j);
end;
	
begin
//int my array
for i:=1 to n do
	read(a[i]);

quick_sort(a,1,n);

for i:=1 to n do
        write(a[i]:4);
end.
