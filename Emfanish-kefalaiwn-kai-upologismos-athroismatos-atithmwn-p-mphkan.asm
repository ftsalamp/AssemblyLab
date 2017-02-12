TITLE ASK2
ASSUME CS:KODIKAS,DS:DATA
KODIKAS SEGMENT
			           
ARXI:	MOV AX,DATA
     	MOV DS,AX
        
        MOV SI,0  
        
        
        
        LEA DX,PROTROPI  
        MOV AH,9 	    
        INT 21H 	    
   
v1:     MOV AH,01h      
        INT 21h 
         
        CMP AL,'#'
        JE EMF1

        CMP AL,'0'
        JB v1
        
        CMP AL,'9'
        JBE EIS

        CMP AL,'A'
        JB v1
        
        CMP AL,'Z'
        JA v1


EIS:    MOV BUFFER[SI],AL
        INC SI
        CMP SI,40
        JB v1
        
          
        
EMF1:     
        CMP SI,0
        JE NO
        
        MOV CX,SI
        MOV SI,0
        MOV BL,0
        
        LEA DX,MESK
        MOV AH,9
        INT 21H   
        
CONTROL:CMP BUFFER[SI],'A'
        JAE KEF
        
        
        SUB BUFFER[SI],48
        ADD BL,BUFFER[SI]
        JMP INCR
        
KEF:    MOV DL,BUFFER[SI]
        MOV AH,2
        INT 21H
        
INCR:   INC SI
        LOOP CONTROL
        
        
        LEA DX,MESA
        MOV AH,9
        INT 21H
        
        MOV AX,0
        MOV CL,10
        MOV AL,BL
        
        DIV CL
        
        MOV CH,AH
        
        MOV DL,AL
        ADD DL,48
        MOV AH,2
        INT 21H
        
        MOV DL,CH
        ADD DL,48
        MOV AH,2
        INT 21H     
     
     
EXIT:
        MOV AH,4CH
        INT 21H 
        
NO:
        LEA DX,NOINPUT
        MOV AH,9
        INT 21H        
           
KODIKAS ENDS

DATA SEGMENT   
    BUFFER DB 40 DUP(0) ; Dilosi enos pinaka me onoma Buffer 20 theseon typou Byte
    PROTROPI DB 'Eisagete keimeno:  $';
	MES DB 10,13,10,13,'TELIKH EMFANISH->: $' ; To minima pou tha emfanistei
	MESK DB 10,13,10,13,'KEFALAIA->: $' ; To minima pou tha emfanistei
	MESA DB 10,13,10,13,'Aritmoi-ATHROISMA->: $' ; To minima pou tha emfanistei
	NOINPUT DB 10,13,'Den eisagate kanena charaktira. Telos programmatos$';		
   
DATA ENDS 

END ARXI	