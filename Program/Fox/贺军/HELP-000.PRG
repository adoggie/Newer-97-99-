set talk off
use hyf-5
do while .not.eof()
store t11 to st11
if st11="调度".or.st11="机加车间".or.st11="钳工";
.or.st11="五车"
repl t11 with "行输"
endif
skip
enddo
return
