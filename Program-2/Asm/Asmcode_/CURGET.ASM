.model tiny
.code

public curget
curget proc
;--------------------------------------
; Get cursor position and type
;
; outputs: CL - end line
;          CH - start line
;          DL - col
;          DH - row
;--------------------------------------


           xor    bh, bh               ; video page = 0
           mov    ah, 3
           int    10h                  ; BIOS int

           ret

curget endp
end
