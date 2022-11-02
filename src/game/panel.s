.file "src/game/panel.s"

.section .game.data

score:
    .byte 12
high_score:
    .byte 0
digits:
    .skip 3

caption:
    .asciz "Tymon and Radoslaw's"
    .asciz "game PAC-MAN"

score_text:
    .asciz "SCORE:"
    .asciz "HIGH SCORE:"

.section .game.text

.global print_number

# Subroutine prints captions that are constantly on panel during the game
setup_panel:
    movq    $50, %rdi
    movq    $50, %rsi
1:  movq    $0, %rcx
    movq    $0, %rdx

    pushq   %rdi
    pushq   %rsi
    call    putChar
    popq    %rsi
    popq    %rdi

    incq    %rdi
    cmpq    $80, %rdi
    jne     1b

    movq    $50, %rdi
    incq    %rsi
    cmpq    $25, %rsi
    jne     1b

    movq    $55, %rdi
    movq    $5, %rsi
    movq    $caption, %rax
1:  movb    (%rax), %dl
    movb    $0x0e, %cl

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
    cmpb    $0, (%rax)
    jne     1b

    incq    %rax
    movq    $59, %rdi
    incq    %rsi
    cmpq    $7, %rsi
    jne     1b

    movq    $52, %rdi
    movq    $9, %rsi
    movq    $score_text, %rax
1:  movb    (%rax), %dl
    movb    $0x0e, %cl

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
    cmpb    $0, (%rax)
    jne     1b

    movq    $52, %rdi
    incq    %rsi
    incq    %rax
    cmpq    $11, %rsi
    jne     1b



    ret

# print_number(int x, int y, int num)
# Subroutine prints a given number starting from given cell.
# This does not work if a number is greater that 999!
print_number:
    pushq   %rsi
    pushq   %rdi
    movq    $0, %rax
    movb    %dl, %al

    cmpq    $0, %rax
    je      case_0

    movq    $digits, %rcx
    movb    $0, (%rcx)
    movb    $0, 1(%rcx)
    movb    $0, 2(%rcx)

1:  cmpq    $100, %rax
    jl      1f
    subq    $100, %rax
    incq    (%rcx)
    jmp     1b

1:  incq    %rcx
1:  cmpq    $10, %rax
    jl      1f
    subq    $10, %rax
    incq    (%rcx)
    jmp     1b

1:  incq    %rcx
    addq    %rax, (%rcx)

    movq    $digits, %rax
1:  cmpb    $0, (%rax)
    jne     1f
    incq    %rax
    jmp     1b

1:  movq    (%rsp), %rdi
1:  movq    $48, %rdx
    addb    (%rax), %dl
    movq    8(%rsp), %rsi
    movq    $0x0e, %rcx
    pushq   %rax
    pushq   %rdi
    call    putChar
    popq    %rdi
    popq    %rax
    incq    %rdi
    incq    %rax
    movq    $digits, %r8
    addq    $3, %r8
    cmpq    %r8, %rax
    jne     1b

    addq    $16, %rsp
    ret

case_0:
    movq    (%rsp), %rdi
    movq    8(%rsp), %rsi
    movq    $0x0e, %rcx
    movq    $48, %rdx
    call    putChar
    addq    $16, %rsp
    ret
