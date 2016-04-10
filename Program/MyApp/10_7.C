#include <io.h>
#include <stdio.h>
#include <dos.h>
#include <conio.h>
//******************* To Send E-mail 1999-10-7 Z.Bin  ***************//
#define TRUE 1
#define FALSE 0
#define BOOL int
#define NUMBER 512
void calc1(char *s);
void calc2(char *);
void calc3(char *);
void calc4(char *);
void calc5(char *);
struct elements{
char *BeginPointer;
char  *EndPointer;
int Index;
BOOL IsClosed;
};
int count=0;
struct elements element[NUMBER];
int max;

void GetString(void )
{
//         printf("dkljf");

}
int ctoi(char c)
 { switch(c)
 {case '0':  return 0;
 case '1':return 1;
  default:;
  }
  return 2;
  }
char itoc(int i)
{
switch(i)
{  case 1:return '1';
  case 0:return '0';
  default: return ' ';
  }
}

void calc(char *s,char *e)
 {
 int line=5;  //  ! you xian ji
 int repeat=e-s+1;
 int i,k;
 while(line)
 {
 switch(line)
 {
 case 5:
	for(i=0;i<repeat;i++)
	{   if(*(s+i)=='!')
	    calc5((s+i));
  //	 printf("%s\n",s);

	 }
	 break;
case 4:
	for(i=0;i<repeat;i++)
	{   if(*(s+i)=='&')
	    calc4((s+i));
//	 printf("%s\n",s);
	 }
	 break;
case 3:
	for(i=0;i<repeat;i++)
	{   if(*(s+i)=='|')
	     calc3((s+i));
	 }

	 break;
case 2:
	for(i=0;i<repeat;i++)
	{   if(*(s+i)=='>')
	     calc2((s+i));
	 }

	 break;
 case 1:
	for(i=0;i<repeat;i++)
	{   if(*(s+i)=='=')
	     calc1((s+i));
	 }

	 break;
default:  ;
}
	 line--;



 }

}

void calc1(char *s)
 {
 int i;int a,b;
 char *p=s-1,*n=s+1;
 *s=' ';
 while(*p==' ')
 {   p--;   }
while(*n==' ')
{    n++;}
  a=ctoi(*p); b=ctoi(*n);
  if(b==a)
  i=1;
  else
  i=0;
  *s=itoc(i);
  *p=' '; *n=' ';


 }
 void calc2(char *s)
 {
 int i;int a,b;
 char *p=s-1,*n=s+1;
 *s=' ';
 while(*p==' ')
 {   p--;   }
while(*n==' ')
{    n++;}
  a=ctoi(*p); b=ctoi(*n);
  if(b>=a)
  i=1;
  else
  i=0;
  *s=itoc(i);
  *p=' '; *n=' ';


 }



 void calc3(char *s)
 {
 int i;
 char *p=s-1,*n=s+1;
 *s=' ';
 while(*p==' ')
 {   p--;   }
while(*n==' ')
{    n++;}
  i=ctoi(*p)|ctoi(*n);
  *s=itoc(i);
  *p=' '; *n=' ';


 }

 void calc4(char *s)
 {
 int i;
 char *p=s-1,*n=s+1;

 *s=' ';
 while(*p==' ')
 {   p--;   }
while(*n==' ')
{    n++;}
  i=ctoi(*p)&ctoi(*n);
  *s=itoc(i);
  *p=' '; *n=' ';

 }

 void calc5(char *s)
 {
 *s=' ';    //Set '!' bit is ' '
 s++;
 while(*s==' ')
 {
 s++;}
 if(*s=='1')
 *s='0';
 else
 *s='1';

 }

void check()
{
int count_=count;
int i,j,k;
k=count;
while(k)
{
for(i=1;i<=count_;i++)
{
	if(HasChild(element[i].BeginPointer,element[i].EndPointer))
	continue;
	 else
	 k--;

}
 }
 }

BOOL HasChild(char *s,char *e)
{    char *p;
	 for( p=s+1;p<e;p++)
	{
		if(*p=='(')
		return TRUE;
		else
		break;
	}
    *s=' ';*e=' ';
    calc(++s,--e);
    return FALSE;

}

BOOL find(char *p)
{
	int i=0;
   // printf("Pointer is: %c,%d \n ",*p,p);

//getchar();
  switch(*p)
  {
  case '#':  return FALSE;
  case '(':	element[++count].BeginPointer=p;
		element[count].Index=count;
		max=count;
		//printf("count is : %d\n",count);
		break;
  case ')':     for(i=count;i>=1;i--)
		{	if(element[i].IsClosed==FALSE)
			{    element[i].IsClosed=TRUE;
			     element[i].EndPointer=p;
  //printf("element[%d].index=%d,IsClosed=%d,Beginer=%d,Ender=%d\n",
    //		 i,element[i].Index,element[i].IsClosed,
    //		 element[i].BeginPointer,element[i].EndPointer);

			     break;
			}
		}
	       break;
  default:	;
  }
	if(!find(++p))
	{    return FALSE;}

return TRUE;

}
//////////////////////////
///////////////////////////
void fillstring(char *ss)
{

 int handle;char *pp; char *s;
long fl; int i,j;
 int copynumber;
 handle=open("output.dat",1);
 if(handle==-1)
{
 printf("error !open file error!");
exit(0);
}
fl= filelength(handle);
s=(char *)alloca(fl);
 read(handle,s,fl);
 // printf("%s\n",s);
 // getch();
pp=s;
 for(i=0;i<fl;i++)
 {    if(s[i]=='1'||s[i]=='0'||s[i]=='!'||s[i]=='&'||s[i]=='|'||s[i]=='>'
||s[i]=='='||s[i]=='('||s[i]==')')
{	*pp=s[i];   pp++;
  // printf("%s\n",s);
 //  getch();
   }
   else
   s[i]=' ';
   }
  *pp='#';
   copynumber=pp-s+1;
 strncpy(ss,s,copynumber);
//printf("%s\n",s);
//getch();
// printf("%s\n",ss);
// getch();

// fclose(p);

}
void main(void)
{

	int ii; int k;
//char *string="1|(0>(1>1)!(1))|(0>(1&0|0)|(1=1)&(1&0))#";
//char *string="(1|1)|(1&0)&!1=0#";
char string[520];
for(ii=0;ii<520;ii++)
string[ii]=' ';
clrscr();
fillstring(string);
for( ii=0;ii<=NUMBER;ii++)
{
element[ii].Index=0;
element[ii].IsClosed=FALSE;
element[ii].BeginPointer=0;
element[ii].EndPointer=0;
}
//  GetString();
find(string);
//printf("first address: %d \n",string);
/*for( k=1;k<=count;k++)
{
 printf("element[%d].Index=%d ,BeginPointer=%d,EndPointer=%d\n",
	   k,element[k].Index,element[k].BeginPointer-string,element[k].EndPointer-string);
	   }
*/
check();
calc(string,string+strlen(string)-2);
/*{asm
asm MOV AX,0x0600;
asm mov BX,0x0064;
asm mov cx,0;
asm mov dx,0x45;

asm int 0x10;
getch();

}
  */
printf("\nZ.Bin 99-10-12\nThe Result Is: \t \t %s",string);
getchar();

}
