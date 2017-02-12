TITLE ASKISI4
KODIKAS SEGMENT PUBLIC
ASSUME CS:KODIKAS, DS:DEDOMENA, SS:SOROS
    KYRIO PROC NEAR
                    ; OI 2 PARAKATO ENTOLES APOKATHISTOYN THN TIMH TOY DS.
	    MOV AX,DEDOMENA 
	    MOV DS,AX
	   

	    CALL YPO1	    
	    
	    LEA DX,KENO
	    MOV AH,9
	    INT 21H
	     
	    CALL YPO1 
	    
	    MOV AX,0   ;NA EINAI ADEIOS O AX  
	    MOV AL,NUM1;OUTWS WSTE SE AUTO TO SHMEIO NA EXEI MONO TO PERIEXOMENO TOU AL
	    DIV DYO    ;DIAIRW ME TO DUO KAI PREPEI NA ELEKSW TO UPOLOIPO
	    MOV APOT1,AH ;METAKINW TO UPOLOIPO P MOOU DEIXNI AN EINAI ARTIOS PERITTOS STO APOT1 
	    
	    
	    MOV AX,0
	    MOV AL,NUM2
	    DIV DYO
	    MOV APOT2,AH
	    
	    MOV BL,NUM1
	    MOV BH,NUM2
	    
	    
ART_CONT1:CMP APOT1,0
	      JE ART_CONT2
	      
PER_CONT1:CMP APOT2,0
          JNE IDIOI	      
	      JMP OXI_IDIOI 
;OXI_IDIOI:JMP EXIT	       
	       
	    
ART_CONT2:CMP APOT2,0
	      JE IDIOI 
	      JMP OXI_IDIOI

IDIOI:LEA DX,MEGALUTEROS
      MOV AH,9
      INT 21H
      
      CMP BL,BH
      JAE EMFNUM1
      
      MOV DL,NUM2
      ADD DL,48
      MOV AH,2
      INT 21H
      JMP EXIT
EMFNUM1:MOV DL,NUM1
        ADD DL,48
        MOV AH,2
        INT 21H      
     JMP EXIT
     
OXI_IDIOI:
        LEA DX,MIKROTEROS
        MOV AH,9
        INT 21H

        CMP BL,BH
        JBE EMF1
          
        MOV DL,NUM2
        ADD DL,48
        MOV AH,2
        INT 21H
        JMP EXIT
        
EMF1:   MOV DL,NUM1
        ADD DL,48
        MOV AH,2
        INT 21H
     
      
	      
	     
EXIT:	MOV AH,4CH	
    	INT 21H  
    KYRIO ENDP 	  
    	  
    	  
YPO1 PROC
       LEA DX,PROTROPI
	   MOV AH,9
	   INT 21H
	   JMP B2
	   
BEEP:  LEA DX,WRONG	   
	   MOV AH,9
	   INT 21H
	   
	   MOV DL,7H
	   MOV AH,2
	   INT 21H
	    
B2:    MOV AH,01H  ; Eisagoume xarakthra apo to plhktrologio me parallhlh emfanish
	   INT 21H		; H ASCII timh tou xarakthra apothikeuetai ston AL
	    
	   CMP AL,'9'
	   JA BEEP
	   
	   CMP AL,'0'
	   JB BEEP      
	   
	   CMP COUNT,1
	   JE DEUTEROS
	   
PRWTOS: SUB AL,48
        MOV NUM1,AL
        INC COUNT
        JMP RETURN
        
DEUTEROS:SUB AL,48
         MOV NUM2,AL 
        
RETURN:RET        
    YPO1 ENDP        	
 
	    
	  KODIKAS ENDS

DEDOMENA SEGMENT
	BUFFER DB 80 DUP(0) ; Dilosi enos pinaka me onoma Buffer 20 theseon typou Byte
    PROTROPI DB 'Eisagete keimeno:  $';
	MEGALUTEROS DB 10,13,'O MEGALUTEROS ARITHMOS EINAI O $' ; To minima pou tha emfanistei
	KENO DB 10,13,'$';
	WRONG DB 10,13,'PARAKALW PLHKTROLOGHSTE ENA MONOPSHFIO ARITHMO APO TO 0-9 $'
	MIKROTEROS db 10,13,'O MIKROTEROS EINAI O $'
	COUNT DB 0
	NUM1 DB 0
	APOT1 DB 0
	NUM2 DB 0
	APOT2 DB 0
	DYO DB 2 						
DEDOMENA ENDS

	END KYRIO