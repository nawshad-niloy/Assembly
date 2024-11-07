.model small
.stack 100h 
.data
m1 db 'Enter three numbers: $'
m2 db 'The largest number is $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,m1
    int 21h
    
    mov ah,1 
    int 21h
    mov bl,al
    
    ;while taking input one has to press space between two numbers 
    mov dl,0dh
    int 21h
    
    mov ah,1 
    int 21h
    mov bh,al
     
    mov dl,0dh
    int 21h 
    
    mov ah,1 
    int 21h
    mov cl,al
     
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    mov ah,9
    lea dx,m2
    int 21h 
    
    cmp bl,bh
    jle a
    
    b:
    cmp bh,cl
    jle c
    mov ah,2
    mov dl,cl
    int 21h
    jmp exit
    
    c:
    mov ah,2
    mov dl,bh
    int 21h
    jmp exit
    
    a:
    cmp bl,cl
    jle d
    mov ah,2
    mov dl,cl
    int 21h
    jmp exit
    
    d:
    mov ah,2
    mov dl,bl
    int 21h 
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main