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
        JE ADDNUM

        CMP AL,'0'
        JB v1
        
        CMP AL,'9'
        JBE EIS
        
        JMP v1 ;elegxxw to euros apo 0-9 an einai katw apo to 0 tote t lew n ksanaeisagei an einaai katw apo to 9 tou lew na t balei sto buffer
        ;se periptwsh omws p einai panw dhladh to  CMP AL,'9'->false tote panta tha ton bazw na eisagei noumero
        
        
EIS:    MOV BUFFER[SI],AL
        INC SI
        CMP SI,40
        JB v1
                
ADDNUM: 
        CMP SI,0
        JE NO
        
        MOV BL,0
        MOV CX,SI
        MOV SI,0  
        
        LEA DX,MESA
        MOV AH,9
        INT 21H
        
A1:        
        SUB BUFFER[SI],48 ;afairw to 48 gia na fugw apo tn ascii timh tou 'noumero' kai na parw to noumero ..px:na fugw apo to '5' kai na parw to 5
        ADD BL,BUFFER[SI] ;to prostherw sto bl 
        INC SI
        LOOP A1 ;kai to kanw gia ola ta noumera sto buffer mou

EMF:    MOV CL,10
        MOV AX,0
        MOV AL,BL    
        DIV CL
        
        MOV CL,AH
           
           
        MOV DL,AL
        ADD DL,48
        MOV AH,2
        INT 21h
        
        MOV DL,CL
        ADD DL,48
        MOV AH,2
        INT 21H
        
        
        
EXIT:     		              
        MOV AH,4CH
        INT 21H 
        
NO:     LEA DX,NOINPUT
        MOV AH,9
        INT 21H
        JMP EXIT       
        
KODIKAS ENDS

DATA SEGMENT   
    BUFFER DB 40 DUP(0) ; Dilosi enos pinaka me onoma Buffer 20 theseon typou Byte
    PROTROPI DB 'Eisagete keimeno:  $';
	MES DB 10,13,10,13,'TELIKH EMFANISH->: $' ; To minima pou tha emfanistei
	MESK DB 10,13,10,13,'KEFALAIA->: $' ; To minima pou tha emfanistei
	MESA DB 10,13,10,13,'Athroisma->: $' ; To minima pou tha emfanistei
	NOINPUT DB 10,13,'Den eisagate kanena charaktira. Telos programmatos$';		
   
DATA ENDS 

END ARXI		        ; ME TIN ODIGIA END LEME APO POY THA ARXISEI NA EKTELITE TO PROGRAMMA MAS 