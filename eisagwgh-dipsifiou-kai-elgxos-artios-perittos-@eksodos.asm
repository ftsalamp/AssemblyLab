TITLE FIRST
ASSUME CS:ASKISI , DS:DEDOMENA
ASKISI SEGMENT PUBLIC
	ARXI: MOV AX,DEDOMENA
	      MOV DS,AX
	      LEA DX,MES1                             
          MOV AH,9
          INT 21h
;===========================================
          
       A1:MOV AX,0
          MOV CX,0
          MOV BX,0
            
          MOV AH,08h
          INT 21h
          MOV BL,AL
          SUB BL,30h
          
          MOV CH,AL
          CMP CH,40h
          JE A5:
          
          CMP CH,31h
          JB A4:
          CMP CH,39h
          JA A4:
                    
          MOV AH,08h
          INT 21h
          MOV BH,AL
          SUB BH,30h
                    
          MOV AX,0
          MOV CL,0
          
          MOV AL,N
          MUL BL
          MOV BL,AL
          ADD BL,BH
                           
          MOV AL,BL
          MOV CL,M
          DIV CL
          MOV BH,AL
          MOV DH,AH
          
          MOV DL,BH
          ADD DL,30h  
          MOV AH,02h 
          INT 21h
                 
          MOV DL,DH
          ADD DL,30h
          MOV AH,02h
          INT 21h
          
          MOV AX,0
        
          MOV AL,BL
          MOV NUM,AL
          MOV BL,C
          DIV BL
          CMP AH,0
          JE A2:
          
          LEA DX,MES4
          MOV AH,9
          INT 21h
          JMP A1:
                  
       A2:LEA DX,MES3
          MOV AH,9
          INT 21h
          JMP A1:    
                                   
       A4:LEA DX,MES2
          MOV AH,9
          INT 21h
          JMP A1: 
          
       A5:MOV AH,4Ch
          INT 21h


;===========================================

ASKISI ENDS
DEDOMENA  SEGMENT  PUBLIC
       
       MES1 db "DOSTE ENA DIPSIFIO DEKADIKO ARITHMO",10,13,"$" 
       MES2 db "EISAGATE GRAMMA H SYMBOLO, PARAKALO KSANADOKIMASTE",10,13,7,"$"
       MES3 db " O ARITHMOS EINAI ARTIOS",10,13,"$"
       MES4 db " O ARITHMOS EINAI PERITOS",10,13,"$"
       N db 10
       M db 10
       NUM db 0
       C db 2
DEDOMENA ENDS
END ARXI
                  