const
maxn=1000;
type
   line=record
	   x : integer;
	   y : integer;
	end;

var
   a	   : array[1..maxn] of line;
   i,n,ans : integer;
   now,temp	   : line;
   swapped : boolean;

procedure swap(var a,b : integer);
var
   t : integer;
begin
   t:=a;
   a:=b;
   b:=t;
end;

begin
   assign(input,'line.in');
   reset(input);
   assign(output,'line.out');
   rewrite(output);

   readln(n);
   for i:=1 to n do
      begin
      readln(a[i].x,a[i].y);
	 if a[i].x > a[i].y then
	    swap(a[i].x,a[i].y);
      end;

   
   repeat
      swapped :=false;
      for i:=1 to n-1 do
	 if a[i].x > a[i+1].x then
	 begin
	    temp :=a[i+1];
	    a[i+1] :=a[i];
	    a[i]:=temp;
	    swapped :=true;
	 end;
   until not swapped;

   now :=a[1];
   ans :=1;
   for i:=2 to n do
      if a[i].x >now.y then
	 begin
	    now :=a[i];
	    inc(ans);
	 end
      else
	 if a[i].y <= now.y then
	    now :=a[i];
   
   
   writeln(n - ans);
   
   close(input);
   close(output);
   

end.