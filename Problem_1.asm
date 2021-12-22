.model small
.stack 100h
.data    
 a db 0ah,0dh, "Enter the first number:$"
 b db 0ah,0dh, "Enter the second number:$" 
 c db 0ah,0dh, "Enter the third number:$" 
 d db 0ah,0dh, "Enter the fourth number:$"  

 output1 db 0ah,0dh,"The sum is in range 1$"
 output2 db 0ah,0dh,"The sum is in range 2$"   

 
.code  
main proc  
    mov ax, @data
    mov ds, ax  
    
    lea dx,a
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    mov bh,al  
    
    lea dx,b
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    mov bl,al
    
    lea dx,c
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    mov ch,al
    
    lea dx,d
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    mov cl,al 
    
    sub bh,30h
    sub bl,30h
    sub ch,30h
    sub cl,30h 
    
      
    
    add bh,bl
    add ch,cl
    
    add bh,ch 
    mov al,0
    mov al,bh
    
    
    cond1:
        cmp al,5
        jle print_1
        jmp cond2 
        
    cond2:
        cmp al,40
        jb print_2
        jmp print_1  
    
    print_1:
        lea dx,output1
        mov ah,9
        int 21h 
        
        jmp exit  
         
    print_2:
        lea dx,output2
        mov ah,9
        int 21h  
        
    
    exit:
         
    main endp
end main