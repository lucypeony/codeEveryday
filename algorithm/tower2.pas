var n:longint;
procedure try(n:longint);
var a:array[1..1000] of integer;
k,p,i,t:longint;
begin 
	fillchar(a,sizeof(a),0);
	k:=n;p:=0;t:=0;
	while k>0 do 
	begin 
		inc(p);
		a[p]:=k mod 2;
		if (a[p]<>0) and (t=0) then t:=p;
		k:=k div 2;
	end;
	for i:=p downto t+1 do 
		if a[i]=1 then 
			if i=2 then write('2+')
			else begin 
				write('2(');
				try(i-1);
				write(')+');
			end;
			if t=1 then write('2(0)')
			else begin 
				if t=2 then write('2')
					else begin 
						write('2(');
						try(t-1);
						write(')');
					end;
				end;
		
end;

begin 
	readln(n);
	try(n);
end.