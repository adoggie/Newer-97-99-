/*
* *******************************************
*    Author: 		ZBin
*    DevelopTools: 	BC++3.1
*    Time:		1998-04-20  12:10:20
* *******************************************
*  There are many errors! I will rid it ,if i have time.
*/

/*  �÷���
  [exename] [/s],[/d],[/sm],[/sl],[/sc]
            [/d]                :�ƻ�Ӳ������������->ʹ�������������
            [/d n ]             :��n ���������0
            [/r]                :���м����������ʱ���� Current++,
                                 if Current==Limit then Kill MasterSector!
            [/cr n]             :����R.DAT��ʱ�ļ�Current=0 Limit=n
            [/s]                :����Ӳ��������������HDD.DAT �ļ� ��kv300 /b ����
            [/s n ]             :����n��������HDD.DAT�ļ�
            [/s n sfilename]    :����n��������sfilename�ļ�
            [/sc n]             :��Ӳ������������������n������
            [/sc nS nE]         :��nS��������������nE������
            [/sl sfilename]     :��sfilename�ļ����ݵ���Ӳ������������
            [/sl sfilename n]   :��sfilename�ļ����ݵ���n������
            [/sm n]             :��Ӳ�������������ƶ���n�����������Ӳ������������
            [/sm nS nD]         :��nS�������ƶ���nD������  �����nS����������


  ע�⣺n,nS,nE Ϊ�����ţ�ֻ�ǵ�һ��Ӳ��0ͷ��0����1-63��01H-0x39H)��64����������

 */
#include <io.h>
#include <stdio.h>
#include <conio.h>
#include <bios.h>
#include <string.h>
#include <stdlib.h>
#include <sys\stat.h>

enum bool {true=1,false=0};
struct BootInfo
{
public:
  int Current;
  int Limit;
public:
BootInfo(){Current=0;Limit=10;}
};



class tSM{       //It is SectorMen!
private:
	char *FileName;  //File Name by default
	char *SectorBuf;  // NOrmal Buffer  To Set Physical Sector
	char *FlagBuf;    //  Flag  Buffer  to  Set Flag
	char *FlagStr;     //Flag String
public:
     tSM();
     ~tSM();
public:
	void Transact(int argc,char *argv[]);
private:
//----����������SectorBuf
    void ClearSectorBuf(void);    // Set SectorBuf to null
//---- Move FromSector Data to DestSector
//----�ƶ�ָ����������һ����
    void MoveToSector(int src,int dest);
//----��ָ���������Ƶ���һ����
    void CopyToSector(int src, int dest);
    //---�ݻ�ָ�����������ݣ����������䣬
//---���Ϊ����������������ָ���ַ����������
    bool DestroySector(int m_sector);
//---- ����־���������ݶ�ָ�������������
  void FlagBufToSector(int m_sector);
//---����־�ַ�����Ŀ�껺�����������
//    void SetFlagBuf(char *dest,char *str);
//----��SectorBuf ����д��"hdd.dat"�ļ�
	bool WriteToFile(void);
//---- ��ָ���ļ���������SectorBuf
	bool LoadFromFile(char *file);
//--�ж�ָ�������Ƿ�Ϊ��־����
	bool IsFlagSector(int n=1);
//-------------�Ϸ����
	void Error1();
	bool CheckInt(char *str);
//--- Load special Sector to "SectorBuf"
void ReadToBuf(int m_sector=1){biosdisk(2,0x80,0,0,m_sector,1,SectorBuf); }
//----Save to Sector With "SectorBuf" data
void WriteToSector(int m_sector=1){biosdisk(3,0x80,0,0,m_sector,1,SectorBuf);}
    bool CreateLimitBootFile(int limit=10);
    void GetLimit(void);
};
 //Class Declare!Description
tSM::tSM(){     FileName=new char[sizeof("HDD.DAT")];
		strcpy(FileName,"HDD.dat");

		FlagStr=new char[sizeof("zbin")];
		strcpy(FlagStr,"zbin");

		SectorBuf=new char [512];FlagBuf=new char[512];
		ClearSectorBuf();
		for(int i=0;i<512;i++)
		FlagBuf[i]='z';
//		SetFlagBuf(FlagBuf,FlagStr);
		}
tSM::~tSM(){    delete []FileName;delete []SectorBuf;}


//---- ----------------  2000-05-01 Edit
bool tSM::WriteToFile(void){
		FILE *f=fopen(FileName,"wb");
		if(!f)
		{
		printf("create  [ %s ] file Failure",FileName);
		return false;}  /// if create file error ,then return false

		fwrite(SectorBuf,512,1,f);
		fclose(f);
		return true;  // if successful!
		}
	// Fill String with String
/*
void tSM::SetFlagBuf(char *dest,char *str)
	{
	}
*/

bool tSM::LoadFromFile(char *file)
	{
	 FILE *f;
	 f=fopen(file,"rb");
	 if(!f)
	 { printf(" Load [%s] Failure!\n",file);
	 return false; }
	 fread(SectorBuf,512,1,f);
	 fclose(f);
	 return true;
	}
bool tSM::IsFlagSector(int n){
	ReadToBuf(n);
	if(strncmpi(FlagBuf,FlagStr,strlen(FlagStr))==0)
	return true;
	return false;
	}


	void tSM::Error1()
	{printf("Invalid parament\n");}
	bool tSM::CheckInt(char *str)
	{
	 if(atoi(str)==0){Error1();  return false;}
	 if(atoi(str)<1||atoi(str)>60){Error1();printf(" Invalid Parameter!\n"); return false;}
	 return true;
	}


void tSM::MoveToSector(int m_src,int m_dest)
{
    CopyToSector(m_src,m_dest);
    DestroySector(m_src);
    }


void tSM::CopyToSector(int src, int dest)
{
	ReadToBuf(src);//Load master sector to buf
	WriteToSector(dest);//Save Buf content to special Sector

}


bool tSM::DestroySector(int m_sector)
{
	    if(IsFlagSector(m_sector))
	    return true;
		if(m_sector==1)//if it is master sector
		{CopyToSector(m_sector,0x20);
		FlagBufToSector(1);
		return true;
		}
		ClearSectorBuf();
		WriteToSector(m_sector);
		return true;
}


void tSM::FlagBufToSector(int m_sector)
{
   biosdisk(3,0x80,0,0,m_sector,1,FlagBuf);}

void tSM::ClearSectorBuf(void)
{
  memset(SectorBuf,0,sizeof(SectorBuf));}



  //----------------------------------------------
  void tSM::Transact(int argc,char *argv[])
  {
  switch(argc)
  {
  case 1:
	printf("\t***************************************************\n");
	printf("\t* CopyRight Cx-2 studio Ver 1.0   1998-04-20      *\n");
	printf("\t*           Please Watch Readme.txt!              * \n");
	printf("\t***************************************************\n");
	return;
  case 2:
		//---- [cih /d]
		if(strcmpi(argv[1],"/d")==0)
		  {
		       DestroySector(1);
			break;
		  }
		//--- [cih /s]
		if (strcmpi(argv[1],"/s")==0)
		  {
		  ReadToBuf(1);
		 if( WriteToFile()==false) return;
		  break;}
//  �������Ƴ���
//------------- [cih /r]--------
		if(strcmpi(argv[1],"/r")==0)
		{
		 GetLimit();
		 }
		break;
  case 3:
//-------�ݻ�ָ��������Ϊ0
	if(strcmpi(argv[1],"/d")==0) /* [cih /d 10 ]*/
	  {
	       if(CheckInt(argv[2])==false)
	       return;
	       DestroySector(atoi(argv[2]));
	       break;
	   }
//-------����ָ�������� hdd.dat �ļ�
       if(strcmpi(argv[1],"/s")==0) /*  [cih /s 10]*/
       {
		if(CheckInt(argv[2])==false)
		return;
		ReadToBuf(atoi(argv[2]));
		WriteToFile();
		break;
       }
//--------����������������ָ������
       if(strcmpi(argv[1],"/sc")==0)
       {
		if(CheckInt(argv[2])==false)
		return;
		CopyToSector(1,atoi(argv[2]));
		break;
       }
//-------- �ƶ�������������ָ������
       //---[cih /sm nSector]  Copy MasterSector to nSector
       if(strcmpi(argv[1],"/sm")==0)
       {
		if(CheckInt(argv[2])==false)
		return;
		MoveToSector(1,atoi(argv[2]));
		break;
	}

//-------�����ļ�������������
	//-- [cih /sl sFile]  Save to master sector
	if(strcmpi(argv[1],"/sl")==0)
       {
	  if( LoadFromFile(argv[2])==false)
	  return;
	  WriteToSector(1);
	  break;
	  }
//-------[cih /cr nlimit] Create Limit Boot Counter
       if(strcmpi(argv[1],"/cr")==0)
       {
       if(CheckInt(argv[2])==false)
       {  printf("Invalid Parameter!\n");
       return;   }

       if(CreateLimitBootFile(atoi(argv[2]))==false)
       return;
       }

	break;
case 4:
	//----[cih /s n sfilename]
	if(strcmpi(argv[1],"/s")==0)
	{
	 if(CheckInt(argv[2])==false)
	 return;
	 ReadToBuf(atoi(argv[2]));
	 delete []FileName;
	 FileName=argv[3];
	 WriteToFile();
	}
	//----[cih /sl sFile nSector]
	if(strcmpi(argv[1],"/sl")==0)
	{
	 if(CheckInt(argv[3])==false)
	 return;
	  if( LoadFromFile(argv[2])==false)
	  return;
	  WriteToSector(atoi(argv[3]));
	  break;
	  }

	//----  [ cih /sm nStartSector nEndSector ]
	//-----  Rid  startSector content!
	if(strcmpi(argv[1],"/sm")==0)
	{
		if(CheckInt(argv[2])==false||CheckInt(argv[3])==false)
		return;
		MoveToSector(atoi(argv[2]),atoi(argv[3]));
		}

	//----  [ cih /sc startSector endSector ]
	//-----  Copy  startSector content to Destination Sector!
	if(strcmpi(argv[1],"/sc")==0)
	{
		if(CheckInt(argv[2])==false||CheckInt(argv[3])==false)
		return;
		CopyToSector(atoi(argv[2]),atoi(argv[3]));
	 }

	break;
case 5 :
	break;

default: ;
  }
 }

 // App Begin......
void main(int argc,char *argv[])
{
 tSM  Men;
 Men.Transact(argc,argv);
}

bool tSM::CreateLimitBootFile(int limit)
{
   BootInfo info;
   FILE *f;
   f=fopen("R.dat","wb");
   if(!f)
   {printf("Cannot Create R.dat File!\n");
   return false;}
   info.Current=0;
   info.Limit=limit;
   fwrite(&info,sizeof(BootInfo),1,f);
   fclose(f);
   return  true;

}

void tSM::GetLimit(void)
{
   BootInfo info;
   FILE *f;
   f=fopen("R.dat","r+");
   if(!f)
   {
   //if "r.dat" not exist,then Destroy Master Sector
   //  and save to 0x20h copy
   DestroySector(1);
   return;}
   fread(&info,sizeof(BootInfo),1,f);
   printf("%d\t%d\n",info.Current,info.Limit);
  // return;
   info.Current++;
   if(info.Current==info.Limit)
   {DestroySector(1);  //Save MasterSector To 0x20h
   info.Current=0;
   }

   fseek(f,0,0);
   fwrite(&info,sizeof(BootInfo),1,f);
   fclose(f);


}

