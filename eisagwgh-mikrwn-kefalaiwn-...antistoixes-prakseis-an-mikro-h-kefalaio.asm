TITLE ASKISI4
KODIKAS SEGMENT PUBLIC
ASSUME CS:KODIKAS, DS:DEDOMENA, SS:SOROS
    KYRIO PROC NEAR
                    ; OI 2 PARAKATO ENTOLES APOKATHISTOYN THN TIMH TOY DS.
	    MOV AX,DEDOMENA 
	    MOV DS,AX

	   LEA DX,PROTROPI
	   MOV AH,9
	   INT 21H
	   JMP B2
	   
BEEP:  LEA DX,WRONG
        MOV AH,9
        INT 21H
        
        MOV DL,07H
        MOV AH,2
        INT 21H
        
B2:     MOV AH,01H  ; Eisagoume xarakthra apo to plhktrologio me parallhlh emfanish
	    INT 21H		; H ASCII timh tou xarakthra apothikeuetai ston AL
	    
	    CMP AL,'&'
	    JE E1
	    
	    CMP AL,32
	    JE EIS
	    
	    CMP AL,'A'
	    JB BEEP
	    
	    CMP AL,'Z'
	    JBE EIS      
	       
	    CMP AL,'a'
	    JB BEEP
	    
	    CMP AL,'z'
	    JA BEEP  
	    
EIS:    INC SI
	    MOV BUFFER[SI],AL
	    
	    CMP SI,15
	    JB B2   ;oso einai katw apo 15 pane sto B2
	  
	  
E1:     MOV CX,SI
        MOV SI,0 
        JCXZ NO 	  
	    
CONT:   MOV AX,0
        CMP BUFFER[SI],32
        JE KENO

        CMP AL,'Z'
        JBE KEFAL ;AN EINAI MIKROTERO SHMAINEI OTI EXW KEFALAIO             
        
        ;AN DEN EINAI OUTE KENO OUTE KEFALAIO TOTE SHMAINEI OTI EXW MIKRO GRAMMA  
        
        MOV AL,BUFFER[SI];PRAKTIKA AX OTI EXEI O AL EFOSON TO HIGH TOU AX DEN EXEI KATI MESA
        DIV DYO
        ADD AL,27;MAS ENDIAFEREI TO PHLIKO THS DIAIRESHS OXI TO UPOLOIPO ,META PROSTHETOUME TO 27 OPWS LEEI H EKFWNHSH
        MOV DL,AL
        MOV AH,2
        INT 21H
        JMP NEXT
        
        
KENO:   MOV BUFFER[SI],'-';ANTIKATASTASH EKEI POU BRHKA TO KENO
        MOV DL,BUFFER[SI]
        MOV AH,2
        INT 21H
        JMP NEXT     
        
        
KEFAL:  MOV AL,BUFFER[SI];PRAKTIKA O AX EXEI MESA AUTO POU EXEI O AL EFOSON O AH EINAI ADEIOS
        MUL DYO
        SUB AX,126
        MOV DL,AL
        MOV AH,2
        INT 21H      	    
	    
NEXT:   INC SI
        LOOP CONT	    
	    
	    JMP EXIT  
	    	    

NO: LEA DX,NOTHING
    MOV AH,9
    INT 21H

	    
EXIT:	MOV AH,4CH	
    	INT 21H  
    KYRIO ENDP 	  
    	  
        	
    	  
	    
	    KODIKAS ENDS

DEDOMENA SEGMENT
	BUFFER DB 15 DUP(0) ; Dilosi enos pinaka me onoma Buffer 20 theseon typou Byte
    PROTROPI DB 'Eisagete keimeno:  $',10,13;
	MESSAGE DB 10,13,'Eisagete ena charactira: $' ; To minima pou tha emfanistei
	NOTHING DB 10,13,'DEN EXEI EISAXTHEI KATI EGKURO. Telos programmatos$',10,13;
	WRONG DB 10,13,'DEN EXETE EISAGEI EGKURO XARAKTHRA.PARAKALW EISAGETE KEFALAIA-MIKRA-SPACE $'
	DYO DB 2   						
DEDOMENA ENDS

	END KYRIO