const maxn=1000;
type
   arrayT = array[1..maxn] of integer;

var a  : arrayT;
   i,n : integer;

procedure swap(var a,b : integer);
var
   t : integer;
begin
   t:=b;
   b:=a;
   a:=t;
end; { swap }

function choosePivot(var a : arrayT;lo,hi:integer):integer;
begin
   choosePivot := (lo + hi) div 2 ;
end;

function partition(var a : arrayT;lo,hi:integer):integer;
var
   pivotIndex,pivotValue,storeIndex : integer;
begin
   pivotIndex:=choosePivot(a,lo,hi);
   pivotValue:=a[pivotIndex];
   swap(a[pivotIndex],a[hi]);
   storeIndex:=lo;
   for i:=lo to hi-1 do
      if a[i]<pivotValue then
	 begin
	 swap(a[i],a[storeIndex]);
	    storeIndex:=storeIndex + 1;
	 end;
	 swap(a[storeIndex],a[hi]);
   partition:=storeIndex;
end; { partition }


procedure quicksort(var a : arrayT;lo,hi : integer);
var
   p : integer;
begin 
   if lo < hi then
   begin
      p:=partition(a,lo,hi);
      quicksort(a,lo,p-1);
      quicksort(a,p+1,hi);
   end;
   

end; { quicksort }


begin
   assign(input,'quick.in');
   reset(input);
   assign(output,'quick.out');
   rewrite(output);
   readln(n);
   for i:=1 to n do
      read(a[i]);

   quicksort(a,1,n);

   writeln('sorted array:');
   for i:=1 to n do
      write(a[i]:4);
   
   close(input);
   close(output);

end.