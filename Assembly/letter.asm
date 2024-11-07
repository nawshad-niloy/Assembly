 .MODEL SMALL
.STACK 100H

.DATA
    msg_1 DB 'Enter the first capital letter : $';message 1
    msg_2 DB 'Enter the second capital letter : $';message 2
    msg_3 DB 'The given capital letters in alphabetical order are : $';message

    NEXT DB 0DH,0AH,"$"

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        
        MOV AH, 9 ; set string output function
        LEA DX, NEXT ; Next line
        INT 21H
        
        LEA DX, msg_1 ; display message 1
        INT 21H
        
        MOV AH, 1 ; set input function
        INT 21H ; read first character
        
        MOV BL, AL ; save first character into BL
        
        MOV AH, 9 ; set string output function
        
        LEA DX, NEXT ; new line
        INT 21H
        
        LEA DX, msg_2 ; message 2
        INT 21H
        
        MOV AH, 1 ; set input function
        INT 21H ; read second character
        
        MOV BH, AL ; save second character into BH
        
        MOV AH, 9 ; set string output function
        
        LEA DX, NEXT ; next line
        INT 21H
        
        LEA DX, msg_3 ; message3
        INT 21H
        
        MOV AH, 2 ; set output function
        
        CMP BL, BH
        
        JAE Larger_
            MOV DL, BL
            INT 21H
            
            MOV DL, BH
            INT 21H
            
            JMP _END
        
        Larger_:
            MOV DL, BH
            INT 21H
            
            MOV DL, BL
            INT 21H
        
        _END:
        
        MOV AH, 4CH 
        INT 21H
     MAIN ENDP
    END MAIN