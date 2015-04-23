var
n,i,j,maxprice:longint;
left,right,p:array[0..1000] of longint;
f:array[0..1000] of longint;
swapped:boolean;

function max(x,y : longint):longint;
begin
   if x>y then
      max:=x
   else
      max:=y;
end; { max }

procedure swap(var x,y : longint);
var t : longint;
begin
   t:=x;
   x:=y;
   y:=t;
end; { swap }


begin
   assign(input,'input.in');
   reset(input);
   assign(output,'output.out');
   rewrite(output);

   readln(n);
   for i:=1 to n do
      readln(left[i],right[i],p[i]);

   {sort by right[]}
   repeat
      for i:=1 to n-1 do
	 if right[i]>right[i+1] then
	 begin
	    swap(left[i],left[i+1]);
	    swap(right[i],left[i+1]);
	    swap(p[i],p[i+1]);
	    swapped:=true;
	 end;
   until not swapped;


		 {dynamic plan}
		 for i:=1 to n do
		 for j:=0 to i-1 do
		  if left[i]>=right[j] then
		 f[i]:=max(f[j]+p[i],f[i]);

		 for i:=1 to n do
		    if f[i]>maxprice then
		 maxprice:=f[i];
		 write(maxprice);
		 
   
   close(input);
   close(output);
   
end.