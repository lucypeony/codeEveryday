const 
 max=240;
 
type 
	highArray=array[1..max] of integer;
	
var 
	a,b,c:highArray;
	str1,str2:string;
	i,len1,len2,len3:integer;
	
	
procedure subtract(a,b:highArray;var c:highArray;var len3:integer);
var 
len:integer;

begin 
fillchar(c,sizeof(c),0);

len:=len3;
	
for i:=1 to len do 
begin 
	if a[i]<b[i] then 
	begin 
		inc(a[i],10);
		dec(a[i+1]);
	end;
	c[i]:=a[i]-b[i];
end;

if c[len3]=0 then 
begin 
	dec(len3);
end;


end;
	
begin 
assign(input,'input.in');
reset(input);
assign(output,'output.out');
rewrite(output);

readln(str1);
readln(str2);

len1:=length(str1);
len2:=length(str2);
for i:=1 to len1 do 
	a[i]:=ord(str1[len1+1-i])-ord('0');
	
for i:=1 to len2 do 
	b[i]:=ord(str2[len2+1-i])-ord('0');

	len3:=len1;
	subtract(a,b,c,len3);
	
for i:=1 to len3 do 
	write(c[len3+1-i]);
	
close(input);
close(output);

end.