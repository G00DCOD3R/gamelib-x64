.file "src/game/screenSettings.s"
.global ss_clearScreen
.section .game.text 

welcome_screen:
.ascii "                                                                                "
.ascii "                                                                                "
.ascii "                                                                                "
.ascii "                                                                                "
.ascii "                WELCOME!                                                        "
.ascii "                                                                                "
.ascii "                THIS IS OUR IMPLEMENTATION OF FAMOUS GAME                       "
.ascii "                                                                                "
.ascii "                                                                                "
.ascii "                PAC-MAN                                                         "
.ascii "                                                                                "
.ascii "                                                                                "
.ascii "                                                                                "
.ascii "                DO YOU WANT TO TRY IT?                                          "
.ascii "                                                                                "
.ascii "                YES!                                                            "
.ascii "                                                                                "
.ascii "                NO                                                              "
.ascii "                                                                                "
.ascii "                                                                                "
.ascii "                                                                                "
.ascii "                                                                                "
.ascii "                                                                                "
.ascii "                                                                                "
.ascii "                                                                                "



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

    forLoop0:
    cmp $25, %r12 
    je endForLoop0

        forLoop1:   
        cmp $80, %r13 
        je endForLoop1

            mov %r12, %rsi 
            mov %r13, %rdi 
            movb (%r14), %dl 
            movb $0x06, %cl
            call putChar

        inc %r14
        inc %r13 
        jmp forLoop1
        endForLoop1:

    inc %r12 
    mov $0, %r13 
    jmp forLoop0
    endForLoop0:

    add $8, %rsp 
    pop %r14 
    pop %r13 
    pop %r12 
    mov %rbp, %rsp 
    pop %rbp 
    ret 
