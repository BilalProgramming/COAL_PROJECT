.model small
.stack 100h
.data
    msg_menu db 10,13,'--- ALU SIMULATOR ---',10,13,'1. Addition',10,13,'2. Subtraction',10,13,'3. AND Logic',10,13,'4. OR Logic',10,13,'Choose Option: $'
    msg_num1 db 10,13,'Enter First Digit: $'
    msg_num2 db 10,13,'Enter Second Digit: $'
    msg_res  db 10,13,'Result: $'
    val1 db ?
    val2 db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display Menu [cite: 32, 33]
    lea dx, msg_menu
    mov ah, 09h
    int 21h

    ; Get Choice
    mov ah, 01h
    int 21h
    sub al, '0'
    mov bl, al ; Store choice in BL

    ; Input Numbers [cite: 8, 15]
    lea dx, msg_num1
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov val1, al

    lea dx, msg_num2
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov val2, al

    ; ALU Operations Logic 
    cmp bl, 1
    je do_add
    cmp bl, 2
    je do_sub
    cmp bl, 3
    je do_and
    cmp bl, 4
    je do_or
    jmp exit

do_add:
    mov al, val1
    add al, val2
    jmp display

do_sub:
    mov al, val1
    sub al, val2
    jmp display

do_and:
    mov al, val1
    and al, val2
    jmp display

do_or:
    mov al, val1
    or al, val2
    jmp display

display:
    add al, '0' ; Convert back to ASCII
    mov bl, al
    lea dx, msg_res
    mov ah, 09h
    int 21h
    mov dl, bl
    mov ah, 02h
    int 21h

exit:
    mov ah, 4Ch
    int 21h
main endp
end main