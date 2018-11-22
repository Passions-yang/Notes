
;将数据段中单词的前四个字母变成大写
assume cs:code,ds:date,ss:stack
stack segment
    dw 0,0,0,0,0,0,0,0
stack ends

data segment
    db '1. disply      '
    db '2. brow        '
    db '3. replace     '
    db '4. modify      '
data ends

code segment
    start:mov ax,data
          mov ds,ax
          
          mov ax,stack
          mov ss,ax
          mov sp,16
          
          mov cx,4
          push cx
          
          mov bx,0
        
       s1:mov si,3
          mov cx,4
          
        s:and ds:[bx+si],0dfh
          inc si
          loop s
          
          add bx,16
          pop cx
          loop s1
         
         
          mov bx,4c00h
          int 21h
code ends
end start
 
         