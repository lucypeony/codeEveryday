const n=10000;
type myarray=array[1..n] of longint;
var
a:myarray;
i,total:integer;


function merge_sort(var a:myarray;bp,mp,ep:longint):longint;
var
	t:myarray;
	next,i,j,number,n1,n2,k:longint;
begin
	number:=0;
        i:=bp;
        j:=mp+1;
        k:=bp;
        while (i<=mp)and(j<=ep) do
        begin
            if (a[i]<=a[j]) then
            begin
             t[k]:=a[i];
             inc(i);
             inc(k);
            end
            else
            begin
                t[k]:=a[j];
                inc(k);
                inc(j);
                inc(number,mp-i+1);
            end;
        end;

        while i<=mp do
        begin
            t[k]:=a[i];
            inc(k);
            inc(i);
        end;

        while j<=ep do
        begin
            t[k]:=a[j];
            inc(k);
            inc(j);
        end;

        for i:=bp to ep do
            a[i]:=t[i];

        inc(total,number);

	merge_sort:=number;
end;


function merge_count(var a:myarray;bp,ep:longint):integer;
var
	mp:longint;
begin
	if ep-bp <=0 then
		exit
	else
	begin
	mp:=(bp+ep) div 2;
	merge_count(a,bp,mp);
	merge_count(a,mp+1,ep);
	merge_sort(a,bp,mp,ep);
	end;
end;


begin
//init
assign(input,'count.in');
reset(input);
for i:=1 to n do
	read(a[i]);


i:=1;
total:=0;
merge_count(a,i,n);
writeln;
for i:=1 to n do
        write(a[i]:4);
writeln;


writeln(total);
close(input);
end.
