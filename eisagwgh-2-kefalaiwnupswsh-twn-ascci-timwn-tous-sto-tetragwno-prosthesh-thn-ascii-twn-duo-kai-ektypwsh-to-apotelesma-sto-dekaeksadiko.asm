Title Ask1516
ASSUME CS:KODIKAS,DS:DATA
KODIKAS SEGMENT

PROC MAIN NEAR
    MOV AX,DATA
    MOV DS,AX
    
    MOV SI,0
    
    LEA DX,MESSAGE
    MOV AH,09H
    INT 21H
    
EIS:

    MOV AH,08H
    INT 21H
    
    CMP AL,'A'
    JB EIS
    CMP AL,'Z'
    JA EIS
    
    MOV BUFFER[SI],AL
    
    INC SI
    
    MOV DL,AL
    MOV AH,02H
    INT 21H
    
    CMP SI,2
    JB EIS
    
CON:
    MOV DL,BUFFER[0]
    MOV DH,BUFFER[1]
    CALL YPO
    
    MOV BUFFER[0],DH
    MOV BUFFER[1],DL
    
    LEA DX,MESSAGE2
    MOV AH,09H
    INT 21H
    
    MOV DL,BUFFER[0]
    CALL DISPLAY_HEX
    MOV DL,BUFFER[1]
    CALL DISPLAY_HEX
    
    MOV DL,'h'
    MOV AH,02H
    INT 21H
TELOS:
    MOV AH,4CH
    INT 21H
MAIN ENDP

DISPLAY_HEX PROC NEAR
	MOV BL,DL	; Metafero to periexomeno tou DL se allo kataxoriti giati ton xriazomai kai pali

	MOV BH,0	; Mizenizo ton BH kai etsi ksero oti o BX exei ayto pou eixe o BL
	MOV CL,4	; Bazo ston CL 4 gia na exo toses epanalipseis

	SHL BX,CL	; Metatopizo aristera ton BX tosa bit osa exei o CL
	MOV DL,BH	; Metaferoume ton proto hex arithmo apo ton BH ston DL gia na ginei to perasma 

	CALL ONE_DIGIT	; Kaloume tin One_digit 

	MOV CL,4	; Bazo ston CL 4 gia na exo toses epanalipseis

	SHR BL,CL	; Metatopizo Deksia ton BL tosa bit osa exei o CL
	MOV DL,BL	; Metaferoume ton deftero hex arithmo apo ton BL ston DL gia na ginei to perasma 

	CALL ONE_DIGIT	; Kaloume tin One_digit

	RET		; Epistrefo stin thesi apo opou klithike h yporoutina

DISPLAY_HEX ENDP


ONE_DIGIT PROC NEAR
	
	CMP DL,9	; Sygkrinoume to DL me to 9 gia na ksexoriso an o DL exei arithmo 0-9 H metaksi 10-15
	JA GRAMMA	; An o DL einai metaksi 10-15 phgaine stin etiketa "Gramma" gia na emfanistei apo A-F

	ADD DL,48	; Metatrepoume ton arithmo poy exei o DL se xaraktira poy einai antistoixos se ASCII
	JMP NEXT	; Phgainoyme stin etiketa "Next" giati i epomeni grammi anaferetai gia arithmoys 10-15

GRAMMA:	ADD DL, 'A'-10	; Metatrepoume ton aritho pou einai 10-15 sto antistoixo gramma A-F prosthetontas 55

NEXT:	MOV AH,02H	; Emfanizoyme stin othoni to periexomeno tou DL
	INT 21H 
	RET		; Epistrefo stin thesi apo opou klithike h yporoutina

ONE_DIGIT ENDP

YPO PROC 
   MOV CL,DL
   MOV AL,DH
   
   MOV AH,0
   MUL AL
   
   MOV BX,AX
   MOV AL,CL
   MOV AH,0
   MUL AL
   
   ADD AX,BX
   
   MOV DX,AX
   
   RET
YPO ENDP
KODIKAS ENDS
DATA SEGMENT
MESSAGE DB 'EISAGWGI KEFALAIWN: ','$',10,13
MESSAGE2 DB 10,13,'16adiki morfi: ','$',10,13
BUFFER DB 2 DUP(0)    
DATA ENDS
END MAIN
