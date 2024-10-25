.model small
.stack 100h
.data  
arr DB 8,4,3,6,1   
msg DB 'Minimum Value in an Array: $' 
msg1 DB 'Maximum Value in an Array: $'
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov si,offset arr    
    mov cx,5             ; Array size
    mov bl,[si]          ;for minimum, if any minimum value is found it will be updated
    mov bh,[si]          ;for minimum, if any minimum value is found it will be updated
    
    L1:
    cmp [si],bl          ; Compare current element with bl 
    jle small            ; If current element is smaller, update bl
    jmp checkMax         ; Otherwise, check for maximum

small:
    mov bl,[si]          ; Update minimum value in bl
    
checkMax:
    cmp [si],bh          ; Compare current element with bh (maximum)
    jge large            ; If current element is larger, update bh
    jmp compare           ; Move to the next element

large:
    mov bh,[si]          ; Update maximum value in bh

compare:
    inc si               
    loop L1            
    
    ; Print minimum value
    mov dx,offset msg
    mov ah,9
    int 21h               

    mov al,bl            ; Load the minimum value into al
    add al,48            ; convert Ascii
    mov dl,al
    mov ah,2
    int 21h             
    
    
    
    mov dx,10
    mov ah,2
    int 21h                    ;for spacing
    mov dx,13
    mov ah,2
    int 21h 
    
    ; Print maximum value
    mov dx,offset msg1
    mov ah,9
    int 21h              

    mov al,bh            ; Load the maximum value into al
    add al,48            ; convert AScii
    mov dl,al
    mov ah,2
    int 21h              
    
   
    mov ah,4Ch
    int 21h
    
main endp
end main
