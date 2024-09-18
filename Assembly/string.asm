.model small
.stack 100h
.data
m db 'My Name is R $'
.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9  ;string printf func
    lea dx,m     
    int 21h
    
    mov ah,4ch
    int 21h
    main endp
end main