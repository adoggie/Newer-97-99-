//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "tProgressBar.h"
   
tProgressBar::tProgressBar(TRect Rc)
{
SetRect(Rc);

}

int tProgressBar::m_color=0;
ALIGNMODE tProgressBar::m_align=MIDDLE;
int tProgressBar::m_thick=3;
int tProgressBar::m_seperatelinecolor=0;
double tProgressBar::m_linewidth=0.025 ;   //毫米



void tProgressBar::DrawSeperateLine(SIDE side)
{
  int Pixels=GetDeviceCaps(Printer()->Handle,LOGPIXELSX);
   int w=Pixels/2.54*m_linewidth;
   TPrinter *p=Printer();
   switch(m_seperatelinecolor)
   {
   case 0: m_seperatelinecolor=clBlack;break;
   case 1:m_seperatelinecolor=clRed; break;
   case 2: m_seperatelinecolor=clGreen;break;
   case 3: m_seperatelinecolor=clBlue; break;
   default:m_seperatelinecolor=clBlack;}

   p->Canvas->Brush->Color=(TColor)m_seperatelinecolor;

   p->Canvas->Brush->Style=bsBDiagonal ;
   p->Canvas->FillRect(TRect(100,100,100+w,200));


}


void tProgressBar::Draw()
{



        TPrinter *p=Printer();
        switch(m_color)
        {
        case 0:/*black*/
               m_color=clBlack;
               break;
        case 1:/*Red*/
                m_color=clRed;
                break;
        case 2:/*green*/
                m_color=clGreen;
                break;
        case 3:/*blue*/
                m_color=clBlue;
                break;
        default: m_color=clBlack;}

        m_thick=m_rc.Height()/10*m_thick;
        TRect rc(m_rc.Left,m_rc.Top+m_thick,m_rc.Right,m_rc.Bottom-m_thick);

        p->Canvas->Brush->Color=(TColor)m_color;
        p->Canvas->Brush->Style=bsBDiagonal ;
     /*
         if(IsBarDraw)     //画进度条
       { // return;  //ruguo  不可用 ，则不画
         m_height=(int)m_rc.Height()/m_per;
         rc.left=m_rc.left;
         rc.top=m_rc.top+(m_rc.Height()-m_height)/2;
         rc.right=m_rc.right;
         rc.bottom=m_rc.bottom-(m_rc.Height()-m_height)/2;
         p->Canvas->Brush->Color=clBlack;
         p->Canvas->FillRect(rc);
        }
        p->Canvas->MoveTo(m_rc.left,m_rc.top);
        p->Canvas->LineTo(m_rc.right,m_rc.top);
        p->Canvas->MoveTo(m_rc.left,m_rc.bottom);
        p->Canvas->LineTo(m_rc.right,m_rc.bottom);

       */

        }
                                //---------------------------------------------------------------------------

 /*
void tProgressBar::operator +=(tProgressBar & bar)
{
m_rc.right=bar.m_rc.right;
m_rc.bottom=bar.m_rc.bottom;
bar.m_Enable=false;

}
   */
