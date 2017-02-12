TITLE ASKISI4
KODIKAS SEGMENT PUBLIC
ASSUME CS:KODIKAS, DS:DEDOMENA, SS:SOROS
    KYRIO PROC NEAR
                    ; OI 2 PARAKATO ENTOLES APOKATHISTOYN THN TIMH TOY DS.
	    MOV AX,DEDOMENA 
	    MOV DS,AX
	   
A1:	   LEA DX,PROTROPIKEF
	   MOV AH,9
	   INT 21H
	   
	   MOV SI,0
       JMP B2
       
BEEP1:LEA DX,PROTROPIKEF
	   MOV AH,9
	   INT 21H
	   
      MOV DL,7
      MOV AH,2
      INT 21H
	   
	    
B2:     MOV AH,01H  ; Eisagoume xarakthra apo to plhktrologio me parallhlh emfanish
	    INT 21H		; H ASCII timh tou xarakthra apothikeuetai ston AL
	    
        CMP AL,'A'
        JB BEEP1
        
        CMP AL,'Z'
        JA BEEP1
        
        MOV BUFFER[SI],AL
        INC SI
        
        MOV AX,0
B3:     LEA DX,PROTROPIMIK
        MOV AH,9
        INT 21H
        JMP B4
        
BEEP:   MOV DL,7
        MOV AH,2
        INT 21H        
        
        
B4:     MOV AH,01H
        INT 21H
        
        CMP AL,'a'
        JB B3
        
        CMP AL,'z'
        JA B3
        
        MOV BUFFER[SI],AL
        
        MOV BL,BUFFER[1] ;PAIRNW TO DEUTERO GRAMMA DHLADH TO MIKRO KAI TO BAZW STO BL GIA TN AFAIRESH
        MOV BH,BUFFER[0] ;PAIRNW TO PRWTO GRAMMA DHLADH TO MEGALO KAI TO BAZW STO BL GIA TN AFAIRESH
        
        SUB  BL,BH ;AFAIRW THN ASCII TOU MEGALOU APO TO MIKRO
        
        CMP BL,32
        JA AGAIN
        
        MOV AX,0
        MOV AL,BL;OPOTE O AX EXEI MONO TO PERIEXOMENO TOU AL
        DIV DEKA ;TO APOTELESMA PAEI STON AX
        MOV BX,0 ;ADEIAZW TON BX APO OTI TUXON MPOREI NA EXEI KAI BAZW TON AX STON BX
        MOV BX,AX;OLO TO APOTELESMA STON AX
         
        LEA DX,APOTELESMA
        MOV AH,9
        INT 21H

        MOV DL,BL
        ADD DL,48  ;GIA NA PARW THN ASCII TIMH TOU
        MOV AH,2
        INT 21H
        
        MOV DL,BH
        ADD DL,48     ;GIA NA PARW THN ASCII TIMH TOU
        MOV AH,2
        INT 21H
        
        JMP EXIT
             
AGAIN: INC COUNT

       LEA DX,MEGALUTERO
       MOV AH,9
       INT 21H
        
       MOV AX,0
       MOV BX,0
       CMP COUNT,2; 3 FORES ARA 0-1-2
       JBE A1
       
       LEA DX,STOP
       MOV AH,9
       INT 21H
              
EXIT:	MOV AH,4CH	
    	INT 21H  
    KYRIO ENDP 	  
    	  
        	
    	  
	    
	    KODIKAS ENDS

DEDOMENA SEGMENT
    STOP DB 10,13,'Uperbhkate to orio pou mporeite na telesete th diadikasia.TELOS$'
	BUFFER DB 2 DUP(0) ; Dilosi enos pinaka me onoma Buffer 20 theseon typou Byte 
	MEGALUTERO DB 10,13,'MEGALUTERO APO 32 H ASCII$'
	PROTROPIMIK DB 10,13,'EISAGETE MIKRO GRAMMA: $'
    PROTROPIKEF DB 10,13,'Eisagete MEGALO GRAMMA:  $';
	APOTELESMA DB 10,13,'TO APOTELESMA =  $' ; To minima pou tha emfanistei
	WRONG DB 10,13,'LATHOS EISAGWGH$';
	DEKADA DB 0
	MONADA DB 0 
	COUNT DB 0	
	DEKA DB 10;GIA TH DIAIRESH GIA NA PARW DEKADES KAI MONADES					
DEDOMENA ENDS

	END KYRIO