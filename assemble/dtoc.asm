assume cs:code,ds:data,ss:stack
data segment
    dw 123,12356,456
    dw 16 dup(0)
data ends
stack segment
    dw 16 dup(0)
stack ends
code segment
    ;初始化数据段地址
    main:mov ax,data
        mov ds,ax
        ;初始化栈
        mov ax,stack
        mov ss,ax
        mov sp,16
        mov si,0
        mov di,16
        ;计算余数，倒序放入栈中
        call dtoc
        mov dl,21        ;行
        mov dh,16         ;列
        mov cl,5         ;颜色
        call show_str

        mov ax,4c00h
        int 21h
        
        ;取数据
   dtoc:pop ds:[di]
        mov ax,ds:[si]
        add si,2
        mov bx,10 
        ;将数据倒序放在栈中
      s:div bx
        add dx,30H
        push dx
        mov cx,ax
        jcxz no0
        mov dx,0
        jmp s
    no0:push ds:[di]
        ret
show_str:mov ax,0B800H
        mov es,ax 
        ;获取偏移量
        call _offset
        ;将偏移量保存在bp寄存器中
        mov bp,ax 
        ;保存颜色
        mov bl,cl 
real_show:pop cx
        mov ch,0
        ;判断是否结束
        jcxz ok
        mov es:[bp],cl
        ;染色
        mov es:[bp+1],bl
        ;往后便宜自增
        add bp,2
        inc si
        ;跳转
        jmp real_show
        ;返回
      ok:ret  
_offset:mov al,dl
        mov ah,0
        mov dl,160
        mul dl
        mov bx,ax
        mov ax,2
        mul dh
        add ax,bx
        ret      
 
code ends
end main
