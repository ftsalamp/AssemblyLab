                                                                                                 TITLE mask
KODIKAS SEGMENT
    ASSUME CS:KODIKAS, DS:DEDOMENA
    ARXI:   
        MOV AX,DEDOMENA	
	    MOV DS,AX
	    
	    
	    LEA DX,MSG
	    MOV AH,9
	    INT 21H
	    
	    MOV AX,0
	    MOV DX,0
	    
	    MOV SI,0
	    
INTRO:
    	    
	    mov ah,1
	    int 21h	

        CMP al,'@'
        JE TELIKO
        
        MOV PINAKAS[SI],AL
        INC SI 
        
        CMP SI,15
        JE  TELIKO
        
        JMP INTRO
        
        
TELIKO:
MOV CX,0
MOV CX,SI

MOV BX,0


CMP SI,0
JE NOIN

MOV SI,0



        MOV DL,10
        MOV AH,2
        INT 21H
        MOV DL,13
        MOV AH,2
        INT 21H 
        
LOOPA1: 

mov bx,0
        MOV DL,PINAKAS[SI]
        MOV AH,2
        INT 21H
        INC SI 
        
        MOV DL,10
        MOV AH,2
        INT 21H
        MOV DL,13
        MOV AH,2
        INT 21H
        
        CMP CX,SI
        JE EXIT
        

        
 BZER:      
 LOOPA:
 
       
 MOV DL,'@'
 MOV AH,2
 INT 21H
 
 INC BX
 CMP BX,SI
 JB loopa
 



CMP BX,SI
JE LOOPA1
                
        
        
        
        



        
        
        
        

        
        
        
JMP EXIT


NOIN:

LEA DX,NOINPUT
MOV AH,9
INT 21H
        

        
    
EXIT:
        MOV AH,4CH
        INT 21H
	
KODIKAS ENDS

DEDOMENA SEGMENT
    
    NOINPUT DB 10,13,"NO INPUT$" 
    
    msg db 10,13,"Eisagete keimeno(@ gia exit): $"
    
    pinakas db 40 dub(0) 


DEDOMENA ENDS


    END ARXI 