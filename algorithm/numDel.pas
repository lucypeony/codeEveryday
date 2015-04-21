label 10;
var
numStr:string;
i,j,k:integer;

begin
   readln(numStr);
   read(k);

   10:
   for j:=1 to k do
   begin
      for i:=1 to length(numStr)-1  do
	 if ord(numStr[i]) >= ord( numStr[i+1]) then
	 begin
	    delete(numStr,i,1);
	    goto 10;
	 end;{end if}
      end;{for j}

   writeln(numStr);
end.
   
      