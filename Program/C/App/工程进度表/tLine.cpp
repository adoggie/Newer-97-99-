
#ifndef tline.cpp
#define tline.cpp

#include "common0.cpp"

class  tLine{

public:
        TPoint m_pts,m_pte;  //  coording (x1,y1)&(x2,y2)
        TColor m_color;
        int m_deep;     // Line deep
        bool m_visible;
        int m_style;   //Line Style--->Solid..dot..
public:
        tLine();
       
        void OutToPrinter();
   };


tLine::tLine()
{
        m_pts.x=m_pte.x=m_pts.y=m_pte.y=0;
        m_color=clBlack;
        m_deep=1;
        m_visible=true;
        m_style=psSolid;
}


void tLine::OutToPrinter()
{
        TPrinter *p=Printer();
        if( m_visible)
        {
        p->Canvas->Pen->Style=m_style;
        p->Canvas->MoveTo(m_pts.x,m_pts.y);
        p->Canvas->LineTo(m_pte.x,m_pte.y);
         }
}


#endif
