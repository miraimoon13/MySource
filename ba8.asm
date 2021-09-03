.model stack
.stack 10
.data
    mes1    db      'nhap cac chu cai thuong: $'
    mes2    db      10,13,'cac chu cai hoa: $' 
    b1      db      5 DUP(?),    '$'
.code
    main proc
        mov ax,@data
        mov ds,ax
        lea dx,mes1
        mov ah,9
        int 21h
        
        lea si,b1
        
        mov cx,5 
    nhap_tiep:
        mov ah,1
        int 21h
        sub al,20h
        mov [si],al  
        inc si
        dec cx
        cmp cx,0
        jnz nhap_tiep
        
        ;hien thi chuoi b1
        mov ah,9
        lea dx,mes2
        int 21h
        
        mov ah,9
        lea dx,b1
        int 21h
        main endp
    end main
        
        