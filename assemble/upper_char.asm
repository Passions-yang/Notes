assume cs:code,ds:data

data segment
    db 'ibm    '
    db 'dec    '
    db 'dos    '
    db 'vax    '
    dw 0
data ends

code segment
    start:mov ax,data
          mov ds,ax
          
          
          
          mov bx,0
          mov cx,3 ;���ѭ��Ϊ3
          
          
       s1:mov si,0
          mov ds:[1B],cx
          mov cx,4 ;�ڲ�ѭ��Ϊ4�� 
        s:mov ax,[si+bx]
          and ax,0DFH
          inc bx
          loop s
          
          add si,7 
          mov cx,ds:[1B]
          loop s1
          
          mov ax,4c00h
          int 21h
          
code ends
end start