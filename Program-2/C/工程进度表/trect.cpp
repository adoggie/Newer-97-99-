//---------------------------------------------------------------------------
#ifndef trect.cpp
#define trect.cpp

#include "tLine.cpp"
//---------------------------------------------------------------------------
class tRect {

public:
        TRect m_rc;  //Rectangle
        tLine *m_top,*m_left,*m_right,*m_bottom;
public:
        tRect();
        ~tRect();
        tRect(TRect  rc);
public:
        void MoveTo(TPoint & pt);
        void SetRect(TRect rc);
        virtual void IncX(int x);    //往右增长sizec长度
        virtual void IncY(int y); ///往下增长sizec长度
        virtual void Offset(int x,int y);
        virtual void Draw();

//protected:
        void CreateLine();
        void Commone();
        void SetLinePos();};


void tRect::IncX(int x)
{
  m_rc.Right+=x;

  SetLinePos();
}

void tRect::IncY(int y)
{
  m_rc.Bottom+=y;
   SetLinePos();
}

void tRect::Offset(int x,int y)
{
  m_rc.Right+=x;
  m_rc.Left+=x;
  m_rc.Bottom+=y;
  m_rc.Top+=y;
    SetLinePos();

}



tRect::tRect()
{
        CreateLine();
}

void tRect::SetRect(TRect rc)
{
        m_rc=rc;
        SetLinePos();//调整各条边的位置
}


void tRect::CreateLine()
{
        m_top=new tLine();
        m_bottom=new tLine();
        m_left=new tLine();
        m_right=new tLine();
        SetLinePos();
}


void tRect::Commone()
{
    //TODO: Add your source code here
}


tRect::tRect(TRect  rc)
{
        m_rc=rc;
        CreateLine();
}


tRect::~tRect()
{
        delete m_top;
        delete m_left;
        delete m_right;
        delete m_bottom;
}


void tRect::SetLinePos()
{
        m_top->m_pts.x=m_rc.Left;
        m_top->m_pts.y=m_rc.Top;
        m_top->m_pte.x=m_rc.Right;
        m_top->m_pte.y=m_rc.Top;
 //------------------
        m_left->m_pts=m_top->m_pts;
        m_left->m_pte.x=m_rc.Left;
        m_left->m_pte.y=m_rc.Bottom;
 //-------------------
        m_right->m_pts=m_top->m_pte;
        m_right->m_pte.x=m_rc.Right;
        m_right->m_pte.y=m_rc.Bottom;
 //--------------
        m_bottom->m_pts=m_left->m_pte;
        m_bottom->m_pte=m_right->m_pte;


}

void tRect::MoveTo(TPoint & pt)
{

        int width,height;
        width=m_rc.Width();
        height=m_rc.Height();
        m_rc.Left=pt.x;
        m_rc.Top=pt.y;
        m_rc.Right=m_rc.Left+width;
        m_rc.Bottom=m_rc.Top+height;
        SetLinePos();

}





void tRect::Draw()
{
        m_left->OutToPrinter();
        m_top->OutToPrinter();
        m_right->OutToPrinter();
        m_bottom->OutToPrinter();
}
#endif
