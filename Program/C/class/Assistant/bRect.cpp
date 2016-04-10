//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "bRect.h"
//#include "windows.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)


class BRect{

//private:
public:
 int top,left,right,bottom;

 public:
    BRect(int Top, int Left, int Bottom, int Right);
    BRect(TPoint &Pt,int Width,int Height);
    BRect(){SetRect(0,0,0,0);}
 public:

    int GetWidth(void);
    int GetHeight(void);
    void IncX(int Value);
    void IncY(int Value);
    void SetRect(int Top, int Left, int Bottom, int Right);
    void Offset(int X,int Y);
    void operator=(TRect  Rc);
    void Assign(TRect &Rc);
    void SetRect(TRect &Rc);

};

void BRect::Assign(TRect &Rc)
{
 Rc=TRect(left,top,right,bottom);
}

void BRect::Offset(int X,int Y)
{

 SetRect(left+X,top+Y,right+X,bottom+Y);
 
}
void BRect::SetRect( int Left,int Top, int Right, int Bottom)
{

  top=Top;
 left=Left;
 right=Right;
 bottom=Bottom;
}

void BRect::SetRect(TRect &Rc)
{

  top=Rc.top;
 left=Rc.left;
 right=Rc.right;
 bottom=Rc.bottom;
}

BRect::BRect(TPoint &Pt,int Width,int Height)
{
 top=Pt.y;
 left=Pt.x;
 right=left+Width;
 bottom=top+Height;

}

BRect::BRect(int Left,int Top, int Right,  int Bottom)
{
  SetRect(Left, Top,  Right,  Bottom);
}


int BRect::GetWidth(void)
{
  return right-top;
}


int BRect::GetHeight(void)
{
   return bottom-top;
}


void BRect::IncX(int Value)
{
   left+=Value;
}


void BRect::IncY(int Value)
{
    bottom+=Value;
}


void BRect::operator=(TRect  Rc)
{
    SetRect(Rc);
}



