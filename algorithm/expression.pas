const number:set of char=['0'..'9'];
  op:set of char=['+','-','*','/','(',')'];

var
  expr:string;
  sp:array[1..100] of char;
  sn:array[1..100] of integer;
  t,tp,n,tn:integer;
function can_cal(ch:char):boolean;
begin
  if (ch='#') or (ch=')') or ((sp[tp] in ['*','/']) and (ch in ['+','-']))
	then can_cal:=true
	else can_cal:=false;
end;

procedure cal;
begin
	case sp[tp] of
		'+':sn[tn-1]:=sn[tn-1] + sn[tn];
		'-':sn[tn-1]:=sn[tn-1] - sn[tn];
		'*':sn[tn-1]:=sn[tn-1] * sn[tn];
		'/':sn[tn-1]:=sn[tn-1] div sn[tn];
		end;
	dec(tn);
	dec(tp);
end;

begin
	write('Expression:  ');
	readln(expr);
	expr :=expr +'#';
	tn:=0;tp:=1;sp[tp]:='#';t:=1;
	repeat
		if expr[t] in number then
		begin
			n:=0;
			repeat
				n:=n*10+ord(expr[t])-48;
				inc(t);
			until not (expr[t] in number);
			inc(tn);
			sn[tn]:=n;
		end
		else
		begin
			if(expr[t]='(') or not can_cal(expr[t]) then
			begin
				inc(tp);
				sp[tp]:=expr[t];
				inc(t);
			end
			else if expr[t] =')' then
			begin
			 while sp[tp]<>'(' do cal;
			 dec(tp);
			 inc(t);
			 end
			 else
				cal;
		end;
		until (expr[t]='#') and (sp[tp]='#');
		writeln(sn[1]);
end.
				
