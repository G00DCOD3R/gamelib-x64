.file "src/game/screenSettings.s"
.global ss_showWelcome
.section .game.data 
.menuPosition: .byte 0
.section .game.text 


// changeScreen(int8[] data, int8 column, int8 row, int8 character)
// changes value of row * (64 + 16) + column in data to character

.changeScreen: 
    mov %rdx, %rax 
    shl $6, %rax 
    shl $4, %rdx 
    add %rdx, %rax 
    add %rsi, %rax 
    add %rdi, %rax 
    movb %cl, (%rax)
    ret 


ss_clearScreen: 
    push %rbp 
    mov %rsp, %rbp 
    push %r12 
    push %r13
    push %r14
    sub $8, %rsp  

    mov $0, %r12 
    mov $0, %r13
    mov $welcome_screen, %r14  

    1:
    cmp $25, %r12 
    je 4f

        2:   
        cmp $80, %r13 
        je 3f

            movb (%r14), %dl 
            mov %r12, %rsi 
            mov %r13, %rdi 
            movb $0x06, %cl
            call putChar

        inc %r14
        inc %r13 
        jmp 2b
        3:

    inc %r12 
    mov $0, %r13 
    jmp 1b
    4:

    add $8, %rsp 
    pop %r14 
    pop %r13 
    pop %r12 
    mov %rbp, %rsp 
    pop %rbp 
    ret 


// takes %rdi that signify which keys were pressed 
// bit at position i says ith key was pressed 
// 0 --> enter 
// 1 --> space 

ss_showWelcome: 
    push %rbp 
    mov %rsp, %rbp 
    push %rdi 
    sub $8, %rsp 

    call ss_clearScreen
    
    mov $1, %rax 
    and -8(%rbp), %rax 
    cmp $0, %rax        # if enter was pressed then rax != 0
    je 1f 

    mov $0, %rdi 
    mov $0, %rsi 
    mov $'G', %rdx 
    mov $0x07, %rcx 
    call putChar

    1:
    mov $2, %rax 
    and -8(%rbp), %rax 
    cmp $0, %rax 
    je 2f 

    movb .menuPosition, %al 
    xor $1, %rax 
    movb %al, .menuPosition         # update .menuPosition (Yes / No)mov $0x06, %rcx 
    shl $1, %rax 
    add $15, %rax 
    mov $14, %rsi 
    mov $welcome_screen, %rdi 
    mov %rax, %rdx 
    mov $'>', %rcx 
    call .changeScreen

    mov $0, %rax 
    movb .menuPosition, %al         # and set the other cell (so if we marked Yes, now take No) to ' '
    xor $1, %rax 
    shl $1, %rax 
    add $15, %rax 
    mov $14, %rsi 
    mov $welcome_screen, %rdi 
    mov %rax, %rdx 
    mov $' ', %rcx 
    call .changeScreen



    2:

    mov %rbp, %rsp 
    pop %rbp 
    ret


