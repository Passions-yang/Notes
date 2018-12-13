;中断处理程序，因为需要设置中断向量表，中断程序会根据中断向量表中执行
;所以需要将中断处理程序放在中断向量表所指向的地址中。
;由于不知道中断在什么时候到来，所以需要将中断放在内存中。
;随时等待中断的到来，执行中断程序。而放在哪里比较合适呢。
;中断程序不能被覆盖，所以必须放在一个固定的地址，所有程序都不会被用到的地址
;本程序需要将“overflow”放在控制面板上，所以也不能够将字符串放在数据段中。
;也必须将字符串放在固定，其他程序不能访问的地址中。
assume cs:code,ds:data
data segment
    db "overflow"
data ends
code segment
     main:mov ax,code
        mov ds,ax
        mov si,offset do0
        mov ax,0
        mov es,ax
        mov di,200H
        mov cx,offset do0end-offset do0
        cld     ;设置df = 0 表明 si,di都是自增
        rep movsb
        ;设置中断向量表
        mov ax,0
        mov es,ax
        mov word ptr es:[0*4],200H
        mov word ptr es:[0*4+2],0
        ;造成除零溢出
        mov ax,10
        mov dx,10
        mov bx,0
        div bx       
        ;正常结束
        mov ax,4c00H 
        ;除法21号中断
        int 21h
         
    do0:jmp short do0start
        db "divide error!",0
        
do0start:mov ax,0
        mov ds,ax
        mov si,202H     ;设置ds:si指向字符串
        
        mov ax,0B800H
        mov es,ax
        mov di,12*160+36*2          ;设置es:di指向显存空间的中间位置
        
      s:mov al,[si]
        mov ah,0
        mov bx,0
        cmp ax,bx
        jz ok
        mov es:[di],al
        mov es:[di+1],0CAH
        inc si
        add di,2
        jmp s
      ok:nop  
        mov ax,4c00H
        int 21H
    do0end:nop
code ends
end main         
