const
	maxnum=100000;
	
type
	arrayT=array[1..maxnum] of integer;

var
	n,m:longint;
	number,color:arrayT;
	x,y,z,i,sum:longint;
	
begin
	assign(input,'sum.in');
	assign(output,'sum.out');
	reset(input);
	rewrite(output);
	
	readln(n,m);
	for i:=1 to n do
		read(number[i]);
	readln;
	for i:=1 to n do
		read(color[i]);
		
		
	sum:=0;
	
	for x:=1 to n do
	begin
		z:=x;
		i:=1;
		while z<=n do
		begin
			z:=x+2*i;
			y:=(z+x)div 2;
			inc(i);
			if color[x]=color[z] then
			begin
				inc(sum,(x+z)*(number[x]+number[z]));
				//writeln(x,' ',y,' ',z,' ');
			end;
		end;
	end;
		
	writeln(sum mod 10007);
	
	close(input);
	close(output);
end.
