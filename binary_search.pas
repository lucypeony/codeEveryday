const
	maxn=1000;

type
	arrayT=array[1..maxn] of integer;

var
	a:arrayT;
	i,n:integer;


function binary_search(var a:arrayT;lo,hi,myObject:integer):integer;
var	
	mid:integer;
begin
	while lo<hi do
	begin
		mid:=(lo+hi)div 2;
		if a[mid]=myObject then
		begin
			binary_search:=mid;
			exit;
		end;
		if myObject<a[mid] then
			hi:=mid
		else
			lo:=mid;
	end;
	binary_search:=-1;
end;



begin
	assign(input,'input.in');
	reset(input);
	assign(output,'output.out');
	rewrite(output);
	readln(n);
	for i:=1 to n do
		readln(a[i]);

	if binary_search(a,1,n,0)<>-1 then
		writeln('number found!')
	else
		writeln('number not found');

	close(input);
	close(output);


end.
