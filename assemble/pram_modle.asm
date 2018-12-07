;将数据段中字符数据，展示在显存中，并可以指定显示位置，颜色等。
assume cs:code,ds:data
data segment
    db 'Welcome to xian'
    db 16 dup(0)
data ends
code segment
    main:call init
        mov cx,15
        push cx
        call copy_str
        mov ax,4c00h
        int 21h
copy_str:pop bx
        pop cx
        mov si,0
        mov di,cx
        mov ax,data
        mov ds,ax
        mov es,ax
        cld
        rep movsb
        push si
        push ax
        call upper
        push bx
        ret
  upper:pop ax
        pop bx
        pop si
        mov ds,bx
      s:and byte ptr ds:[si],11011111B
        inc si
        loop s
        mov si,15
        push si
        push bx
        call show_str
        push ax
        ret
    init:pop ax
        mov dl,21        ;行
        mov dh,16         ;列 
        mov cl,5         ;颜色  
        mov ch,0
        push dx
        push cx
        push ax
        ret
 show_str:pop ax
        pop bx
        mov ds,bx
        pop si
        pop cx
        pop dx
        push ax
         
        mov ax,0B800H
        mov es,ax 
        ;获取偏移量
        call _offset
        ;将偏移量保存在bp寄存器中
        mov bp,ax 
        ;保存颜色
        mov bl,cl
        
   show:mov cl,ds:[si]
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
        jmp far ptr show
        ;返回
    ok: ret    
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
