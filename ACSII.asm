
assume cs:code,ds:data

data segment
    db "shaHDDkH"
    db "HHHjklo"
data ends

code segment
    start:mov ax,data
          mov ds,ax
          
          mov bl,0
          mov cx,8
          
         s:mov al,[bx]
          and al,0dfh
          mov [bx],al
          inc bx
          loop s
                 
          inc bx
          mov  cx,7
        s1:mov al,[bx]
          or al,20h
          inc bx
          loop s1
        
        
          mov ax,4c00h
          int 21h
          
          
code ends
end start
