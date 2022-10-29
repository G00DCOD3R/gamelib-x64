
# Table of Contents



First, make sure you have switched to video mode 13h:

    call switchToMode13h

In order to use the sample palette insert this before your main function

    palette:	.incbin "docs/examples/palette.bin"

Finally, call the kernel's function to set the palette:

    mov $palette, %rdi
    call setPalette

