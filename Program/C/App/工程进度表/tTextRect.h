//---------------------------------------------------------------------------
#ifndef tTextRectH
#define tTextRectH
#include "tText.cpp"


//==============������  �п�������
class tTextRect:public tText
{

public :

        tTextRect(TRect Rc,AnsiString String,AnsiString FontName,
                int FontSize,ALIGNMODE Align);
        tTextRect(){}


public:
       
       bool m_CellWidthByString;

public:
        virtual void IncX(int x);    //��������sizec����
        virtual void IncY(int y); ///��������sizec����
           virtual void Offset(int x,int y);
       void SetStringPos(void) ;
       void SetFont() ;
       void Draw();
       void Draw2();
};

//---------------------------------------------------------------------------
#endif
