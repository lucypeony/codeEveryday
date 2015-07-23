//infix convert to postfix
const n=255;
type 	
	mystack=array[1..n] of char;
	mystring=record
		data:array[1..n] of char;
		len:integer;
	end;
var
stack:mystack;
top,i:integer;
s1:string;
s,sp:mystring;


function isdigit(c:char):boolean;
begin
	if (c>='0') and (c<='9') then
		isdigit:=true
	else
		isdigit:=false;
end;


function empty(stack:mystack):boolean;
begin
	if top=0 then
		empty:=true
	else
		empty:=false;
end;
	
procedure push(var stack:mystack;c:char);
begin
	if top=n then
		writeln('stack is full!error!')
	else
	begin
		inc(top);
		stack[top]:=c;
	end;
end;

function pop(var stack:mystack):char;
begin
	if empty(stack) then
		writeln('error! Stack is empty!:pop')
	else
	begin
		pop:=stack[top];
		dec(top);
	end;
end;

function getTop(stack:mystack):char;
begin
	if empty(stack) then
		writeln('error!Stack is empty:get top')
	else		
		getTop:=stack[top];
end;

procedure preParser(var s1:string;var  s:mystring);
var i,j,len:integer;
begin
	j:=1;
    i:=1;
	len:=length(s1);
	while i<=len do
	begin
		if s1[i]=' ' then
			inc(i)
		else
		begin
			s.data[j]:=s1[i];
                        inc(i);
			inc(j);
		end;
	end;
	s.len:=j;
end;

function getPriority(c:char):integer;
var result:integer;
begin
	case c of
		'+','-':result:=1;
		'*','/':result:=2;
		'(':result:=0;
	end;
	getPriority:=result;
end;

procedure in2post(s:mystring;var sp:mystring);
var i,j,len:integer;
    temp:char;
	x,y:integer;
begin
	j:=1;
	len:=s.len;
       // writeln(len);
	for i:=1 to len do
	begin
		if isdigit(s.data[i]) then
		begin
			sp.data[j]:=s.data[i];
			inc(j);
		end
		else
			if s.data[i]='(' then
				push(stack,s.data[i])
			else if s.data[i]=')' then
			begin
				temp:=pop(stack);
				while temp<> '(' do
				begin
					sp.data[j]:=temp;
					inc(j);
					temp:=pop(stack);
				end;
			end
			else
			begin
				if empty(stack) then 
					push(stack,s.data[i])
				else
				begin
					//writeln('top , data-i',getTop(stack),s.data[i]);
					x:=getPriority(getTop(stack));
					y:=getPriority(s.data[i]);
					if x>=y then
					begin
					writeln('x,y:',x:3,y:3);
					sp.data[j]:=pop(stack);
					inc(j);
					end
					else
						push(stack,s.data[i]);
				end;
			end;

	end;
	
	
	while not empty(stack) do 
	begin 
		temp:=pop(stack);
		sp.data[j]:=temp;
		inc(j);
	
	end;
	
	
	
	sp.len:=j;
end;

begin
	//get input
	readln(s1);

	//解析字符串
	preParser(s1,s);

	in2post(s,sp);
	
	for i:=1 to sp.len do
		write(sp.data[i]);
end.
