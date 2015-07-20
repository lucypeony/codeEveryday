const
	n=255;
var
	s:string;
	i,j,k:integer;
	stack:string[n];
	top:integer;
	
procedure push(t:char);
begin
	if top<n then
	begin
		inc(top);
		stack[top]:=t;
	end
	else
		writeln('error,stack is full');
		
end;


function  pop():char;
begin
	if top>0 then
	begin
		pop:=stack[top];
		dec(top);
	end
	else
		writeln('error');
end;

function isempty():boolean;
var len:integer;
begin
	isempty:=false;
	if top=0 then
		isempty:=true;
end;

function isbalance(var s:string):boolean;
var len:integer;
begin
	len:=length(s);

	for i:=1 to len do
	begin
		if (s[i]='(') or (s[i]='[') or (s[i]='{') or (s[i]='<')  then
			push(s[i]);
			
		if (s[i]=')') or (s[i]=']') or (s[i]='}') or (s[i]='>') then
		begin
			writeln(s[i]);
			if isempty() then
			begin
				writeln('The string is unbalanced');
				exit;
			end;
			
			case s[i] of
				']':if '[' <> pop() then
					begin
						writeln('can not balanced with ]');
						isbalance:=false;
						exit;
					end;
				')' :if '(' <> pop() then
					begin
						writeln('can not balanced with )');
						isbalance:=false;
						exit;
					end;
				'}':if '{' <> pop() then
					begin
						writeln('can not balanced with }');
						isbalance:=false;
						exit;
					end;
				'>':if '<' <> pop() then
					begin
						writeln('can not balanced with >');
						isbalance:=false;
						exit;
					end;
				end;
		end;	
	end;

	if isempty() then
		begin
			writeln('string is balanced1');
			isbalance:=true;
		end
		else
		begin
			writeln('string is not balanced2');
			isbalance:=false;
		end;
	
end;	
	
begin
	//init get input
	readln(s);
	
	isbalance(s);
end.
