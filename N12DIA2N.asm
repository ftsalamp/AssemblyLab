TITLE mask
KODIKAS SEGMENT
    ASSUME CS:KODIKAS, DS:DEDOMENA
    ARXI:   
        MOV AX,DEDOMENA	
	    MOV DS,AX   
	    
	    LEA DX,SUNARTHSH
	    MOV AH,9
	    INT 21H
	    
	    MOV DL,N
	    ADD DL,48
	    MOV AH,2
	    INT 21H
	    
	    MOV DX,0
	    MOV AX,0
	    MOV BX,0
	    MOV CX,0
	    
	    MOV AL,N
	    CMP AL,0
	    JBE EME
	    
	    CMP AL,9
	    JA EME
	    
	    MOV AL,N
	    INC AL
	    
	    MUL AL
	    
	    MOV CX,AX
	    
	    MOV BL,2
	    MOV AL,N
	    
	    MUL BL
	    
	    MOV BX,AX
	    
	    MOV AX,CX
	    
	    DIV BL
	    
	    MOV CX,AX
	    
	    LEA DX,TELOS
	    MOV AH,9
	    INT 21H
	    
	    MOV DL,CL
	    ADD DL,48
	    MOV AH,2
	    INT 21H
	    
	    LEA DX,TELOS2
	    MOV AH,9
	    INT 21H
	    
	    MOV AX,0
	    MOV AL,CH
	    
	    MOV BL,10
	    
	    DIV BL
	    
	    MOV CX,AX
	    
	    MOV DL,CL
	    ADD DL,48
	    MOV AH,2
	    INT 21H
	    
	    MOV DL,CH
	    ADD DL,48
	    MOV AH,2
	    INT 21H
	    
	    JMP EXIT
	    
EME:
    LEA DX,MINUS2
    MOV AH,9
    INT 21H
	    
	    
	    
	    
       



EXIT:        
    
        MOV AH,4CH
        INT 21H
	
KODIKAS ENDS

DEDOMENA SEGMENT
    
    N DB 1
    SUNARTHSH DB "SUNARTHSH (N+1)^2/(2N) N: $" 
    TELOS DB 10,13,"PILIKO: $"
    TELOS2 DB " UPOLIPO: $"
    MINUS DB 10,13,"N:$"
    MINUS2 DB 10,13,"N!=1-9 PROGRAM ERROR$" 


DEDOMENA ENDS


    END ARXI 