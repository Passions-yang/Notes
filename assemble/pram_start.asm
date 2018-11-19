assume cs:code

code segment
    dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah
 
    atart:mov bx,21
    hh:mov ax,0
    
       mov cx,7
      s:add ax,cs:[bx]
       add bx,2
       loop s  
        
       mov ax,4c00h
       int 21h
      
code ends
end hh
    
    
    