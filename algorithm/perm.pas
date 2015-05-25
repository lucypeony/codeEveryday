type myArray=array[1..1000] of integer;

var
	a:myArray;
	i,k,m,n:integer;
	
procedure swap(var x,y:integer);
var t:integer;
begin
	t:=x;
	x:=y;
	y:=t;
end;

procedure perm(var a:myArray;k,m:integer);
begin
	if  k=m then
		begin
		for i:=1 to m do
			write(a[i]);

		writeln;
		end
	else
		begin
			for i:=k to m do
                begin
                swap(a[k],a[i]);
				perm(a,k+1,m);
                swap(a[k],a[i]);
                end;
		end;

end;



begin
	n:=2;
	for i:=1 to n do
		a[i]:=i;

	perm(a,1,n);
end.
