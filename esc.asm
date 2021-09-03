.model small
.stack 10
.data
    mes1    db          'nhap cac chu cai thuong: $'
    mes2    db  10,13,    'cac chu cai hoa: $'
    mes3    db  10,13,    'chua co chu cai duong nhap:$'
    b1      db 100 DUP(?) ,
.code
    main proc
        mov ax,@data
        mov ds,ax
        lea si,b1
        
        lea dx,mes1
        mov ah,9
        int 21h
        
        mov cx,0
     
        mov ah,1
        int 21h
        cmp al,27
        jz thong_bao1
        sub al, 20h
        mov [si],al
        inc si
        inc cx  
   nhap_tiep:        
        mov ah,1
        int 21h
        cmp al,27
        jz  hien_thi 
        sub al,20h
        mov [si],al
        inc si
        inc cx
        
        jmp nhap_tiep
        
   hien_thi:
        mov ah,9
        lea dx,mes2
        int 21h
        
        lea si,b1 
   hienThi_tiep:
        mov dl,[si]
        mov ah,2
        int 21h
        inc si
        dec cx
        cmp cx,0      
        jnz hienThi_tiep
        jmp thoat
    thong_bao1:
        mov ah,9
        lea dx,mes3
        int 21h
    thoat:
    
    main endp
    end main
        
        
    