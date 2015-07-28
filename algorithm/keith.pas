//is n a keith number ?
var
	n,m:integer;
	i,j,temp:integer;
	a:array[1..15] of integer;

begin
	readln(n);
	i:=0;
        m:=n;
	while n>0 do
	begin
		inc(i);
		a[i]:=n mod 10;
		n:=n div 10;
	end;

        for j:=1 to i do
                writeln(a[j]:6);
	repeat
                temp:=a[4];
		a[4]:=a[3];
		a[3]:=a[2];
		a[2]:=a[1];
		a[1]:=a[4]+a[3]+a[2]+temp;
		writeln(a[1]:6);
	until a[1]>m;

end.
