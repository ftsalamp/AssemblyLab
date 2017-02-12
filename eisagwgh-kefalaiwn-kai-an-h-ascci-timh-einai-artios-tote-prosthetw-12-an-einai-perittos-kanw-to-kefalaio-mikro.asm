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
	   
	    
B2:     MOV AH,01H  ; Eisagoume xarakthra apo to plhktrologio me parallhlh emfanish
	    INT 21H		; H ASCII timh tou xarakthra apothikeuetai ston AL
	    
	    CMP AL,'#'
	    JE E1
	    
	    CMP AL,32
	    JE EIS
	    
	    CMP AL,'A'
	    JB B2
	    
	    CMP AL,'Z'
	    JA B2      
	    	          
EIS:    MOV BUFFER[SI],AL      
	    INC SI
	    CMP SI,15
	    JB B2   ;oso einai katw apo 80 pane sto B2
	    
E1:     MOV CX,SI
        MOV SI,0
        JCXZ NO
        
        MOV AX,0 
        
CONT:   CMP SI,CX
        JA EMFANISI
        
        CMP BUFFER[SI],32
        JE SPACE
        
        ;AN DEN EINAI SPACE TOTE SHMAINEI OTI EXW GRAMMA KEFALAIO,OPOTE PREPEI NA ELEKSW AN H ASCII TIMH TOU ARTIOS PERITTOS
        MOV AL,BUFFER[SI] ;PRAKTIKA TWRA EFOSON MONO O AL EXEI PERIEXOMENO ...TO PERIEXOMENOO TOU AX EINAI AUTO TOU AL
        DIV DYO
        
        CMP AH,0
        JNE PERITTOS ;AN EINAI 0 TOTE EINAI ARTIOS

ARTIOS: ADD BUFFER[SI],12 ;PROSTHETW 12 OPWS ELEGE KAI H ASKHSH
        JMP L1
        
PERITTOS:ADD BUFFER[SI],32 ;kanw ta kefalaia mikra
         JMP L1                
                
SPACE:  MOV BUFFER[SI],'+'
              
        
L1:     INC SI 
        LOOP CONT 
        
EMFANISI:MOV CX,SI 
         MOV SI,0 
         
         LEA DX,KENO
         MOV AH,9
         INT 21H
         
EM1:     MOV DL,BUFFER[SI]
         MOV AH,2
         INT 21H
         INC SI
         LOOP EM1        
         JMP EXIT
        
NO:     LEA DX,NOCHAR
        MOV AH,9
        INT 21H       
        	    
	    
EXIT:	LEA DX,EXITMES
        MOV AH,9
        INT 21H
        MOV AH,4CH	
    	INT 21H  
    KYRIO ENDP 	  
    	
    	  
	    
	    KODIKAS ENDS

DEDOMENA SEGMENT
	BUFFER DB 15 DUP(0) ; Dilosi enos pinaka me onoma Buffer 20 theseon typou Byte
    PROTROPI DB 'Eisagete keimeno:  $';
    KENO DB 10,13,'  $'
	MESSAGE DB 10,13,'Eisagete ena kefalaio charactira: $' ; To minima pou tha emfanistei
	NOCHAR DB 10,13,'den eisagate kapoio egkuroxarakthra$';
	EXITMES DB 10,13,'THE CONSOLE WILL NOW EXIT $'
	DYO DB 2 						
DEDOMENA ENDS

	END KYRIO