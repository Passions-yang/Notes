;�����ݶ����ַ����ݣ�չʾ���Դ��У�������ָ����ʾλ�ã���ɫ�ȡ�
assume cs:code,ds:data
data segment
    db 'Welcome to xian',0
    db 10 dup(0)
data ends
code segment
    main:mov dl,21        ;��
        mov dh,16         ;��
        mov cl,5         ;��ɫ
        mov ax,data
        mov ds,ax
        mov si,0
        call show_str
        mov ax,4c00h
        int 21h
 show_str:mov ax,0B800H
        mov es,ax 
        ;��ȡƫ����
        call _offset
        ;��ƫ����������bp�Ĵ�����
        mov bp,ax 
        ;������ɫ
        mov bl,cl
        
   show:mov cl,ds:[si]
        mov ch,0
        ;�ж��Ƿ����
        jcxz ok
        mov es:[bp],cl
        ;Ⱦɫ
        mov es:[bp+1],bl
        ;�����������
        add bp,2
        inc si
        ;��ת
        jmp far ptr show
        ;����
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