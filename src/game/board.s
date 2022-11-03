.file "src/game/board.s"

.section .game.data

board_state:
red_ghost:
    .byte 3, 1 # ghost 1 - position (x, y)
dir_red:
    .byte 2
blue_ghost:
    .byte 1, 3 # ghost 2
dir_blue:
    .byte 2
pink_ghost:
    .byte 1, 5 # ghost 3
dir_pink:
    .byte 2
green_ghost:
    .byte 7, 1 # ghost 4
dir_green:
    .byte 2
pac_man:
    .byte 2, 5 # pac-man - position (x, y), direction (0 / 1 / 2 / 3)
dir_pacman:
    .byte 2
board: # 0 - nothing, 1 - wall, 2 - food
    .byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    .byte 1, 1, 1, 6, 2, 6, 2, 6, 2, 2, 2, 2, 2, 6, 2, 6, 2, 2, 2, 6, 2, 6, 2, 2, 6, 2, 6, 2, 2, 6, 2, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 2, 2, 2, 2, 2, 2, 6, 1
    .byte 1, 1, 1, 2, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 1, 2, 1, 6, 2, 6, 2, 2, 2, 2, 2, 2, 2, 6, 1, 1, 1, 1, 1, 1, 2, 1
    .byte 1, 6, 2, 6, 1, 2, 1, 6, 2, 6, 1, 6, 2, 6, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 6, 2, 6, 1, 1, 6, 2, 6, 1
    .byte 1, 2, 1, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 6, 2, 2, 2, 2, 2, 6, 1, 1, 1, 6, 6, 2, 6, 1, 1, 1
    .byte 1, 6, 2, 2, 2, 6, 2, 2, 2, 6, 2, 6, 2, 2, 2, 6, 2, 2, 2, 6, 2, 6, 2, 2, 6, 2, 6, 2, 2, 6, 2, 6, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1
    .byte 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 2, 2, 6, 2, 6, 2, 6, 2, 6, 1
    .byte 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1
    .byte 1, 2, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 6, 6, 2, 6, 2, 2, 2, 6, 6, 6, 1
    .byte 1, 2, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 1, 2, 2, 2, 1, 0, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1
    .byte 1, 2, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 1, 0, 0, 1, 6, 6, 2, 2, 6, 2, 2, 2, 6, 6, 1
    .byte 1, 2, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 1, 0, 0, 0, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1
    .byte 1, 2, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 2, 1, 0, 0, 0, 0, 1, 6, 2, 2, 2, 6, 2, 2, 2, 2, 6, 1
    .byte 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1
    .byte 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1
    .byte 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1
    .byte 1, 6, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 6, 2, 2, 2, 2, 6, 2, 2, 2, 2, 2, 6, 2, 2, 2, 2, 2, 2, 2, 2, 2, 6, 6, 2, 2, 2, 6, 2, 2, 2, 2, 6, 1
    .byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1
    .byte 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 6, 2, 2, 6, 2, 6, 1, 6, 2, 6, 2, 2, 2, 2, 6, 2, 2, 6, 1, 6, 2, 2, 6, 2, 6, 2, 6, 2, 2, 6, 1
    .byte 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 6, 2, 6, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1
    .byte 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 2, 1, 1, 6, 2, 6, 2, 6, 1, 2, 1, 6, 2, 2, 2, 2, 6, 1, 1, 6, 2, 6, 1, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1
    .byte 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 2, 1, 1, 2, 1, 2, 1, 6, 2, 6, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 6, 2, 2, 6, 2, 6, 2, 6, 2, 2, 6, 1
    .byte 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 2, 1, 6, 6, 1, 2, 1, 2, 1, 1, 1, 6, 2, 6, 1, 6, 2, 6, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1
    .byte 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 6, 2, 6, 1, 1, 6, 2, 6, 2, 2, 2, 6, 1, 6, 2, 6, 1, 6, 2, 6, 1, 6, 2, 2, 2, 2, 2, 2, 2, 2, 2, 6, 1
    .byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1

.section .game.text

colour_of_obj:
    andb    $3, %dil
    cmpb    $1, %dil
    je      colour_of_obj_wall
    jg      colour_of_obj_food
    colour_of_obj_nothing:
        movq    $0x10, %rax
        ret
    colour_of_obj_wall:
        movq    $0x30, %rax
        ret
    colour_of_obj_food:
        movq    $0x16, %rax
        ret

char_of_obj:
    andb    $3, %dil
    cmpb    $2, %dil
    je      char_of_obj_food
    char_of_obj_not_food:
        movq    $' ', %rax
        ret
    char_of_obj_food:
        movq    $'.', %rax
        ret

char_of_pac_man:
    cmpb    $0, %dil
    je      left
    cmpb    $1, %dil
    je      up
    cmpb    $2, %dil
    je      right
    down:
        movq    $'v', %rax
        ret
    left:
        movq    $'<', %rax
        ret
    up:
        movq    $'^', %rax
        ret
    right:
        movq    $'>', %rax
        ret

update_board:
    pushq   %rbp
    movq    %rsp, %rbp

    call .ghostMechanics

    movq    $0, %rdi
    movq    $0, %rsi
    movq    $board, %rax
1:  pushq   %rax
    pushq   %rdi
    movb    (%rax), %dil
    call    colour_of_obj
    popq    %rdi
    movq    %rax, %rcx
    popq    %rax

    pushq   %rax
    pushq   %rdi
    movb    (%rax), %dil
    call    char_of_obj
    popq    %rdi
    movq    %rax, %rdx
    popq    %rax

    pushq   %rdi
    pushq   %rsi
    pushq   %rax
    subq    $8, %rsp
    call    putChar
    addq    $8, %rsp
    popq    %rax
    popq    %rsi
    popq    %rdi

    incq    %rdi
    incq    %rax
    cmpq    $50, %rdi
    jne     1b

    movq    $0, %rdi
    incq    %rsi
    cmpq    $25, %rsi
    jne     1b

    movq    $red_ghost, %rax
    movq    $0, %rdi
    movq    $0, %rsi
    movb    (%rax), %dil
    movb    1(%rax), %sil
    movq    $0x14, %rcx
    movq    $'@', %rdx
    call    putChar

    movq    $blue_ghost, %rax
    movq    $0, %rdi
    movq    $0, %rsi
    movb    (%rax), %dil
    movb    1(%rax), %sil
    movq    $0x19, %rcx
    movq    $'@', %rdx
    call    putChar

    movq    $pink_ghost, %rax
    movq    $0, %rdi
    movq    $0, %rsi
    movb    (%rax), %dil
    movb    1(%rax), %sil
    movq    $0x1c, %rcx
    movq    $'@', %rdx
    call    putChar

    movq    $green_ghost, %rax
    movq    $0, %rdi
    movq    $0, %rsi
    movb    (%rax), %dil
    movb    1(%rax), %sil
    movq    $0x1a, %rcx
    movq    $'@', %rdx
    call    putChar

    movq    $pac_man, %rax
    movq    2(%rax), %rdi
    call    char_of_pac_man
    movq    %rax, %rdx
    movq    $pac_man, %rax
    movq    $0, %rdi
    movq    $0, %rsi
    movb    (%rax), %dil
    movb    1(%rax), %sil
    movq    $0x1e, %rcx
    call    putChar

    movq    %rbp, %rsp
    popq    %rbp

    ret


// getCell(int8 x, int8 y) 
// returns address to board cell that have this coordinates 
getCell:
    movq    $0, %rax
    movq    %rsi, %rax
    movq    $50, %rdx
    mulq    %rdx
    movq    $0, %rdx
    movq    %rdi, %rdx
    addq    %rdx, %rax
    addq    $board, %rax
    ret

# Subroutine changes coordinates of ghosts and pacman and then
# prints current state of the board
move_characters:
    push    %rbp
    mov     %rsp, %rbp
    movq    $board_state, %rax
loop:
    cmpb    $0, 2(%rax)
    je      0f
    cmpb    $1, 2(%rax)
    je      1f
    cmpb    $2, 2(%rax)
    je      2f
    cmpb    $3, 2(%rax)
    je      3f
0:  decq    (%rax)
    jmp     4f
1:  decq    1(%rax)
    jmp     4f
2:  incq    (%rax)
    jmp     4f
3:  incq    1(%rax)
    jmp     4f
4:  pushq   %rax
    subq    $8, %rsp
    call    pac_man_death
    addq    $8, %rsp
    popq    %rax
    addq    $3, %rax
    cmpq    $board, %rax
    jne     loop

    movq    $0, %rdi
    movq    $0, %rsi
    movq    $pac_man, %rcx
    movb    (%rcx), %dil
    movb    1(%rcx), %sil
    call    getCell

    movb    (%rax), %cl
    andb    $3, %cl
    cmpb    $2, %cl
    jne     1f
    subb    $2, (%rax)
    movq    $score, %rax
    addb    $1, (%rax)
    movq    $58, %rdi
    movq    $9, %rsi
    movq    $0, %rdx
    movb    score, %dl
    call    print_number

1:  call    update_board
    call    pac_man_death
    mov     %rbp, %rsp
    popq    %rbp
    ret

pac_man_death:
    movq    $pac_man, %rax
    movq    $red_ghost, %rcx
    movw    (%rcx), %dx
    cmpw    %dx, (%rax)
    je      die
    movq    $blue_ghost, %rcx
    movw    (%rcx), %dx
    cmpw    %dx, (%rax)
    je      die
    movq    $pink_ghost, %rcx
    movw    (%rcx), %dx
    cmpw    %dx, (%rax)
    je      die
    movq    $green_ghost, %rcx
    movw    (%rcx), %dx
    cmpw    %dx, (%rax)
    je      die
    ret
die:
    # DIE
    // movb $0, gameMode
    ret


// update ghost direction if they are on intersection
// ghosts cannot walk through the walls and cannot turn around 

.ghostMechanics: 
    push %rbp 
    mov %rsp, %rbp 
    push %rbx 
    push %r12 
    push %r13 
    sub $8, %rsp 

    mov $red_ghost, %rbx 
    mov $4, %r12 


    8:
    cmp $0, %r12 
    je 9f 

        mov $0xF, %r13    # bitmask which directions are available
        
        mov $0, %r9 
        mov $0, %r10
        movb (%rbx), %r9b 
        movb 1(%rbx), %r10b 
        push %r9          # rbp - 40 
        push %r10         # rbp - 48

        dec %r9                     # left
        mov %r9, %rdi 
        mov %r10, %rsi 
        call getCell 
        movb (%rax), %cl 
        cmpb $1, %cl 
        jne 1f

        mov $1, %rcx 
        xor %rcx, %r13 
        1:
        mov -40(%rbp), %r9 
        mov -48(%rbp), %r10        # set back ghost coordinates


        dec %r10                     # up
        mov %r9, %rdi 
        mov %r10, %rsi 
        call getCell 
        cmpb $1, (%rax) 
        jne 1f
        mov $1, %rcx 
        shl $1, %rcx 
        xor %rcx, %r13 
        1:
        mov -40(%rbp), %r9 
        mov -48(%rbp), %r10        # set back ghost coordinates


        inc %r9                     # right
        mov %r9, %rdi 
        mov %r10, %rsi 
        call getCell 
        cmpb $1, (%rax) 
        jne 1f
        mov $1, %rcx 
        shl $2, %rcx 
        xor %rcx, %r13 
        1:
        mov -40(%rbp), %r9 
        mov -48(%rbp), %r10        # set back ghost coordinates



        inc %r10                     # down
        mov %r9, %rdi 
        mov %r10, %rsi 
        call getCell 
        cmpb $1, (%rax) 
        jne 1f
        mov $1, %rcx 
        shl $3, %rcx 
        xor %rcx, %r13 
        1:

        add $16, %rsp               # pop ghost coordinates from stack

        mov $55, %rdi # DEBUG
        mov $0, %rsi 
        mov %r13, %rdx
        call print_number   # END / DEBUG

        mov $0, %rcx 
        movb 2(%rbx), %cl          # load direction
        xor $2, %rcx 
        mov $1, %rax 
        shl %cl, %rax
        xor $0xF, %rax              # current_mask & (0xF ^ (1 << (x ^ 2))) --> ghost can't move back 
        and %rax, %r13


        

        mov %r13, %rdi 
        call popcount 
        mov %rax, %rdi  
        call random 

        mov $0, %rcx 
        mov $0, %r9 

        
        1: 

            mov %r13, %rdx 
            and $1, %rdx 
            cmp $1, %rdx 
            jne 3f 
                cmp %r9, %rax 
                je 2f 
                inc %r9 
            3:
        
        shr $1, %r13 
        inc %rcx  
        jmp 1b 
        2:

        // movb %cl, 2(%rbx)      # update current direction

    jmp 9f
    add $3, %rbx 
    dec %r12 
    jmp 8b 
    9:


    add $8, %rsp 
    pop %r13 
    pop %r12 
    pop %rbx 
    mov %rbp, %rsp 
    pop %rbp 
    ret 

popcount: 
    mov $1, %rax 
    ret

    1: 
    cmp $0, %rdi 
    je 2f

        mov %rdi, %rcx 
        and $1, %rcx 
        cmp $1, %rcx 
        jne 3f
            inc %rax 
        3:

    shr $1, %rdi 
    jmp 1b 
    2:

    ret
