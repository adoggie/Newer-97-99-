//---------------------------------------------------------------------------
#ifndef tProgressBarH
#define tProgressBarH
//#include "tTextRect.cpp"   //����
#include "trect.cpp"
//---------------------------------------------------------------------------
//***********
//*********** ������  �п������� �н�����
// ���з�ʽ
//
class tProgressBar:public tRect
{
public:


public :
	tProgressBar(TRect Rc);

public:
       void Draw();

public:

       static ALIGNMODE m_align;
       static int m_color;
       static int m_thick;
       static int m_seperatelinecolor;
       static double m_linewidth;
       void DrawSeperateLine(SIDE side);
        //    void operator += (tProgressBar & bar);
  // ���н��ȱ��ĺϲ���ȡ�޵ڶ�����Ԫ��ĳ���
}  ;



#endif
