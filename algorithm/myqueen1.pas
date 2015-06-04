program myQueen;
const max=8;
var
	i:integer;
	count:integer;
	a:array[1..max] of integer;
	
procedure print;
var i,j:integer;
begin
	writeln(count);
	for i:=1 to max do
	begin
		for j:=1 to max do
		if j=a[i] then
			write('Q')
		else
			write('-');
	
		writeln;
	end;
	
	writeln;
end;

	

procedure trying(i:integer);
var	
	j,k:integer;
	f:boolean;
begin
	for j:=1 to max do
	begin
		f:=true;
		for k:=1 to i-1 do
		 if ((a[k]=j) or (abs(a[k]-j)=abs(k-i))) then
		  begin
		  f:=false;
		  break;
		  end;
		
		if f then
		begin
			a[i]:=j;
			if i=max then
			begin
				inc(count);
				print;
			end
				
			else
				trying(i+1);
		end;
	end;
end;	

	
begin
	assign(output,'result.txt');
	rewrite(output);
	for i:=1 to max do
		a[i]:=1 ;
		
	count :=0;
	trying(1);
	close(output);
end.
