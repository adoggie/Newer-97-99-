//---------------------------------------------------------------------------
#ifndef tTextRectH
#define tTextRectH
#include "tText.cpp"


//==============区域类  有框，有文字
class tTextRect:public tText
{

public :

        tTextRect(TRect Rc,AnsiString String,AnsiString FontName,
                int FontSize,ALIGNMODE Align);
        tTextRect(){}


public:
       
       bool m_CellWidthByString;

public:
        virtual void IncX(int x);    //往右增长sizec长度
        virtual void IncY(int y); ///往下增长sizec长度
           virtual void Offset(int x,int y);
       void SetStringPos(void) ;
       void SetFont() ;
       void Draw();
       void Draw2();
};

//---------------------------------------------------------------------------
#endif
