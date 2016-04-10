//---------------------------------------------------------------------------
#ifndef tTextH
#define tTextH
#include "tRect.cpp"

#include "common0.cpp"
//===========区域类   无框，有文字

//======= 打印实际字符串高度 ==========

//-----------Useage  tRect::m_rc

/*//-- About Thinking:   Now I Ignorl it
                The String Width possible long than tRect Area Width
                The String Height possible long than tRect Area Height
*/
class tText  :public tRect
{
        //改变文字在表格中的排列位置
public :
        ALIGNMODE m_align;// Default As CENTER & MIDDLE
        Line m_line;
	AnsiString m_str; ///框架内的文本字符窜
	int m_fontsize;      //文本的字符属性
        AnsiString m_fontname;

        TPoint m_pos;  //打印起始位置


public:

        // Generate an Area From Begin Point With Actual String Width
  	tText(Line line,AnsiString string,AnsiString FontName,int FontSize,ALIGNMODE Align=CENTER);
        tText(){}

public :
        void SetStringPos();

        virtual void Draw();


};


//---------------------------------------------------------------------------
#endif
