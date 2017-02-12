TITLE ASK2
ASSUME CS:KODIKAS,DS:DATA
KODIKAS SEGMENT
			           
ARXI:	MOV AX,DATA
     	MOV DS,AX
        
        MOV CH,0  
        MOV BH,0
        MOV BL,0
        
v1:        LEA DX,PROTROPI  
        MOV AH,9 	    
        INT 21H
        
     MOV AH,1H
        INT 21H
        
        CMP AL,'#'
        JE EMF 	
        
        CMP AL,'A'
        JB ALLOS
        
        CMP AL,'Z'
        JBE KEF
        
        CMP AL,'a'
        JB ALLOS
        
        CMP AL,'z'
        JBE MIKRA
        
ALLOS:  LEA DX,MES_S
        MOV AH,9
        INT 21H
        
        INC CH
        JMP v1
        
KEF:    LEA DX,MES_GME
        MOV AH,9
        INT 21H
        
        INC BH
        JMP v1
        
MIKRA:  LEA DX,MES_GMI    
        MOV AH,9
        INT 21H
        
        INC BL
        JMP v1
        
EMF:    LEA DX,MESPL1
        MOV AH,9
        INT 21H
        
        MOV DL,BH
        ADD DL,48
        MOV AH,2
        INT 21H
        
        LEA DX,MESPL2
        MOV AH,9
        INT 21H
        
        MOV DL,BL
        ADD DL,48
        MOV AH,2
        INT 21H 
        
          LEA DX,MESPL3
        MOV AH,9
        INT 21H
        
        MOV DL,CH
        ADD DL,48
        MOV AH,2
        INT 21H        
        
        MOV AH,4CH
        INT 21H
           
      
KODIKAS ENDS

DATA SEGMENT   
    BUFFER DB 40 DUP(0) ; Dilosi enos pinaka me onoma Buffer 20 theseon typou Byte
    PROTROPI DB  10,13,10,13,'Eisagete keimeno:  $',10,13,10,13;
	MES_GME DB 10,13,10,13,'LETTER KEFALAIO $',10,13,10,13 ; To minima pou tha emfanistei
	MES_S DB 10,13,10,13,'ALLOS $',10,13,10,13 ; To minima pou tha emfanistei
	MES_GMI DB 10,13,10,13,'LETTER MIKRO$',10,13,10,13 ; To minima pou tha emfanistei
    MESPL1 DB 10,13,'ARITHMOI PHTHOS KEF=$';
    MESPL2 DB 10,13,' PLHTHOS MIKRA=$'; 
    MESPL3 DB 10,13,' PLHTHOS SUMBOLA=$'
DATA ENDS 

END ARXI