/*
    将数据文件转化成MASM.EXE能编译的数据

*/


#include <stdio.h>
#include <bios.h>
#include <io.h>
#include <dos.h>
#include <dir.h>
void main()
{
    char name[40];
    FILE *p;       int m,n;
    char *v;
    long size;
    int i,j;
    char ch;
    char *first="  \tcode segment\n  \t      assume  cs:code,ds:code  \n      \torg 100h\n  begin:\n";
    char *end="  \tcode ends\n \tend begin";
    int len1,len2;
    void *buf;
    char drive[3];char dir[20];char fname[10];char ext[4];
    char newname[50];
    char *extt=".asm";

    printf("enter the file name:\n");
    scanf("%s",  name);
    if((p=fopen(name,"rb"))==NULL)
    { printf("cann't open <  %s > file!\n",name);
    exit(0);}
    size=filelength(fileno(p));
    buf=(char *)malloc(size);
    fread(buf,size,1,p);
    fclose(p);
    fnsplit(name,drive,dir,fname,ext);
    fnmerge(newname,drive,dir,fname,extt);
    if((p=fopen(newname,"wb"))==NULL)
    {
    printf("can't creat < %s > file!\n",newname);
    exit(0);
    }
    fprintf(p,"%s\n",first);
    fprintf(p," db  ");
    for(i=0,v=buf;i<size;i++,v++)
    {
        n=*v;
        m=n;
        n=n&0x0f0;
        n=n>>4;
        m=m&0x0f;
        if(i==0)
        {
            fprintf(p,"0%x%xh,",n,m);
            continue;
        }
        if((i%15)==0)
        {
        fprintf(p,"0%x%xh",n,m);
        fputc(0x0d,p);
        fputc(0x0a,p);
        if(i==(size-1))
        continue;
        fprintf(p," db  ");}
        else
        {if(i==(size-1))
        fprintf(p,"0%x%xh",n,m);
        else
        fprintf(p,"0%x%xh,",n,m);
        }
    }
    fprintf(p,"\n%s",end);
    fcloseall();
    printf(" \t PLEASE EDIT %s\n",newname);

}
