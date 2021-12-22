
.model small

.stack 100h

.data

.code

main proc
    
    mov bh,1 ;i=1
    outer_condition:
        cmp bh,5  ;i<=5
        JG exit
    
    mov bl,1 ;j=1
    inner_condition:
        cmp bl,bh ;j<i 
        JL print_space
    
    mov cl,bh ;k=i
    in_inner_condition:
        cmp cl,5 ;k<=5  
        jg print_newline
    
        mov ah,2
        mov dl,'*'
        int 21h
       
        inc cl ;k++
        JMP in_inner_condition   
    
    print_space:
        mov ah,2
        mov dl,' '
        int 21h   
    
        inc bl ;k++
        JMP inner_condition  
      
    
    print_newline:
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
    
        inc bh   
        jmp outer_condition
    
    
    exit:
main endp
end main