 public strlen

 .model  tiny
  
  .code

    strlen proc   far
   n0:  jmp n4
     len dw 0
  n4:  lodsb

    cmp al,0
    jne n1
    jmp exit
  n1:cmp al,24h
    je exit
 n2:   inc cs:[len]
    jmp n4
 exit:
     mov ax,cs:[len]
     
    retf
    strlen endp
     end
