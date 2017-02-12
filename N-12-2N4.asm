TITLE ASK1
ASSUME CS:KODIKAS,DS:DATA
KODIKAS SEGMENT
			; Oi 2 parakatw entoles apokathistoun thn timh toy DS.
ARXI:	MOV AX,DATA
     	MOV DS,AX
          
         
        MOV AL,N
        DEC AL 
        MUL AL
        
        MOV TEMP,AL;TO APOTELESMA META TO POLAPLASIASMO PHGE STON AX..POU APOTELEITAI APO TON AH,AL 2TWN 8 BYTES PRAKTIKA TO RESULT MOU EINAI STON AL
    
        MOV AL,N
        
        MUL N2 

        SUB TEMP,AL
        
       
        ADD TEMP,4
         
             
        MOV AL,TEMP
        
        MOV CL,10
        DIV CL
        
        MOV BX,AX
        
        MOV DL,BL
        ADD DL,48
        MOV AH,2
        INT 21H
        
        MOV DL,BH
        ADD DL,48
        MOV AH,2
        INT 21H        
        
EXIT:        MOV AH,4CH
        INT 21H


DATA SEGMENT  
NUM DB 4
TEMP DB 0    

N DB 5   		; H metabliti me onoma N dilonete na einai typoy BYTE me arxiki timi to 5
N2 DB 2			; Stin epomeni grammi dilonoyme to minima poy theloyme na emfanistei
MES DB " TO APOTELESMA EINAI: $"      
DATA ENDS 

END ARXI