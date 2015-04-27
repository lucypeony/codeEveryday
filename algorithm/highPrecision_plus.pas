const max=240;

type 
	highArray=array[1..max] of integer;
	
var a,b,c:highArray;
	str1,str2:string;
	len1,len2,len3,i:integer;

procedure plus(a,b:highArray;var c:highArray;var len3:integer);
var i,len:integer;
begin 
fillchar(c,sizeof(c),0);

if len1>len2 then len:=len1
	else len:=len2;
	
for i:=1 to len do 
begin 
	c[i]:=c[i]+a[i]+b[i];
	if c[i] >= 10 then 
	begin 
		dec(c[i],10);
		c[i+1]:=c[i+1] + 1;
	end;
end;

if c[len+1]>0 then inc(len);
len3:=len;
end;	
	

begin 
assign(input,'input.in');
assign(output,'output.out');
reset(input);
rewrite(output);
readln(str1);
readln(str2);
len1:=length(str1);
len2:=length(str2);
for i:=1 to len1 do 
	a[i]:=ord(str1[len1+1-i])-ord('0');
	
for i:=1 to len2 do 
	b[i]:=ord(str2[len2+1-i])-ord('0');
	
plus(a,b,c,len3);

for i:=1 to len3 do 
	write(c[len3+1-i]);
	
close(input);
close(output);

end.