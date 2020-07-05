org 100h
include emu8086.inc                                                       

.model small
.stack 100
.data           

msgBienv db ' Hacker 4 life BIENVENIDO AL PIEDRA PAPEL O TIJERA, VIVE O MUERE$'
msg2 db 'INGRESE:$'
msg3 db '*A -> PIEDRA$'
msg4 db '*B -> PAPEL$'
msg5 db '*C -> TIJERA$' 
msg6 db '*ELECCION DEL CPU -> $'  
msg7 db ' PERDISTE !! :( $'
msg8 db ' GANASTE !! :) $' 
msg9 db ' EMPATAS !! :| $'
msg10 db ‘PIEDRA $’
msg11 db ‘PAPEL $’
msg12 db ‘TIJERA $’
msg13 db ‘CONTRA  $’
msg14 db ‘QUIERES VOLVER A JUGAR? Y/N $’

op db 0
cpuOp db 0
op2 db 0

.code 

;IMPRIMIR MENSAJE BIENVENIDA         

 mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msgBienv
 int 21h

mov ah,02h
mov dl,10
int 21h
mov ah,02h
mov dl,13
int 21h
main:  
mov ah,02h
mov dl,10
int 21h
mov ah,02h
mov dl,13
int 21h   

 mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msg2
 int 21h
mov ah,02h
mov dl,10
int 21h
mov ah,02h
mov dl,13
int 21h
 mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msg3
 int 21h
mov ah,02h
mov dl,10
int 21h
mov ah,02h
mov dl,13
int 21h

 mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msg4
 int 21h
mov ah,02h
mov dl,10
int 21h
mov ah,02h
mov dl,13
int 21h    

 mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msg5
 int 21h
mov ah,02h
mov dl,13
int 21h
mov ah,02h
mov dl,10
int 21h
;   FIN MENSAJE BIENVENIDA 

;LECTURA Y VALIDACION 

mov ah,1
int 21h 
mov op,al
mov ah,02h
mov dl,13
int 21h
mov ah,02h
mov dl,10
int 21h

cmp op,65
je programa
jb main
ja segunda_cmp

segunda_cmp:
cmp op,67
jbe programa
ja main
;FIN DE LECTURA Y VALIDACION

;INICIA PROGRAMA
programa:    

xor ax,ax            
int 1ah              
mov ax,dx            

xor dx,dx            
mov bx,3           
div bx              
inc dx               
                  
mov ax,dx            
                                                      
mov cpuOp,dl    ; PARA CPU -> 1 PIEDRA 2 PAPEL 3 TIJERA
add cpuOp,64d 

mov ah,02h
mov dl,10
int 21h
mov ah,02h
mov dl,13
int 21h               

mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msg6
 int 21h

mov ah,02h   
mov dl,cpuOp
int 21h  


mov ah,02h
mov dl,10
int 21h
mov ah,02h
mov dl,13
int 21h             
cmp op,65
je imp_piedra

cmp op,66
je imp_papel

cmp op,67
je imp_tijera


imp_piedra:

mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msg10
 int 21h
jmp contra

imp_papel:

mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msg11
 int 21h
jmp contra


imp_tijera:
           
mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msg12
 int 21h

contra:
       
mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msg13
 int 21h

cmp cpuOp,65
je imp1_piedra

cmp cpuOp,66
je imp1_papel

cmp cpuOp,67
je imp1_tijera

imp1_piedra:
           

mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msg10
 int 21h
jmp proce

imp1_papel:

mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msg11
 int 21h
jmp proce


imp1_tijera:
     
mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msg12

 int 21h

proce:
mov ah,02h
mov dl,10
int 21h
mov ah,02h
mov dl,13
int 21h             

;; PROCESAR RESULTADO

mov bl,cpuOp

cmp op,66

ja tijera
           
jb piedra

je papel

tijera:      
    CMP op,bl
    JB esPiedraOPapel
    JE empate

esPiedraOPapel:
    CMP bl,66
    JE ganas
    JB pierdes

piedra:       
    CMP op,bl
    JA esPapelOTijera
    JE empate
esPapelOtijera:
    CMP bl,66
    JE pierdes
    JA ganas

papel:      
    CMP op,bl
    JB pierdes
    JA ganas 
    JE empate

ganas:  

 mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msg8
 int 21h  
 JMP revancha

pierdes:
 mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msg7
 int 21h 
 JMP revancha
empate:   
mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msg9
 int 21h 
 JMP revancha
 
revancha:
mov ah,02h
mov dl,10
int 21h
mov ah,02h
mov dl,13
int 21h             
mov ax, @data
 mov ds,ax
 mov ah,09h
 lea dx,msg14
 int 21h 
mov ah,1
int 21h 
mov op2,al

cmp op2,89
je main
jb fin

cmp op2,121
je main
jb fin

fin:

END
