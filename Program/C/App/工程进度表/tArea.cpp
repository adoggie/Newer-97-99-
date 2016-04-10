//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "tArea.h"
 tArea::tArea(){Common();}
 tArea::~tArea(){m_Counter--;}
tArea::tArea(tArea & area)
       {m_rc=area.m_rc;Common();}
tArea::tArea(TRect & rc):m_rc(rc) {Common();}
 tArea::tArea(TPoint & pts,TPoint &pte)
        {m_rc=TRect(pts,pte);Common();}
tArea::tArea(int x1,int y1,int x2,int y2)
		{m_rc.left=x1;m_rc.top=y1;
		 m_rc.right=x2;m_rc.bottom=y2;
                 Common();
                 }


void tArea::EnableDraw(){m_Enable=true;} //Wether this Grid can Draw!
void tArea::DisableDraw(){m_Enable=false;}
void tArea::Common(){m_Counter++;m_Enable=true;}
void tArea::SetRect(TRect & rc){m_rc=rc;}
int  tArea::GetWidth() {return this->m_rc.Width();}
int  tArea::GetHeight() {return this->m_rc.Height();}

 //---------------------------------------------------------------------------
#pragma package(smart_init)
