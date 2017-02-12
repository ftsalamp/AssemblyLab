TITLE ASK2
ASSUME CS:KODIKAS,DS:DATA
KODIKAS SEGMENT
			           
ARXI:	MOV AX,DATA
     	MOV DS,AX
        
        MOV SI,0  
        
        
        
E1:     LEA DX,PROTROPI  
        MOV AH,9 	    
        INT 21H 
        
        MOV AH,01h      
        INT 21h 
        
        CMP AL,'@'
        JE EXIT
        
        CMP AL,'0'
        JB BEEP
        
        CMP AL,'9'
        JA BEEP
        
        
        MOV AH,0
        SUB AL,48
        MOV CL,2
        DIV CL
        
        
        CMP AH,0
        JE ARTIOS
              
        LEA DX,MESPER
        MOV AH,9
        INT 21H   
        JMP E1   
     
ARTIOS: LEA DX,MESARTIOS
        MOV AH,9
        INT 21H        
        JMP E1
        
BEEP:   LEA DX,MESLA        
        MOV AH,9
        INT 21H
        
        MOV DL,7H
        MOV AH,2
        INT 21H
        
        JMP E1
             
EXIT: 
     LEA DX,MESTELOS
     MOV AH,9
     INT 21H
     
     MOV AH,4CH
     INT 21H
     
     KODIKAS ENDS

DATA SEGMENT  
     
    BUFFER DB 40 DUP(0) ; Dilosi enos pinaka me onoma Buffer 20 theseon typou Byte
    PROTROPI DB 10,13,10,13,'Eisagete arithmo:  $';
	MESTELOS DB 10,13,10,13,'TELOS $' ; To minima pou tha emfanistei
	MESARTIOS DB 10,13,10,13,'EINAI ARTIOS $' ; To minima pou tha emfanistei
	MESLA DB 10,13,10,13,'PARAKALW EISAGETE MONO ARITHMOUS MONOPSHFIOUS: $' ; To minima pou tha emfanistei
	MESPER DB 10,13,'EINAI PERRITOS$';		
   
DATA ENDS 

END ARXI