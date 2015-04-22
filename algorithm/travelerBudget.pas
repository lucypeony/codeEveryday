var
value,over,way,x:array[0..500] of real;
l,c,dc,p0,ans:real;
i,j,n:integer;

begin
   readln(l,c,dc,p0,n);
   for i:=1 to n do
      readln(way[i],value[i]);

   for i:=0 to n do
   begin
      over[i]:=0;
      x[i]:=0;
   end;

   inc(n);
   way[n]:=1;
   value[n]:=0;

   i:=0;
   l:=c*dc;
   value[0] :=p0;way[0]:=0;over[0]:=0;
   repeat
      j:=i+1;
      if way[j] - way[i] > l then
      begin
	 writeln('noanswer');
	 halt
      end;

      while way[j] -way[i] <=l do
      begin
	 if value[j]<value[i] then break;
	 inc(j);
      end;

      if way[j]-way[i] <=1 then
	 if over[i]*dc >= way[j]-way[i] then
	    over[j]:=over[i]-(way[j]-way[i])/dc
	 else
	    x[i]:=(way[j]-way[i])/dc-over[i]
	 else
	 begin
	    x[i]:=c -over[i];
	    j := i+1;
	    over[j]:=c -(way[j]-way[i])/dc;
	 end;
      i:=j;
   until i=n;
   ans :=0;
   for i:=0 to n-1 do
      ans:=ans +x[i]*value[i];
   writeln(ans:0:2);
   readln;
end.