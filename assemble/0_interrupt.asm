;�жϴ��������Ϊ��Ҫ�����ж��������жϳ��������ж���������ִ��
;������Ҫ���жϴ����������ж���������ָ��ĵ�ַ�С�
;���ڲ�֪���ж���ʲôʱ������������Ҫ���жϷ����ڴ��С�
;��ʱ�ȴ��жϵĵ�����ִ���жϳ��򡣶���������ȽϺ����ء�
;�жϳ����ܱ����ǣ����Ա������һ���̶��ĵ�ַ�����г��򶼲��ᱻ�õ��ĵ�ַ
;��������Ҫ����overflow�����ڿ�������ϣ�����Ҳ���ܹ����ַ����������ݶ��С�
;Ҳ���뽫�ַ������ڹ̶������������ܷ��ʵĵ�ַ�С�
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
        cld     ;����df = 0 ���� si,di��������
        rep movsb
        ;�����ж�������
        mov ax,0
        mov es,ax
        mov word ptr es:[0*4],200H
        mov word ptr es:[0*4+2],0
        ;��ɳ������
        mov ax,10
        mov dx,10
        mov bx,0
        div bx       
        ;��������
        mov ax,4c00H 
        ;����21���ж�
        int 21h
         
    do0:jmp short do0start
        db "divide error!",0
        
do0start:mov ax,0
        mov ds,ax
        mov si,202H     ;����ds:siָ���ַ���
        
        mov ax,0B800H
        mov es,ax
        mov di,12*160+36*2          ;����es:diָ���Դ�ռ���м�λ��
        
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
