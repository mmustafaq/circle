.model small
.stack 64
.data
msg_1   db "This code is for Final Exam Pre-work of ELE336 Course",0ah,0dh,"Enter an integer between 0 and 360",0ah,0dh,"$"
buff_1  db "?"
error_message db 0ah,0dh,"   Entered integer will draw a larger circle than the window !","$"
input_ dw 0h,"$"
ip_sqr dw "?","$"


.code
main proc far
    mov ax,@data
    mov ds,ax
    
    sub ax,ax
    mov dx,offset msg_1
mov ah,09h
int 21h
mov ah,0ah
mov dx,offset buff_1
int 21h
mov si,dx
sub ax,ax
sub cx,cx
sub dx,dx
a:
sub [si+2],00030h  ;
shl cx,4d        ;
add cl,[si+2]
inc si
cmp [si+2],0000dh  ;
jne a 
mov si,0d

mov bx,100d
mov al,ch
mul bx
mov input_,ax
sub ax,ax
sub ch,ch
shl cx,4d        ;
mov bx,10d
mov al,ch
mul bx
add input_,ax
sub ax,ax
shr cl,4d        ;
sub ch,ch
add input_,cx


cmp input_,100d
jge e_m
jmp cnt

e_m:
    mov dx,offset error_message
    mov ah,09h
    int 21h
    ret
    
    
cnt:
mov ax,input_
mov bx,input_
mul bx
mov ip_sqr,ax
sub ax,ax
sub bx,bx
mov si,0d

bas:
    mov ax,si
    mov cx,si
    mov ax,cx
    mul cx
    mov dx,ip_sqr
    sub dx,ax
    mov cx,00000h
    mov bx,0ffffh
    
    sq:
        add bx,02h
        inc cx
        sub dx,bx
        cmp dx,bx
        jge sq
    mov ax,cx
    mov [si],ax
    inc si
    cmp si,input_
    jne bas


mov cx,160d
mov dx,100d
mov si,0d           ;x
mov ah,0
mov al,13h
int 10h

mov ah,0ch
mov al,02h
int 10h
add input_,1
                



;1st region
f:
    sub ax,ax
    mov al,[si]
    sub dx,ax
    add cx,si
    ;shr cx,1
    
    
    mov ah,0ch
    mov al,02h
    int 10h
    
    mov dx,100d
    mov cx,160d
    
    
    
    inc si
    cmp si,input_
    jne f

;2nd region
mov si,0d
s:
    sub ax,ax
    mov al,[si]
    add dx,ax
    add cx,si
    mov ah,0ch
    mov al,02h
    int 10h
    mov dx,100d
    mov cx,160d
    inc si
    cmp si,input_
    jne s
;3rd region

mov si,0d

t:
    sub ax,ax
    mov al,[si]
    add dx,ax
    sub cx,si
    mov ah,0ch
    mov al,02h
    int 10h
    mov dx,100d
    mov cx,160d
    inc si
    cmp si,input_
    jne t
mov si,0d
fth:
    sub ax,ax
    mov al,[si]
    sub dx,ax
    sub cx,si
    mov ah,0ch
    mov al,02h
    int 10h
    mov dx,100d
    mov cx,160d
    inc si
    cmp si,input_
    jne fth
    sub ax,ax
    sub bx,bx
    sub cx,cx
    sub dx,dx
    sub si,si
    sub di,di
    

    main endp
    end main


