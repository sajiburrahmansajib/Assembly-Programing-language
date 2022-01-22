.model small
.stack 100h

.data

.code

main proc 
    mov cx, 0 ;counter  
    
    take_input:
    mov ah,1
    int 21h
    cmp al, 0dh
    je print_newline        
    
    inc cx
    push ax 
    jmp take_input
    
    print_newline:
    
    mov ah,2
    mov dl, 0ah
    int 21h
    
    mov dl, 0dh
    int 21h
    
    jcxz exit 
    
    pop ax
    mov bx,ax
    add bx,1
   
    print_output:  
    
    mov ah,2 
    mov dx,bx
    int 21h
    inc bx
    loop print_output
    
    exit:
    main endp

end main