;Program to print 1,2,3,4
.model small          
.stack 100h
.data 
arr DB 57,56,55,54,53,52,51,50,49,48
.code
main Proc
  mov ax,@data
  mov ds,ax
  mov si,offset arr
  mov cx,10
  
  l1:
  mov dl,[si]
  mov ah,2
  int 21h
  Inc si  ;mov dx,[si+1]
  loop l1
  
  
  
  mov ah,4ch
  int 21h
    
    
   
    
    main endp
end main
