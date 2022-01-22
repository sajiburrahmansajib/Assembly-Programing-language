.model small
.stack 100h

.data

.code

main proc 
    mov cx,0 ;counter  
    
    take_input:
    mov ah,1
    int 21h
    cmp al, 0dh    ;Enter vhalue check
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
    
    pop ax   ;First enter value pop to poin the stack to the actual vhalue
    mov bl,al  ;move the first pointer value bl register to compare
    cmp bl,97 
    JGE print_output_big
    
    print_output_small: 
    
    add ax,32
    mov dx,ax
    mov ah,2 
    int 21h
    pop ax 
    loop print_output_small 
    jmp exit
    
    print_output_big: 
     
    
    sub ax,32  
    mov dx,ax
    mov ah,2
     
    int 21h  
    pop ax
    loop print_output_big 
    
    
    exit:
    main endp

end main