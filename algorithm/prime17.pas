{每一个素数的倒数，都可以化为一个循环小数。
例如，1/7可以化为0.（142857），1/13可以化为0.(076923),
编程计算出17的倒数的循环小数形式。
（答案：0.(0588235294117647)}
const maxn=50;
prime=17;
var 
	yes:boolean;
	i,j,c,a,count,m,n,k:integer;
	s:array[1..maxn] of integer;
begin 
	//首先计算1/17的小数形式，结果存在数组中
	a:=1;
	for i:=1 to maxn do 
	begin 
		c:=a * 10 div prime;
		a:=a * 10 mod prime;
		s[i] :=c;
	end;
	
	
	//已经获得数据，前maxn位，现在可以判断循环节
	{for i:=1 to maxn do 
		write(s[i]);}
	for i:=1 to maxn do 
		for j:=i+1 to maxn do 
		begin 
			if s[j]=s[i] then 
			begin 
				yes:=true;
				for k:=1 to j-i do 
					if s[i+k]<>s[j+k] then 
						yes:=false;
				writeln(yes,i:4,j:4);		
				if yes=true then 
				begin 
					for k:=i to j-1 do 
						write(s[k]);
						
						halt;
				end;
			end;
		end;
	
end.