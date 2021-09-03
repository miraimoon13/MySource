.model  stack
.stack  10
.data
    b1  db          'Nhap 3 so: $'
    b2  db  10,13,  'MIN= $'      ;10 xuong dong,13 dau dong
.code
    main proc 
        ;khoi tao gia tri chuoi
        mov ax,@data
        mov ds,ax   ;lay dia chi segment cua data cho vao ds
        ;hien thi chuoi ky tu
        mov ah,9
        lea dx,b1   ;lay dia chi offset cua b1 chp vao bo nho dx
        int 21h     ;in dong b1
        ;nhap a
        mov ah,1    ;nhap vao 1 ky tu
        int 21h     ;nhap so t1
        mov bl,al   ;chuyen al(chua ma ascii so vua nhap) vao bl de k bi mat-> bl=a
        ;nhap b 
        int 21h     ;nhap so thu 2
        cmp bl,al   ;bl(dest)<al(source) CF=1,ngc lai CF=0
        jc t1       ;cf=1 thuc hien lenh nhay sang t1, cf=0 bo qua lenh nay thuc hien lenh tiep
        mov bl,al   ;
   t1:  ;bl=min(a,b)
        int 21h     ;nhap so t3 (al chua ma ascii cua so t3)
        cmp bl,al
        jc  t2
        mov bl,al
   t2:  ;bl = min(a,b,c)
         
        ;hien thi chuoi b2
        mov ah,9
        lea dx,b2
        int 21h
        ;hien thi min vua tim=bl len mh
        mov ah,2    ;hien thi ky tu len mh
        mov dl,bl   ;chuyen min vao dl:dia chi o nho can show
        int 21h     
       
   main endp
   end  main
    
    