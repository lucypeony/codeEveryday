type 
 stack=array[1..10000] of integer;
 var 
	s:stack;
	p:integer;
	a,d,r:integer;
	begin 
	fillchar(s,sizeof(s),0);
	p:=0;
	readln(a,d);
	repeat 
		inc(p);
		s[p]:=a mod d ;
		a :=a div d;
		until a=0;
		while p<> 0 do 
		begin 
		write(s[p]);
		dec(p);
		end;
		writeln;
		end.