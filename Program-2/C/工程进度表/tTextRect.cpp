//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "tTextRect.h"

tTextRect::tTextRect(TRect Rc,AnsiString String,
                                AnsiString FontName,int FontSize,ALIGNMODE Align)
{       SetRect(Rc);

        m_align=Align;
       // m_rc=Rc;
        m_str=String;
        m_fontname=FontName;
        m_fontsize=FontSize;
    //    m_CellWidthByString=CellWidthByString;

        SetFont();    //if height higher than cell's height  do ...
 
        SetStringPos();

        }

void tTextRect::IncX(int x)
{
 tRect::IncX(x);
 SetStringPos();

}


void tTextRect::IncY(int y)
{
  tRect::IncY(y);
  SetStringPos();
}

 void tTextRect::Offset(int x,int y)
{

 tRect::Offset(x,y);
 SetStringPos();
}
void tTextRect::SetStringPos(void)
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
        m_pos.x=m_rc.Left+25;

        break;
        case CENTER:
        m_pos.x=(m_rc.Width()-w)/2+m_rc.Left;
        break;
        case RIGHT:
        m_pos.x=m_rc.Width()+m_rc.Left-w-25;
        break;
        default:;
        }

        m_pos.y=(m_rc.Height()-Printer()->Canvas->TextHeight(m_str))/2+
                        m_rc.Top;



}
void tTextRect::SetFont(){
        TPrinter *p=Printer();
        p->Canvas->Font->Name=m_fontname;
        p->Canvas->Font->Size=m_fontsize;

     step:

        if(p->Canvas->TextHeight(m_str)>=(m_rc.Height()-10 ))
        {
        p->Canvas->Font->Size--;
        goto step;
        }
        m_fontsize=p->Canvas->Font->Size;


        }


void tTextRect::Draw() {

        if(m_rc.Width()==0||m_rc.Height()==0)
        return;
       tText::Draw();
      tRect::Draw();


	}

      void tTextRect::Draw2(){

   //  SetFont();
        tText::Draw();
      }


//---------------------------------------------------------------------------
#pragma package(smart_init)
