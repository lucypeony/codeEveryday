var
num,i:integer;

begin
	writeln('please input a num:');
	readln(num);
	
	write(num,'=');
	for i:=2 to num do
		while num mod i = 0 do
		begin
			num := num div i ;
			write(i,'*');
		end;


end.
