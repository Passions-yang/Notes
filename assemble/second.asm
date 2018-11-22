assume cs:code

code segment
    mov bx,0
    mov cx,123
  s:add bx,236
    loop s
    
    mov ax,4c00H
    int 21h
code ends
end