set talk off
set colo to /b+
@2,0 clear to 24,79
set colo to /n
@12,26 clear to 16,66
set colo to bg+/g+
@11,24 clear to 15,64
qq2="c:\wps;e:\wl;e:\jlz;e:\pctools"
@12,25 say "             【 路经设置 】"
@14,25 say "设置路经" get qq2
read
set path to &qq2
return
