assume cs:code,ds:data,ss:stack
data segment
    dw 123,12356,456
    dw 16 dup(0)
data ends
stack segment
    dw 16 dup(0)
stack ends
code segment
    ;��ʼ�����ݶε�ַ
    main:mov ax,data
        mov ds,ax
        ;��ʼ��ջ
        mov ax,stack
        mov ss,ax
        mov sp,16
        mov si,0
        mov di,16
        ;�����������������ջ��
        call dtoc
        mov dl,21        ;��
        mov dh,16         ;��
        mov cl,5         ;��ɫ
        call show_str

        mov ax,4c00h
        int 21h
        
        ;ȡ����
   dtoc:pop ds:[di]
        mov ax,ds:[si]
        add si,2
        mov bx,10 
        ;�����ݵ������ջ��
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
        ;��ȡƫ����
        call _offset
        ;��ƫ����������bp�Ĵ�����
        mov bp,ax 
        ;������ɫ
        mov bl,cl 
real_show:pop cx
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
        jmp real_show
        ;����
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
