const
	maxn=240;
	base=26;
type
	charArray=array[1..maxn] of integer;
	
var
	a,b,c:charArray;
	str1,str2:string;
	i,len1,len2,len3:integer;
	
	
	
procedure plus( var a,b,c:charArray);
var
i:integer;

begin
if len1>len2 then len3:=len1
	else len3:=len2;
	
fillchar(c,sizeof(c),0);
	
for i:=1 to len3 do
	begin
		c[i] :=a[i]+b[i]+c[i];
		c[i]:=c[i] mod base;
		c[i+1]:=c[i] div base;
	end;

	if c[len3+1] <> 0 then
		inc(len3);
	
end;
	
begin
	assign(input,'input.in');
	reset(input);
	readln(str1);
	readln(str2);
	
	assign(output,'output.out');
	rewrite(output);
	
	len1:=length(str1);
	len2:=length(str2);
	
	for i:=1 to len1 do
		a[i]:=ord(str1[len1+1-i]) - ord('A');
		
	for i:=1 to len2 do
		b[i]:=ord(str2[len2+1-i])-ord('A');
		
	plus(a,b,c);
	
	
	for i:=1 to len3 do
		write(chr(c[len3+1-i] + ord('A'))) ;
	
	close(output);
	close(input);
	

end.
