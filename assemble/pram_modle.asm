;�����ݶ����ַ����ݣ�չʾ���Դ��У�������ָ����ʾλ�ã���ɫ�ȡ�
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
        ;ȡ�����Σ�ѭ������/copyĿ��ƫ�Ƶ�ַ
        pop cx 
        ;����һ�������ص�ַѹ��ջ����
        push ax
        mov si,0
        mov di,cx
        mov bx,data
        mov ds,bx
        mov es,bx
        cld
        rep movsb 
        ;���ε�ַ��upper��ʼ��ַѹ��ջ��
        push si
        push bx
        call upper
        ret
  upper:pop ax
        ;ȡ��
        pop bx
        pop si
        ;���ص�ַѹջ
        push ax
        mov cx,si
        mov ds,bx
      s:and byte ptr ds:[si],11011111B
        inc si
        loop s
        mov si,15
        ;����ʾ��ַƫ�����Ͷε�ַѹ��ջ
        push si
        push bx
        call show_str
        ret
init_show:pop ax
        pop cx
        pop bx
        pop si 
        push cx
        mov dl,21        ;��
        mov dh,16         ;�� 
        mov cl,5         ;��ɫ  
        mov ch,0
        push si
        push bx
        push dx
        push cx
        push ax
        ret
 show_str:call init_show
        ;��ɫ
        pop cx 
        ;����
        pop dx
        ;�ε�ַ 
        pop bx
        ;ƫ�Ƶ�ַ(Ҳ��ѭ����ʱ)
        pop si
        mov ds,bx
         
        mov ax,0B800H
        mov es,ax 
        ;��ȡƫ����
        call _offset
        ;��ƫ����������bp�Ĵ�����
        mov bp,ax 
        ;������ɫ
        mov bl,cl
        
        mov cx,si  
   show:mov bh,ds:[si]
        mov es:[bp],bh
        ;Ⱦɫ
        mov es:[bp+1],bl
        ;�����������
        add bp,2
        inc si
        ;��ת
        loop show
        ;����
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
