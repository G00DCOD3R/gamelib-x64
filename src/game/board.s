.file "src/game/board.s"

.section .game.data

board_state:
red_ghost:
    .byte 0, 4 # ghost 1 - position (x, y)
dir_red:
    .byte 2
blue_ghost:
    .byte 0, 1 # ghost 2
dir_blue:
    .byte 2
pink_ghost:
    .byte 0, 2 # ghost 3
dir_pink:
    .byte 2
green_ghost:
    .byte 0, 3 # ghost 4
dir_green:
    .byte 2
pac_man:
    .byte 2, 5 # pac-man - position (x, y), direction (0 / 1 / 2 / 3)
dir_pacman:
    .byte 2
board: # 0 - nothing, 1 - wall, 2 - food
    .byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    .byte 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1
    .byte 1, 1, 1, 2, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 1
    .byte 1, 2, 2, 2, 1, 2, 1, 2, 2, 2, 1, 2, 2, 2, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 2, 2, 2, 1
    .byte 1, 2, 1, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1
    .byte 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1
    .byte 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1
    .byte 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1
    .byte 1, 2, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1
    .byte 1, 2, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 1, 2, 2, 2, 1, 0, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1
    .byte 1, 2, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 1, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1
    .byte 1, 2, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 1, 0, 0, 0, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1
    .byte 1, 2, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 2, 1, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1
    .byte 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1
    .byte 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1
    .byte 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1
    .byte 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1
    .byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1
    .byte 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1
    .byte 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 2, 2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1
    .byte 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 2, 1, 1, 2, 2, 2, 2, 2, 1, 2, 1, 2, 2, 2, 2, 2, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1
    .byte 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1
    .byte 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 1, 1, 2, 2, 2, 1, 2, 2, 2, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1
    .byte 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 1, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 1, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1
    .byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1

.section .game.text

colour_of_obj:
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

# Subroutine changes coordinates of ghosts and pacman and then
# prints current state of the board
move_characters:
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
4:  addq    $3, %rax
    cmpq    $board, %rax
    jne     loop

    movq    $0, %rax
    movq    $pac_man, %rcx
    movb    1(%rcx), %al
    movq    $50, %rdx
    mulq    %rdx
    movq    $0, %rdx
    movb    (%rcx), %dl
    addq    %rdx, %rax
    addq    $board, %rax

    cmpb    $2, (%rax)
    jne     1f
    movb    $0, (%rax)
    movq    $score, %rax
    addb    $1, (%rax)
    movq    $58, %rdi
    movq    $9, %rsi
    movq    $0, %rdx
    movb    score, %dl
    call    print_number

1:  call    update_board
    ret
    