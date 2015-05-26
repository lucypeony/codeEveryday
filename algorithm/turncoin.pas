const max=100;
var 
	a,b:array[1..max] of boolean;
	m,n:integer;
procedure print;
var 
	i:integer;
	p:boolean;
begin 
	inc(n);
	p:=true;
	for i:=1 to m do 
		if a[i] then p:=false;
		if p then 
		begin 
			writeln('total=',n);
			halt;
		end;
	end;
	
procedure turn(k:integer);
var i:integer;
begin 
	if k>m then k:=1;
	b:=a;
	for i:=1 to k do 
		b[i] :=not (a[k+1-i]);
	a:=b;
	print;
	turn(k+1);
end;	

begin 
	readln(m);
	fillchar(a,sizeof(a),false);
	n:=0;
	turn(1)
end.