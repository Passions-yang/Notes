assume cs:code,ds:data
    data segment
        db "welcome to xian"
        db 0
    data ends

    code segment

    start:mov ax,data
            mov ds,ax
            mov bx,0
             
            mov ax,0b800h
            mov es,ax
 
            
            mov ax,160
            sub ax,15
            mov cx,2
            div cx
            and al,0FEH
            mov ah,0
            mov ds:[16],25
            mul ds:[16]
            mov si,ax
            
            
            mov cx,15
          s:mov dl,ds:[bx]
            mov es:[si],dl
            mov es:[si+1],10001111B
            add si,2
            inc bx
            loop s
            
            mov ax,4c00h
            int 21h
    code ends
    end start
        