
.model small
.stack 100h

.data  
num1 db 0
num2 db 0
choice db 0 
rem db ?


msg1 db 0ah,0dh, "first input $"
msg2 db 0ah,0dh, "second input $"
add1 db  "1.addition $"
sub1 db  "2.substraction $"
mul1 db  "3.multiplication $"
div1 db  "4.division $" 
pow1 db  "5. power $"
mod1 db  "6.modulas $"
choose1 db "choose operation $"
   
menum db 0ah,0dh, "Do the opration again[Y\N] $"

.code
main proc
    mov ax, @data
    mov ds, ax 
   menu: 
    mov ah,9
    lea dx, msg1
    int 21h
    
   
    mov ah,1
    int 21h
    sub al,48
    mov num1,al
    
    
    
    
     mov ah,2
    mov dl, 0ah
    int 21h
    
    mov ah,2 
    mov dl, 0dh
    int 21h  
    
     mov ah,9
    lea dx, msg2
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov num2,al
    
    
    
    mov ah,2
    mov dl, 0ah 
    int 21h     
    
    mov ah,2 
    mov dl, 0dh
    int 21h 
    
    
    mov ah,9
    lea dx, add1
    int 21h 
    
    
    mov ah,2
    mov dl, 0ah
    int 21h
    
    mov ah,2 
    mov dl, 0dh
    int 21h  
    
    
    mov ah,9
    lea dx, sub1
    int 21h
    
    
    mov ah,2
    mov dl, 0ah
    int 21h
    
    mov ah,2 
    mov dl, 0dh
    int 21h  
    
    
    mov ah,9
    lea dx, mul1
    int 21h 
    
    mov ah,2
    mov dl, 0ah
    int 21h
    
    mov ah,2 
    mov dl, 0dh
    int 21h  
    
    
    mov ah,9
    lea dx, div1
    int 21h
    
    
      mov ah,2
    mov dl, 0ah
    int 21h
    
    
     mov ah,2 
    mov dl, 0dh
    int 21h  
    
    
    mov ah,9
    lea dx, pow1
    int 21h 
    
    
      mov ah,2
    mov dl, 0ah
    int 21h
    
    
     mov ah,2 
    mov dl, 0dh
    int 21h  
    
    
    mov ah,9
    lea dx, mod1
    int 21h
    
    
    
     
    mov ah,2
    mov dl, 0ah
    int 21h
    
    mov ah,2 
    mov dl, 0dh
    int 21h  
    
    
    mov ah,9
    lea dx, choose1
    int 21h  
    
    mov ah,1
    int 21h
    sub al,48
    mov choice,al 
    
    
  
     
    cmp choice,2
    jl addition  
    je substraction
    jmp s_part
    
    substraction:
    
    
    mov al,num1
    sub al,num2
    add al,48
              
            
    

    
    mov dl,al   
    mov ah,2
    int 21h
    jmp exit
    
    addition:
    
    mov al,num1
    add al,num2
    
    
    
    
    mov ah,0
    mov bl,10
    div bl
    mov rem,ah
    
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,rem
    add dl,48
    mov ah,2
    int 21h
    
    jmp exit
    
    s_part: 
    
    cmp choice,4
    jl multiplication
    je division
    jmp l_part 
    
    
    multiplication: 
   
  
        
    mov al,num1
    mul num2
    
   
     
    
    mov ah,0
    mov bl,10
    div bl
    mov rem,ah
    
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,rem
    add dl,48
    mov ah,2
    int 21h 
    
    jmp exit
    
    division:
    mov ah,0
    mov al,num1
    div num2
    add al,48
    
    
    
    mov dl,al
    mov ah,2
    int 21h
    
  jmp exit  
  
  l_part:
  cmp choice,6
  jl power
  je modulas 
  
   
  
  modulas: 
  
    
    
    
  mov al,num1 ;al=8
  mov bl,num2 ;bl=3
  sub al,bl   ;bl=5
  mov cl,al   ;cl=5
  
  cmp cl,bl ;5>3
  
  jg sub_mu 
  
  mov ah,2
  mov dl,cl
  add dl,48
  int 21h
  
  jmp exit
  
  sub_mu: 
  sub cl,bl
  
  mov ah,2
  mov dl,cl
  add dl,48
  int 21h
  jmp exit
  
  power:
  
  mov al,num1 ;al=2
  mov bl,num2 ;bl=3 
  sub bl,1
  mov cx,bx  ;counter
  
  sum_powe:
    MUL al  
    loop sum_powe
  
    mov ah,2
    mov dl,al
    add dl,48
    int 21h
    
   
  
    exit:   
    mov ah,9
    lea dx, menum
    int 21h
    
    mov ah,1
    int 21h
    
    
    
    cmp al,89
    je menu
      
    
    
    
    
    finish:
    main endp
end main