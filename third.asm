assume cs:code

code segment
    mov ax,0ffffh
    mov ds,ax
    mov bx,0 ;��ʼ��bx,��¼ƫ�Ƶ�ַ
    
    mov dx,0
    mov cx,12
    
  s:mov al,ds:[bx]
    mov ah,0
    inc bx
    add dx,ax
    loop s
    
    mov ax,4c00h
    int 21h
code ends
end
    
    
    
    
    