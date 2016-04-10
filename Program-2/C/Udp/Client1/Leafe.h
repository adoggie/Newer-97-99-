//---------------------------------------------------------------------------
#ifndef LeafeH
#define LeafeH
//---------------------------------------------------------------------------
class tLeafe:public tLeafe
{
private:
    int ran_number;
    float a,b,c,d,e,f;
    float x,y;
    float x_pre,y_pre;
    float disp_x,disp_y;

    TForm   *m_form;
public:
    tLeafe(TForm *form,bool _bool);
    virtual __fastcall void Execute(void);
};


#endif

