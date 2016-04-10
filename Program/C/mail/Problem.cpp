

//大河马：
//你好！

//下列问题发现，需求解决(类的声明）  谢谢！

//==== 我的要求是A、B两个类互相利用对方的成员变量
//====我想利用类B得到A类的成员Age,和利用类A得到类B中册成员Color
//==== B是A的成员 ,B构造时,得到A类的指针，保存在mp中



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
