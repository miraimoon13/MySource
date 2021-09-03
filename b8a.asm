; viet chuong trinh nhap vao tu ban phim 5 chu cai thuong
;hien thi len man hinh cac chu cai hoa tuong ung
.model small
.stack 10
.data
    b1   db     5 DUP(?),  '$' ;danh ra 5 o nho
.code 
    main    proc
        mov ax,@data 
        mov ds,ax
        lea si,b1
        
        mov cx,5 
    nhap_tiep:
        mov ah,1
        int 21h
        sub al,20h      ;tru 20h
        mov [si],al     ;nap al vao 5 o nho SI
        inc si
        dec cx
        cmp cx,0
        jnz nhap_tiep
        
        mov ah,9
        lea dx,b1
        int 21h
        main endp
    end main
           