.file "src/game/stateHandling.s" 
.section .game.data 

.section .game.text 

.global updateDirection


// updates pacman direction
// takes rdi as input --> keys that was pressed 
// bits of keysPressed should be mapped as follows: 
// enter, space, left, up, right, down
// least significant bit, ..., most significant bit
updateDirection:
    push %rbp 
    mov %rsp, %rbp 

    # update pac-man position
    and $0xFF, %rdi     # make sure ones in rdi are only in last byte (least significant)
    shr $2, %rdi  
    mov $0, %rax 
    1: 
    cmp $0, %rdi 
    je 2f 

        cmp $1, %rdi 
        jne 3f
        movb %al, dir_pacman
        jmp 2f
        3:

    shr $1, %rdi 
    inc %rax 
    jmp 1b
    2:

    # update ghosts directions (at random) 

    

    mov %rbp, %rsp 
    pop %rbp 
    ret 
