;将下面数据段的所有字母变成大写  inner's ALL-purpose Symbolic Instruction Code. 
assume cs:code,ds:data
data segment
    db "Beginner's ALL-purpose Symbolic Instruction Code.",0
data ends
code segment                   
    ;初始化数据段，开始偏移地址，压入堆栈
    main:mov ax,data
        push ax
        call upper     
        call show
        mov ax,4c00h 
        int 21h
  ;将每一个字符变成大写                    
   upper:pop ax
        pop bx
        push ax
        mov ds,bx 
        mov si,0
        ;将每一个字符变成大写，写入到内存中
      s:mov al,byte ptr ds:[si]
        mov ah,0
        mov dx,0
        cmp ax,dx
        jz s_end
        cmp ax,61H
        jna s_inc
        cmp ax,7AH
        jnb s_inc
        and byte ptr ds:[si],11011111B
  s_inc:inc si
        jmp s
  s_end:pop ax
        push bx 
        push ax
        ret  
        
    show:   pop ax
            pop bx  ;数据段地址 
            mov ds,bx  ;数据段地址
            push ax  ;保存返回地址
            mov ax,0B800H
            mov es,ax  ;显存段地址
            mov di,160*12+6    ;显示位置   位置必须是偶数
            mov cl,0CAH    ;染色
            mov si,0   
            
        s0:mov al,ds:[si]
            mov ah,0
            mov bx,0
            cmp ax,bx
            jz s0_end
            mov byte ptr es:[di],al
            mov byte ptr es:[di+1],cl
            add di,2 
            inc si
            jmp s0 
     s0_end:ret                
code ends
end main
