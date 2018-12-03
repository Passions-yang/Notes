 ;将data中的字符查数据全部改为大写
assume cs:code,ds:data
data segment
    db 'conversation',0
    db 'hello',0
    db 'world',0
data ends
code segment
    main:mov ax,data
        mov ds,ax
        mov si,0
        mov cx,3
        
      s:mov bx,cx       ;每次记录cx循环的值    
        call uuper      ;调用函数
        inc si          ;跳过字符查末尾
        loop s
        mov ax,4c00h
        int 21h
   uuper:mov cl,ds:[si]
        mov ch,0
        jcxz ok         ;判断cx寄存器的值是否为0
        and byte ptr ds:[si],11011111B
        inc si
      ;  mov bp,si
        jmp uuper
    ok:mov cx,bx
        ret
code ends
end main