//---------------------------------------------------------------------------
#ifndef tAreaH
#define tAreaH
 #include <vcl.h>
#include "common.cpp"
 class tArea  //区域----为画的抽象类
{
public:

        tArea()     ;
        ~tArea();
	tArea(tArea & area);
	tArea(TRect & rc);
	tArea(TPoint & pts,TPoint &pte);
	tArea(int x1,int y1,int x2,int y2) ;

public :
	void EnableDraw(); //Wether this Grid can Draw!
        void DisableDraw();
        void Common();
	void SetRect(TRect & rc);
        virtual int  GetWidth();
    	virtual int GetHeight();

	virtual void Draw()=0;//{cout<<"virtual class you call!"<<endl;}

public :
      	static int m_Counter;
        bool m_Enable;
        

	TRect m_rc;//


};

 int tArea::m_Counter=0;

//---------------------------------------------------------------------------
#endif
