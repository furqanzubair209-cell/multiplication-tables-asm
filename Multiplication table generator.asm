Org 100h

.data
newline db 13,10,'$'
.code

start:
    mov bl,1                ; current table number = 1

outer_loop:
    cmp bl,20
    jg  done

    ; --- header line ---
    mov dx,offset newline
    mov ah,9
    int 21h

    mov al,bl
    call print_num

    mov dl,':'
    mov ah,2
    int 21h

    mov dx,offset newline
    mov ah,9
    int 21h

    mov cl,1                ; multiplier = 1

inner_loop:
    cmp cl,10
    jg  next_table

    ; Print table number
    mov al,bl
    call print_num
    
    ; Print '*'
    mov dl,'*'
    mov ah,2
    int 21h
    
    ; Print multiplier
    mov al,cl
    call print_num
    
    ; Calculate multiplication
    mov al,bl               ; AL = table number
    mov dl,cl               ; DL = multiplier
    mul dl                  ; AX = AL × DL
    
    ; Print '='
    push ax                 ; Save multiplication result
    mov dl,'='
    mov ah,2
    int 21h
    pop ax                  ; Restore multiplication result
    
    ; Print result
    call print_ax

    mov dx,offset newline
    mov ah,9
    int 21h

    inc cl
    jmp inner_loop

next_table:
    inc bl
    jmp outer_loop

done:
    mov ah,4Ch
    int 21h

;-----------------------------
; print 16-bit number in AX
;-----------------------------
print_ax proc
    push ax
    push bx
    push cx
    push dx

    mov bx,10
    xor cx,cx
convert:
    xor dx,dx
    div bx
    push dx
    inc cx
    cmp ax,0
    jne convert

print_digs:
    pop dx
    add dl,'0'
    mov ah,2
    int 21h
    loop print_digs

    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_ax endp

;-----------------------------
; print 8-bit number in AL
;-----------------------------
print_num proc
    push ax
    xor ah,ah
    call print_ax
    pop ax
    ret
print_num endp