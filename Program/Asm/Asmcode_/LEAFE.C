#include <graphics.h>
#include <stdlib.h>
#include <time.h>
main()
{int ran_number;
float a,b,c,d,e,f;
float x,y;
float x_pre,y_pre;
float disp_x,disp_y;
int gmode,gdriver=DETECT;
initgraph(&gdriver,&gmode,"f:\\tc");
randomize();
x=y=x_pre=y_pre=0;
while(kbhit()==0)
{ ran_number=random(100)+1;
if(ran_number==1)
{a=0;b=0;c=0;d=0.16;e=0;f=0;}
else if(ran_number>1&&ran_number<=86)
{a=0.85;b=0.04;c=-0.04;d=0.85;e=0;f=1.6;}
else if(ran_number>86&&ran_number<=93)
{a=0.20;b=-0.26;c=0.23;d=0.22;f=1.6;}
else
{a=-0.15;b=0.28;c=0.26;d=0.24;e=0;f=0.44;}
x=a*x_pre+b*y_pre+e;
y=c*x_pre+d*y_pre+f;
x_pre=x;
y_pre=y;
disp_x=(x+4)*639/8;
disp_y=y*47.9;
putpixel(disp_x,disp_y,GREEN	);
}
closegraph();
}