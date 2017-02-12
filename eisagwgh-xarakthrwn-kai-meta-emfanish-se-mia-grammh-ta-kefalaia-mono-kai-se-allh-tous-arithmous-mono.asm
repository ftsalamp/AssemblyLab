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
        JE EMF

        CMP AL,'0'
        JB v1
        
        CMP AL,'9'
        JBE EIS

        CMP AL,'A'
        JB v1
        
        CMP AL,'Z'
        JBE EIS

        CMP AL,'a'
        JB v1

        CMP AL,'z'
        JBE EIS
        
        CMP AL,'.'
        JE EIS
        
        CMP AL,'!'
        JE EIS
        
        CMP AL,' '
        JE EIS



EIS: MOV BUFFER[SI],AL
     INC SI
     CMP SI,40
     JB v1     


EMF: CMP SI,0
     JE NOTHNIG 
     
     MOV CX,SI;metrhths gia ta kefalaia-prokeitaii na diatreksoume to buffer mas mia fora gia ton ta kefalaia kai mia fora ksexwrista gia tous arithhmous
     MOV BX,SI;metrhths gia touus arithmous
     MOV SI,0

     LEA DX,MESK
     MOV AH,9
     INT 21H
     
KEF:
     CMP BUFFER[SI],'Z' 
     JAE INCR ;AN EINAI paNW APO TO Z AS PAREI TO EPOMENO
     
     CMP BUFFER[SI],'A' ;AN EINAI MEGALUTEROS APO TO A TOTE KAFALAIO
     JBE INCR
       
     MOV DL,BUFFER[SI]
     MOV AH,2
     INT 21h
     JMP INCR
     
ARIT:  
     MOV SI,0
     LEA DX,MESA
     MOV AH,9
     INT 21H    
     
CONA:CMP BUFFER[SI],'9'
     JA INCRNUM ;AN EINAI PANW APO TO 9 AS PAREI TO EPOMENO
       
     MOV DL,BUFFER[SI]
     MOV AH,2
     INT 21h
     JMP INCRNUM
     
     
EXIT:
     MOV AH,4CH
     INT 21H

INCR: INC SI 
      CMP SI,CX
      JA ARIT
      JMP KEF 
      
INCRNUM:
      INC SI
      CMP SI,BX
      JA EXIT
      JMP CONA
      
NOTHNIG:
        LEA DX,NOINPUT
        MOV AH,9 	    
        INT 21H 
        
        MOV AH,4CH
        INT 21H
        JMP EXIT     
      
KODIKAS ENDS

DATA SEGMENT   
    BUFFER DB 40 DUP(0) ; Dilosi enos pinaka me onoma Buffer 20 theseon typou Byte
    PROTROPI DB 'Eisagete keimeno:  $';
	MES DB 10,13,10,13,'TELIKH EMFANISH->: $' ; To minima pou tha emfanistei
	MESK DB 10,13,10,13,'KEFALAIA->: $' ; To minima pou tha emfanistei
	MESA DB 10,13,10,13,'Aritmoi->: $' ; To minima pou tha emfanistei
	NOINPUT DB 10,13,'Den eisagate kanena charaktira. Telos programmatos$';		
   
DATA ENDS 

END ARXI		        ; ME TIN ODIGIA END LEME APO POY THA ARXISEI NA EKTELITE TO PROGRAMMA MAS 