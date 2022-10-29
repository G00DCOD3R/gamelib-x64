
# Table of Contents



First, make sure you are in mode 13h:

    call switchToMode13h

The following code will draw a gradient. This will nicely show the currently used palette:

    	mov $0, %rbx
    	mov $0, %al
    	mov $0, %rdx
    	mov $0, %rcx
    
    1:	mov %al, 0xA0000(%rbx)
    	inc %rbx
    	inc %al
    	add $1, %rcx
    	cmp $319, %rcx
    	cmove %rdx, %rax
    	cmove %rdx, %rcx
    	cmp  $0xFFFF, %rbx
    	jne 1b

