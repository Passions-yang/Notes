;���������ݶε�������ĸ��ɴ�д  inner's ALL-purpose Symbolic Instruction Code. 
assume cs:code,ds:data
data segment
    db "Beginner's ALL-purpose Symbolic Instruction Code.",0
data ends
code segment                   
    ;��ʼ�����ݶΣ���ʼƫ�Ƶ�ַ��ѹ���ջ
    main:mov ax,data
        push ax
        call upper     
        call show
        mov ax,4c00h 
        int 21h
  ;��ÿһ���ַ���ɴ�д                    
   upper:pop ax
        pop bx
        push ax
        mov ds,bx 
        mov si,0
        ;��ÿһ���ַ���ɴ�д��д�뵽�ڴ���
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
            pop bx  ;���ݶε�ַ 
            mov ds,bx  ;���ݶε�ַ
            push ax  ;���淵�ص�ַ
            mov ax,0B800H
            mov es,ax  ;�Դ�ε�ַ
            mov di,160*12+6    ;��ʾλ��   λ�ñ�����ż��
            mov cl,0CAH    ;Ⱦɫ
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
