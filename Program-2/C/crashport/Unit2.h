//---------------------------------------------------------------------------
#ifndef Unit2H
#define Unit2H
//---------------------------------------------------------------------------

class MyThread: public TThread
{
public:
    MyThread(bool run):TThread(run){ }
    void __fastcall Execute();


};

#endif
 