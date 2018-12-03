assume cs:code,ds:data
data segment
    db 'conversation'
data ends
code segment
    main:mov ax,data
        mov ds,ax
        mov si,0
        mov cx,12
        call uuper
        mov ax,4c00h
        int 21h
   uuper:and byte ptr ds:[si],11011111B
        inc si
        loop uuper
        ret
code ends
end main