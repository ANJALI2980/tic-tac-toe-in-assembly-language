# anjali's_code
# tic-tac-toe-in-assembly-language
.model small
mesg macro msg ;message for invalid input
lea dx,invalid_input
mov ah,9
int 21h
endm
.data
n1 db 13,10,"$"
game_name db"TIC TAC TOE",13,10."$"
invalid_input db"INVALID INPUT.GIVE ANOTHER INPUT",13,10,"$"
X DW 100
Y DW 100
INCRE DW 0
INCRE1 DW 0
XX DB 0
MOVX DB ?
MOVY DW ?
WINMSG DB "PLAYER1 IS WINNER!!$"
WINMSG1 DB "PLAYER2 IS WINNER!!!$"
X1 DB ?
X2 DB ?
BOX1 DW 0
BOX2 DW 0
BOX3 DW 0
BOX4 DW 0
BOX5 DW 0
BOX6 DW 0
BOX7 DW 0
BOX8 DW 0
BOX9 DW 0
PLAYER1 DW 1
INFO DW 3   ;THESE DIFFERENT VALUES BECAUSE NO THREE INFO MUST HAVE SAME VALUE
INFO1 DW 3
INFO2 DW 4
INFO3 DW 4
INFO4 DW 5
INFO5 DW 5
INFO6 DW 6
INFO7 DW 6
INFO8 DW 7
INFO9 DW 7
.CODE
START:
MOV DX,@DATA
MOV DS,DX
MOV AH,0H
MOV AL,12H
INT 10H
MOV AH,9H
LEA DX,N1
INT 21H
MOV AH,9H
LEA DX,N1
INT 21H
MOV AH,9H
LEA DX,GAME_NAME
INT 21H
L1:  ;BEGIN TO DRAW BOARD
MOV AH,0CH
MOV AL,15
MOV BH,0
MOV CX,X
MOV DX,Y
INT 10H  ;INTERRUPT FOR GRAPHICS
ADD X,10
CMP X,300
JL L1
MOV X,150
MOV Y,50
L2:
MOV AH,0CH
MOV AL,15
MOV BH,0
MOV CX,X
MOV DX,Y
INT 10H
ADD Y,10
CMP Y,240
JL L2
MOV X,100
MOV Y,170
L3:
MOV AH,0CH
MOV AL,15H
MOV BH,0
MOV CX,X
MOV DX,Y
INT 10H
ADD X,10
CMP X,300
JL L3
MOV X,240
MOV Y,50
L4:
MOV AH,0CH
MOV AL,15H
MOV BH,0
MOV CX,X
MOV DX,Y
INT 10H
ADD Y,10
CMP Y,240
JL L4
MOV X,110
MOV Y,70  ;END OF BOARD
MOV AH,9H
LEA DX,N1
INT 21H
MOV AH,9H
LEA DX,N1
INT 21H
TIKLEVEL:
MOV CX,5H
mov AH,1
INT 16H
JNZ KEYPRESS
KPS:
JNE KEYPRESS
KEYPRESS:
MOV AH,0H
INT 16H
MOV X1,AL
COMP1:
CMP X1,'1'
JE LEVEL1
JMP COMP2
LEVEL1:
CMP BOX1,0
JE LEVEL_1
MESG
JMP KPS
LEVEL_1:
MOV BOX1,1H
CMP PLAYER1,1
JE TIK1
JNE CROSS1
TIK1:

