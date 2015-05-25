program myPerm;
const max=5;
type
	arrayT=array[1..max] of char;
var
myArray:arrayT;
i,n:integer;

procedure swap(var x,y:char);
var
        tmp:char;
begin
    tmp:=x;
    x:=y;
    y:=tmp;
end;

procedure perm(var myArray:arrayT;k,m:integer);
var i:integer;
begin
	if  k=m then
	begin
		for i:=1 to k do 
			write(myArray[i]);
		writeln;
	end
	else
	begin
		for i:=k to m do
		begin
			swap(myArray[k],myArray[i]);
			perm(myArray,k+1,m);
			swap(myArray[k],myArray[i]);
		end;

	end;

end;

begin
for i:=1 to max do
	myArray[i]:=chr(ord('A') + i -1 );
	
perm(myArray,1,max);


end.
