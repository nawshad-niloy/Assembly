.model small
.stack 100h
.data
a db '3 NUMBERS ADDITION CONCEPT $'
b db 10,13,'ENTER FIRST NUMBER: $'
c db 10,13,'ENTER SECOND NUMBER: $'
d db 10,13,'ENTER THIRD NUMBER: $'
e db 10,13,'RESULT: $'
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al 
    
    mov ah,9
    lea dx,c
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    
    mov ah,9
    lea dx,d
    int 21h
    
    mov ah,1
    int 21h
    mov cl,al
    
    add bl,bh ;bl=bl+bh
    sub bl,48 ;bl=bl-48
    
    mov ch,bl
    
    add ch,cl ;ch=ch+cl
    sub ch,48 ;ch=ch-48
    
    mov ah,9
    lea dx,e
    int 21h
    
    mov ah,2
    mov dl,ch
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main