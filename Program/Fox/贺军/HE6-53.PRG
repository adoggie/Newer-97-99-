return
set talk off
do mm
w=" "
set colo to w+/b+
@7,51 say "������"
@8,51 say "��"
@9,51 say "��"
@10,51 say "��"
@11,51 say "��"
@12,51 say "��"
@13,51 say "��"
@14,51 say "��"
set colo to /n
@16,43 clear to 20,65
set colo to g+/br,g+/n
@15,41 clear to 19,63
@16,42 say "�������̲���A��������"
@18,43 say "  ִ����?(Y/N/0)" get w
read
if w<>"y"
return
endif
@15,41 clear to 19,63
@17,43 say "[���ڻָ�] �� ��..."
set path to a:\
use a:&gg
copy to e:\hy\&gg   &&��Ƭ��
use a:&gg-r
copy to e:\hy\&gg-r &&�ձ���
use a:&gg-y
copy to e:\hy\&gg-y &&�±���
use a:&gg-t
copy to e:\hy\&gg-t &&���ۿ�
use a:&gg-h
copy to e:\hy\&gg-h &&����ܶ��
use a:&gg-d
copy to e:\hy\&gg-d
use a:&gg-xl
copy to e:\hy\&gg-xl
n=1
do while n<=6
store "&gg"+"-"+str(n,1) to aaa
use a:&aaa
copy to e:\hy\&aaa &&�����ϵ���
n=n+1
enddo
do mm
return

