;将数据段中字符数据，展示在显存中，并可以指定显示位置，颜色等。
assume cs:code,ds:data
data segment
    db 'Welcome to xian'
    db 16 dup(0)
data ends
code segment
    main:
        mov cx,15
        push cx
        call copy_str
        mov ax,4c00h
        int 21h
copy_str:pop ax
        ;取出传参，循环次数/copy目的偏移地址
        pop cx 
        ;将上一函数返回地址压入栈这种
        push ax
        mov si,0
        mov di,cx
        mov bx,data
        mov ds,bx
        mov es,bx
        cld
        rep movsb 
        ;将段地址和upper开始地址压入栈中
        push si
        push bx
        call upper
        ret
  upper:pop ax
        ;取参
        pop bx
        pop si
        ;返回地址压栈
        push ax
        mov cx,si
        mov ds,bx
      s:and byte ptr ds:[si],11011111B
        inc si
        loop s
        mov si,15
        ;将显示地址偏移量和段地址压入栈
        push si
        push bx
        call show_str
        ret
init_show:pop ax
        pop cx
        pop bx
        pop si 
        push cx
        mov dl,21        ;行
        mov dh,16         ;列 
        mov cl,5         ;颜色  
        mov ch,0
        push si
        push bx
        push dx
        push cx
        push ax
        ret
 show_str:call init_show
        ;颜色
        pop cx 
        ;行列
        pop dx
        ;段地址 
        pop bx
        ;偏移地址(也是循环此时)
        pop si
        mov ds,bx
         
        mov ax,0B800H
        mov es,ax 
        ;获取偏移量
        call _offset
        ;将偏移量保存在bp寄存器中
        mov bp,ax 
        ;保存颜色
        mov bl,cl
        
        mov cx,si  
   show:mov bh,ds:[si]
        mov es:[bp],bh
        ;染色
        mov es:[bp+1],bl
        ;往后便宜自增
        add bp,2
        inc si
        ;跳转
        loop show
        ;返回
        ret    
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
