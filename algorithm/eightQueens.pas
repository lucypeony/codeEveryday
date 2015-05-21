const n=8;
var i,j,k:integer;
	x:array[1..n] of integer;

function place(k:integer):boolean;
var i:integer;
begin 
	place:=true;
	for i:=1 to k-1 do 
		if (x[i]=x[k]) or (abs(x[i]-x[k])=abs(i-k)) then 
			place:=false;
end;

procedure print;
var i:integer;
begin 
for i:=1 to n do 
	write(x[i]:4);
	writeln;
end;

begin 
	k:=1;
	x[k]:=0;
	while k>0 do 
	begin 
		x[k]:=x[k]+1;
		while(x[k]<=n) and ( not place(k))do 
			x[k]:=x[k]+1;
		if x[k]>n then 
			k:=k-1
		else if k=n then print
		else begin 
			k:=k+1;
			x[k]:=0;
		end
	end;
end.
		

end.