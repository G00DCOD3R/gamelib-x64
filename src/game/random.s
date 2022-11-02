.file "src/game/random.s" 
.section .game.data 

.section .game.text 

.global random 


// random(int x) -> generates random int from interval [0;x-1]
// returns to rax, according to calling conventions

random: 
    push %rbp 
    mov %rsp, %rbp 

    push %rdi 
    sub $8, %rsp 

    rdtsc           # get current cpu timestamp 
    shr $4, %rax    # last bits 'not so random' according to post at answers.ewi
    mov -8(%rbp), %rdi 
    div %rdi        # rdx = rax % rdi 
    mov %rdx, %rax  


    mov %rbp, %rsp 
    pop %rbp 
    ret 