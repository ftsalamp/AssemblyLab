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
        JE v2       
               
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
        JA v1
        
EIS:    MOV BUFFER[SI],AL
        INC SI
        CMP SI,40
        JB v1
        
v2:     
        MOV CX,SI
        MOV SI,0
        MOV BL,0 
        
        LEA DX,MES
        MOV AH,9
        INT 21H
        
CONT1:  CMP BUFFER[SI],'a'
        JAE MIK
        
        CMP BUFFER[SI],'9'
        JBE ADDNUM        
        JMP INCR
        
MIK:    MOV DL,BUFFER[SI]
        MOV AH,2
        INT 21H
        JMP INCR
     


ADDNUM: SUB BUFFER[SI],48
        ADD BL,BUFFER[SI]
                       
INCR:   INC SI        
        
        LOOP CONT1 
        
        LEA DX,NUM
        MOV AH,9
        INT 21H
         
        MOV AX,0;ston AX tha paei to apotelesma ts diaereshs o AH kommati TOU AX exei mesa to 9 egw thelw olo ton katawxrhth keno
        MOV CL,10
        MOV AL,BL
        DIV CL
        
        MOV BH,AH
        
        
        
        MOV DL,AL
        ADD DL,48
        MOV AH,2
        INT 21H
        
        MOV DL,BH
        ADD DL,48
        MOV AH,2
        INT 21H 
         
        
EXIT:   
        MOV AH,4CH
        INT 21H

KODIKAS ENDS

DATA SEGMENT   
    BUFFER DB 40 DUP(0) ; Dilosi enos pinaka me onoma Buffer 20 theseon typou Byte
    PROTROPI DB 'Eisagete keimeno:  $';
	MES DB 10,13,10,13,'mikra grammata: $' ; To minima pou tha emfanistei
	NOINPUT DB 10,13,'Den eisagate kanena charaktira. Telos programmatos$';	
	NUM DB 10,13,"athroisma noumerwn=$"	
   
DATA ENDS 

END ARXI		        ; ME TIN ODIGIA END LEME APO POY THA ARXISEI NA EKTELITE TO PROGRAMMA MAS 
