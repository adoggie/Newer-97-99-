//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "tText.h"




 tText::tText(Line line,AnsiString String, AnsiString FontName,int FontSize,ALIGNMODE Align)
 {
 m_line=line;
 m_str=String.Trim();
 m_align=Align;
 m_fontname=FontName;
 m_fontsize=FontSize;

 SetStringPos();
 }
 
void tText::SetStringPos()
{
  int w,h;
 TPrinter *p=Printer();
 p->Canvas->Font->Name=m_fontname;
 p->Canvas->Font->Size=m_fontsize;
 w=p->Canvas->TextWidth(m_str);
 h=p->Canvas->TextHeight(m_str);
 switch(m_align)
 {
 case LEFT:
          m_pos.x=m_line.sp.x+25;
 break;
 case CENTER:
        m_pos.x=(m_line.Width()-w)/2+m_line.sp.x;
 break;
 case RIGHT:
       m_pos.x=m_line.Width()+m_line.sp.x-w-25;
 break;
 default:;
 }
        m_pos.y=m_line.sp.y;

//---- Reset tRect's Rect Data
 tRect::SetRect(TRect(m_line.sp.x,m_line.sp.y,m_line.ep.x,m_line.ep.y+h));


}




 void tText::Draw()
 {
        TPrinter *p=Printer();
        p->Canvas->Font->Name=m_fontname;
        p->Canvas->Font->Size=m_fontsize;
        p->Canvas->TextOut(m_pos.x,m_pos.y,m_str);
 
 }


