

//�����
//��ã�

//�������ⷢ�֣�������(���������  лл��

//==== �ҵ�Ҫ����A��B�����໥�����öԷ��ĳ�Ա����
//====����������B�õ�A��ĳ�ԱAge,��������A�õ���B�в��ԱColor
//==== B��A�ĳ�Ա ,B����ʱ,�õ�A���ָ�룬������mp��



//==================================
//   Example 1:  Test OK!
//===================================

/*
class A;

class B{

public:
        int Color;
        A *mp;
        B(A *p){ mp=p;}

};

class A{

public:
        int Age;
        B *mp;
        void Action(){ mp=new B(this);}

};
*/


/*
//===========================================
//   Example 2:  Test Failure!
//   Purpose: Get Age From Class A
//=============================================

class A;

class B{

public:
        int Color;
        A *mp;
        int GetAge(void)const {return mp->Age;}
        B(A *p){ mp=p;}

};

class A{

public:
        int Age;
        B *mp;
        void Action(){ mp=new B(this);}

};

*/


//===========================================================
//  Example 3:  Test Failure!
//  Purpose: Get Age From Class A
//============================================================
 /*
 class B;

class A{

public:
        int Age;
        B *mp;
        void Action(){ mp=new B(this);}

};

class B{

public:
        int Color;
        A *mp;
        int GetAge(void)const {return mp->Age;}
        B(A *p){ mp=p;}

};

*/


//=================================================
// Example 4:  Test Ok!
// Purpose:  Get Color From B
//======================================================
/*
class A;

class B{

public:
        int Color;
        A *mp;
        B(A *p){ mp=p;}

};

class A{

public:
        int Age;
        B *mp;
        void Action(){ mp=new B(this);}
        int GetColor(void)const {return mp->Color;}

        };
*/


//=================================================
// Example 5:  Test Failure!
// Purpose: Get Age From Class A and Get Color From B
//======================================================
/*
class A;

class B{

public:
        int Color;
        A *mp;
        int GetAge(void)const {return mp->Age;}
        B(A *p){ mp=p;}

};

class A{

public:
        int Age;
        B *mp;
        void Action(){ mp=new B(this);}
        int GetColor(void)const {return mp->Color;}

        };
*/

/*===================================================================
                zbin Mail: zbpost@371.net  2000-05-25      */
