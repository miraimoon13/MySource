;tim min khi an ESC  th1: k nhap so nao, th2:nhap 1 so, th3:nhap nhieu
.model stack
.stack 10
.data
    b1  db          'Nhap so: $'
    b2  db  ,10,13, 'Ban chua nhap so nao! $'
    b3  db  ,10,13, 'MIN: $'
.code
    main proc
        mov ax,@data
        mov ds,ax   ;lay dia chi segment cua ax vao ds
        ;hien thi chuoi gia tri
        mov ah,9h
        lea dx,b1
        int 21h
        ;TH1:k nhap so nao
        mov ah,1    ;nhap 1 ky tu 
        int 21h     
        cmp al,27   ;kiem tra 27(=gia tri ascii cua ESC)=al ZF=1 
        jz  khong_co_so ;ZF=1 nhay toi khong_co_so,ZF=0 bo qua t/hien lenh tiep
        mov bl,al   ;ZF=0 thuc hien chuyen al(vua nhap) vao bl de k bi mat
  
  nhap_tiep:       
        ;TH2:nhap 1 so
        mov ah,1    ;
        int 21h     ;nhap 1 so
        cmp al,27    
        jz  hien_thi_min
        ;TH3:nhap nhieu so
        cmp bl,al   ;nhap so tiep theo k phai ESC thi kiem tra bl<al thi cf=1 bo_qua,cf=0 gan al=bl
        jc  bo_qua  ;neu tim max thi thay jnc
        mov bl,al   ;

  bo_qua:   ;bl=min(a,b)
        jmp nhap_tiep
    
  hien_thi_min: ;bl=min
        ;hien thi chuo b3
        mov ah,9h
        lea dx,b3
        int 21h
        ;hien thi gia tri MIN=bl ra man hinh
        mov ah,2h
        lea dl,bl
        int 21h
        ;bo qua dong hien thi khong_co_so
        jmp thoat   ;jmp nhay k can dieu kien, nhay den thoat
  
  khong_co_so:
        ;hien thi chuoi gia tri b2
        mov ah,9h
        lea dx,b2
        int 21h
  
  thoat:
  
    main endp
    end main
             
        
        