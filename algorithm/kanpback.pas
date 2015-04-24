var 
v,w:array[1..1000] of real;
swapped :boolean;
n,i:integer;
w,totalVaule,totalWeight:real;

begin 
assign(input,'input.in');
reset(input);
assign(output,'output');
rewrite(output);

readln(n,w);
for i:=1 to n do 
 readln(v[i],w[i]);
 
 swapped :=false;
 repeat 
	for i:=1 to n do 
		if v[i]/w[i] <v[i+1]/w[i+1] then
			begin
			swap(v[i]/w[i],v[i+1]/w[i+1]);
			swapped :=true;
			end;
 until not swapped;
			
	while totalWeight < w do 
	begin 
	  if totalWeight + w[i] > w then 
		totalVaule:=totalVaule + (w-totalWeight)*v[i]/totalWeight
	else
		begin 
		  totalWeight :=totalWeight + w[i];
		  totalVaule := totalVaule +v[i];
		end;
		inc(i);
	end;
	
	writeln('totalVaule',totalVaule:7:2);
		
		 
		
		

close(input);
close(output);
end.