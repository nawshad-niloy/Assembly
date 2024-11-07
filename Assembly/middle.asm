.model small
.stack 100h
.data
m1 db 'Enter three numbers: $'
m2 db 'The middle number is $'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, m1
    int 21h
    
    ; Input first number
    mov ah, 1 
    int 21h
    mov bl, al
    
    ; Input separator (space)
    mov dl, 0dh
    int 21h
    
    ; Input second number
    mov ah, 1 
    int 21h
    mov bh, al
     
    ; Input separator (space)
    mov dl, 0dh
    int 21h 
    
    ; Input third number
    mov ah, 1 
    int 21h
    mov cl, al
     
    ; Line feed
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    ; Display the middle number message
    mov ah, 9
    lea dx, m2
    int 21h 
    
    ; Compare numbers to find the middle number
    ; Check if `bl` is the middle value
    cmp bl, bh
    jg check_bl_less_than_cl
    cmp bl, cl
    jl check_bh_middle
    jmp display_bl

check_bl_less_than_cl:
    cmp bl, cl
    jg check_bh_middle
    jmp display_bl

; Check if `bh` is the middle value
check_bh_middle:
    cmp bh, bl
    jg check_bh_less_than_cl
    cmp bh, cl
    jl display_cl
    jmp display_bh

check_bh_less_than_cl:
    cmp bh, cl
    jg display_cl
    jmp display_bh

; Otherwise, `cl` is the middle value
display_bl:
    mov ah, 2
    mov dl, bl
    int 21h
    jmp exit

display_bh:
    mov ah, 2
    mov dl, bh
    int 21h
    jmp exit

display_cl:
    mov ah, 2
    mov dl, cl
    int 21h

exit:
    mov ah, 4ch
    int 21h
main endp
end main