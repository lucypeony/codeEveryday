const maxn=1000;
var
   n,i,j : integer;
   a	 : array[1..maxn] of integer;

procedure swap(var a,b : integer);
var t : integer;
begin
   t:=b;
   b:=a;
   a:=t;
end;

begin
   assign(input,'bubble1.in');
   reset(input);
   assign(output,'bubble1.out');
   rewrite(output);

   readln(n);

   for i:=1 to n do
      read(a[i]);

   for i:=1 to n-1 do
      for j:=i to n do
      begin
	 if a[i] > a[j] then
	    begin
	    swap(a[i],a[j]);
	       writeln('swapped ',i:4,j:4,a[i]:4,a[j]:4);
	    end;
	 writeln('i = ',i,' j = ',j,'compared a[i] a[j] ',a[i]:4,a[j]:4);
      end;

   writeln('Sorted array:');
   for i:=1 to n do
      write(a[i]:4);

   close(input);
   close(output);
end.