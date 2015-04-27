const max=240;

type 
	highArray=array[1..max] of integer;
	
var a,b,c:highArray;
	str1,str2:string;
	len1,len2,len3,i:integer;

procedure mul(a,b:highArray;var c:highArray;var len3:integer);
var
i,j:integer;
begin 
fillchar(c,sizeof(c),0);
	for i:=1 to len1 do 
		for j:=1 to len2 do 
		begin 
		inc(c[i+j-1],a[i]*b[j]);
		inc(c[i+j],c[i+j-1] div 10);
		c[i+j-1]:=c[i+j-1] mod 10;
		end;
		
	len3:=len1+len2+1;
	while c[len3]=0 do 
		dec(len3);
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
	
mul(a,b,c,len3);

for i:=1 to len3 do 
	write(c[len3+1-i]);
	
close(input);
close(output);

end.