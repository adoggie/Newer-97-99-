//---------------------------------------------------------------------------
#ifndef tTextH
#define tTextH
#include "tRect.cpp"

#include "common0.cpp"
//===========������   �޿�������

//======= ��ӡʵ���ַ����߶� ==========

//-----------Useage  tRect::m_rc

/*//-- About Thinking:   Now I Ignorl it
                The String Width possible long than tRect Area Width
                The String Height possible long than tRect Area Height
*/
class tText  :public tRect
{
        //�ı������ڱ���е�����λ��
public :
        ALIGNMODE m_align;// Default As CENTER & MIDDLE
        Line m_line;
	AnsiString m_str; ///����ڵ��ı��ַ���
	int m_fontsize;      //�ı����ַ�����
        AnsiString m_fontname;

        TPoint m_pos;  //��ӡ��ʼλ��


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
