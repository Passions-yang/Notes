 ;��data�е��ַ�������ȫ����Ϊ��д
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
        
      s:mov bx,cx       ;ÿ�μ�¼cxѭ����ֵ    
        call uuper      ;���ú���
        inc si          ;�����ַ���ĩβ
        loop s
        mov ax,4c00h
        int 21h
   uuper:mov cl,ds:[si]
        mov ch,0
        jcxz ok         ;�ж�cx�Ĵ�����ֵ�Ƿ�Ϊ0
        and byte ptr ds:[si],11011111B
        inc si
      ;  mov bp,si
        jmp uuper
    ok:mov cx,bx
        ret
code ends
end main