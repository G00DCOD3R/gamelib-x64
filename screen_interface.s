.file "src/game/screen_interface.s"

.section .game.data

.section .game.text

# set_pixel(int pos_x, int pos_y, int col)
# rdi - pos_x
# rsi - pos_y
# rcx - colour index
set_pixel:
    movq    $0x140, %rax
    mulq    %rsi
    addq    %rsi, %rdi
    addq    $0xA0000, %rdi
    movb    %cl, (%rdi)

    ret

# fill_screen(int col)
# rdi - colour index
fill_screen:
    movq    $0xA0000, %rax
1:  movb    %dil, (%rax)
    incq    %rax
    cmpq    $0xAFFFF, %rax
    jne     1b

    ret
