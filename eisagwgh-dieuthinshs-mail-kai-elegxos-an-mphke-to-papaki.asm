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
         
        CMP AL,'.'
        JE EIS
         
        CMP AL,'@'
        JE EIS
        
        CMP AL,13
        JE CONTROL
        
        CMP AL,'A'
        JB v1 
        
        CMP AL,'Z'
        JBE EIS
        
        CMP AL,'a'
        JB v1
        
        CMP AL,'z'
        JA v1
       
        
       
EIS:        
        MOV BUFFER[SI],AL
        INC SI
        CMP SI,40
        JB v1
        

CONTROL:         
        MOV CX,SI
        MOV SI,0 
            
 
            
            
        
C1:     CMP BUFFER[SI],'@'
        JE EMF      
        INC SI
        LOOP C1 ;kathe fora meiwnete o CX kata ena
        
        LEA DX,NO@
        MOV AH,9
        INT 21H
        JMP EXIT
        
       
EMF:        
        
        LEA DX,MES
        MOV AH,9
        INT 21H
        
        MOV SI,0  ;KAI META KANW TO SI=0 GIA NA ARXISW APO TN ARXH NA EMFANIZW 
E1:     MOV DL,BUFFER[SI]
        MOV AH,2
        INT 21H
        INC SI
        CMP BUFFER[SI],'@'
        JNE E1    

          

EXIT:   
        MOV AH,4CH
        INT 21H 
        
        LEA DX,NOINPUT
        MOV AH,9
        INT 21H
        JMP EXIT
        
KODIKAS ENDS

DATA SEGMENT   
    BUFFER DB 40 DUP(0) ; Dilosi enos pinaka me onoma Buffer 20 theseon typou Byte
    PROTROPI DB 'Eisagete keimeno:  $';
	MES DB 10,13,10,13,'KEIMENO: $' ; To minima pou tha emfanistei
	NOINPUT DB 10,13,'Den eisagate kanena charaktira. Telos programmatos$';	
	NO@ DB 10,13,"Den eisagate papaki$"	
   
DATA ENDS 

END ARXI		        ; ME TIN ODIGIA END LEME APO POY THA ARXISEI NA EKTELITE TO PROGRAMMA MAS 






