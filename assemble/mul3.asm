assume cs:code,ds:data
data    segment
    dw 1,2,3,4,5,6,7,8
    dd 8 dup(0)
data ends
code segment
    main:mov ax,data
        mov ds,ax
        
        mov cx,8
        mov si,0
        mov di,16
       s:mov bx,ds:[si]
        call mul3
        mov ds:[16],ax
        mov ds:[18],dx
        add si,2
        add di,4
        loop s
        
      mul3: mov ax,bx
            mul bx
            mul bx
            ret
        
        mov ax,4c00h
        int 21h
code ends
end main