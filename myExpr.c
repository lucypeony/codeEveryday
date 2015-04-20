#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>
#define true 1 
#define false 0 
#define OPSETSIZE 8
typedef int Status;
unsigned char Prior[8][8]=
{ // 运算符优先级表 
 // '+' '-' '*' '/' '(' ')' '#' '^' 
 /*'+'*/'>','>','<','<','<','>','>','<', 
 /*'-'*/'>','>','<','<','<','>','>','<', 
 /*'*'*/'>','>','>','>','<','>','>','<', 
 /*'/'*/'>','>','>','>','<','>','>','<', 
 /*'('*/'<','<','<','<','<','=',' ','<', 
 /*')'*/'>','>','>','>',' ','>','>','>', 
 /*'#'*/'<','<','<','<','<',' ','=','<', 
 /*'^'*/'>','>','>','>','<','>','>','>' 
};

typedef struct StackChar
{
	char c;
	struct StackChar *next;
}SC;
typedef struct StackFloat
{
	float f;
	struct StackFloat *next;
}SF;

SC *SC_push(SC *s,char c)
{
	SC *p=(SC*)malloc(sizeof(SC));
	p->c =c ;
	p->next=s;
	return p;
}
SF *SF_push(SF *s,float f){
	SF *p=(SF*)malloc(sizeof(SF));
	p->f=f;
	p->next=s;
	return p;
}
SC *SC_pop(SC *s){
	SC *q=s;
	s=s->next;
	free(q);
	return s;
}
SF *SF_pop(SF *s){
	SF *q=s;
	s=s->next;
	free(q);
	return s;
}

float Operate(float a,unsigned char theta,float b){
	switch(theta){
		case '+':return a+b;
		case '-':return a-b;
		case '*':return a*b;
		case '/':return a/b;
		case '^':return pow(a,b);
		default:return 0;
	}
}

char OPSET[OPSETSIZE]={'+','-','*','/','(','0','#','^'};
Status In(char Test,char *TestOp){
	int Find=false;
	for(int i=0;i<OPSETSIZE;i++){
		if(Test == TestOp[i])
			Find=true;
	}
	return Find;
}
Status ReturnOpOrd(char op,char *TestOp){
	for(int i=0;i<OPSETSIZE;i++){
		if(op == TestOp[i])
			return i;
	}
}
char precede(char Aop,char Bop){
	return Prior[ReturnOpOrd(Aop,OPSET)][ReturnOpOrd(Bop,OPSET)];
}
float EvaluateExpr(char *myExpr){
	SC *OPTR=NULL;
	SF *OPND=NULL;
	char TempData[20];
	float Data,a,b;
	char theta,*c,Dr[]={'#','\0'};
	OPTR=SC_push(OPTR,'#');
	c=strcat(myExpr,Dr);
	strcpy(TempData,"\0");
	while(*c!='#'||OPTR->c!='#'){
		if(!In(*c,OPSET)){
			Dr[0]=*c;
			strcat(TempData,Dr);
			c++;
			if(In(*c,OPSET)){
				Data=atof(TempData);
				OPND=SF_push(OPND,Data);
				strcpy(TempData,"\0");
			}
		}
		else{
			switch(precede(OPTR->c,*c)){
				case '<':
					OPTR=SC_push(OPTR,*c);
					c++;
					break;
				case '=':
					OPTR=SC_pop(OPTR);
					c++;
					break;
				case '>':
					theta=OPTR->c;OPTR=SC_pop(OPTR);
					b=OPND->f;OPND=SF_pop(OPND);
					a=OPND->f;OPND=SF_pop(OPND);
					OPND=SF_push(OPND,Operate(a,theta,b));
					break;
			}
		}
	}
	return OPND->f;
}

int main(void){
	char s[128];
	puts("please input expresstion ");
	gets(s);
	puts("the value is:");
	printf("%s\b=%g\n",s,EvaluateExpr(s));
	system("pause");
	return 0;
	}
	

	
	