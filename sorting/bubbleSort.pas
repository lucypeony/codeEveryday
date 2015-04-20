const
maxn=100;
var
   a	   : array[1..maxn] of integer;
   n,i,t   : integer;
   swapped : boolean;
begin
   assign(input,'bubble.in');
   reset(input);
   assign(output,'bubble.out');
   rewrite(output);
   readln(n);
   for i:=1 to n do
      read(a[i]);

   repeat
      swapped :=false;
      for i:=1 to n do
	 if a[i-1] > a[i] then
	 begin
	    t:=a[i-1];
	    a[i-1]:=a[i];
	    a[i]:=t;
	    swapped :=true;
	 end;
   until not swapped;

   for i:=1 to n do
      write(a[i]:4);
      
   close(output);
   close(input);

end.