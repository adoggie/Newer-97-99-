//---------------------------------------------------------------------------
#ifndef tProgressBarH
#define tProgressBarH
//#include "tTextRect.cpp"   //怪类
#include "trect.cpp"
//---------------------------------------------------------------------------
//***********
//*********** 区域类  有框，有文字 有进度条
// 排列方式
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
  // 进行进度表格的合并，取缔第二个单元格的出现
}  ;



#endif
