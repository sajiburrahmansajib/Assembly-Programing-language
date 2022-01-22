.model small
.stack 100h
.data 
msg1 db 'Leap year$'
msg2 db 'Not leap year$'
y dw  ?
.code
main proc
    
    mov ax,@data
    mov ds,ax 
    
    mov y,2021 
    mov ax,y
    mov bx,4
    
    div bx
    mov cx,dx
    mov dx,0
    
    cmp cx,0
    jne c2
       
    mov dx,0   
    mov ax,y
    mov bx,100
    div bx
    mov cx,dx
   
    cmp cx,0
    je c2
    mov ah,9
    lea dx,msg1
    int 21h
    jmp exit
 
c2:  
    mov dx,0
    mov ax,y
    mov bx,400
    div bx
    mov cx,dx
     
    cmp cx,0 
    jne p
    mov ah,9
    lea dx,msg1
    int 21h
    jmp exit     

p:
    mov ah,9
    lea dx,msg2
    int 21h    
    
exit:

    mov ah,4ch
    int 21h
    main endp
end main