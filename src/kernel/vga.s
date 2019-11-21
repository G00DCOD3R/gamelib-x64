.section .kernel.data

VGA_INSTAT_READ = 0x3DA
	
VGA_MISC_WRITE = 0x3C2
VGA_SEQ_INDEX = 0x3C4
VGA_SEQ_DATA = 0x3C5
VGA_CRTC_INDEX = 0x3D4
VGA_CRTC_DATA = 0x3D5
VGA_GC_INDEX = 0x3CE
VGA_GC_DATA = 0x3CF
VGA_AC_INDEX = 0x3C0
VGA_AC_WRITE = 0x3C0

VGA_PEL_MASK = 0x3C6
VGA_PEL_WRITE = 0x3C8
VGA_PEL_DATA = 0x3C9	
	
VGA_NUM_SEQ_REGS = 5
VGA_NUM_CRTC_REGS = 25
VGA_NUM_GC_REGS = 9
VGA_NUM_AC_REGS = 21

.file "src/kernel/vga.s"

.section .kernel
	
m13h_regs:	
# Misc register
	.byte 0x63
# SEQ registers
	.byte 0x03, 0x01, 0x0F, 0x00, 0x0E

#CRTC registers
	.byte 0x5F, 0x4F, 0x50, 0x82, 0x54, 0x80, 0xBF, 0x1F
	.byte 0x00, 0x41, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x9C, 0x0E, 0x8F, 0x28, 0x40, 0x96, 0xB9, 0xA3
	.byte 0xFF

#GC registers
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x05, 0x0F
	.byte 0xFF

#AC registers
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
	.byte 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F
	.byte 0x41, 0x00, 0x0F, 0x00, 0x00

m2h_regs:
#Misc register
	.byte 0x67
#SEQ register
	.byte 0x03, 0x00, 0x03, 0x00, 0x02
#CRTC registers
	.byte 0x5F, 0x4F, 0x50, 0x82, 0x55, 0x81, 0xBF, 0x1F
	.byte 0x00, 0x4F, 0x0D, 0x0E, 0x00, 0x00, 0x00, 0x50
	.byte 0x9C, 0x0E, 0x8F, 0x28, 0x1F, 0x96, 0xB9, 0xA3
	.byte 0xFF
#GC registers
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x0E, 0x00
	.byte 0xFF
#AC registers
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x14, 0x07
	.byte 0x38, 0x39, 0x3A, 0x3B, 0x3C, 0x3D, 0x3E, 0x3F
	.byte 0x0C, 0x00, 0x0F, 0x08, 0x00
	
vga_write_regs:
	push %rbx
	
	mov %rdi, %rbx # rdi - address of register dump
	
	# Write misc register
	mov (%rdx), %al
	mov $VGA_MISC_WRITE, %dx
	out %al, %dx

	inc %rbx

	# Write seq registers
	mov $0, %rcx	
1:	mov %cl, %al
	mov $VGA_SEQ_INDEX, %dx
	out %al, %dx

	mov (%rbx), %al
	mov $VGA_SEQ_DATA, %dx
	out %al, %dx
	
	inc %rcx
	inc %rbx
	cmp $VGA_NUM_SEQ_REGS, %rcx
	jne 1b
	
	# Unlock CRTC registers
	mov $0x03, %al
	mov $VGA_CRTC_INDEX, %dx
	out %al, %dx

	mov $VGA_CRTC_DATA, %dx
	in %dx, %al
	or $0x80, %al
	mov $VGA_CRTC_DATA, %dx
	out %al, %dx

	mov $0x11, %al
	mov $VGA_CRTC_INDEX, %dx
	out %al, %dx

	mov $VGA_CRTC_DATA, %dx
	in %dx, %al
	and $0x7F, %al
	out %al, %dx

	# Ensure registers remain unlocked
	mov 0x03(%rbx), %al
	or $0x80, %al
	mov %al, 0x03(%rbx)

	mov 0x11(%rbx), %al
	and $0x7F, %al
	mov %al, 0x11(%rbx)

	# Write CRTC registers
	mov $0, %rcx
1:
	mov $VGA_CRTC_INDEX, %dx
	mov %rcx, %rax
	out %al, %dx

	mov $VGA_CRTC_DATA, %dx
	mov (%rbx), %al
	out %al, %dx
	
	inc %rbx
	inc %rcx
	cmp $VGA_NUM_CRTC_REGS, %rcx
	jne 1b

	# Write to Graphics Controller registers	
	mov $0, %rcx

1:
	mov $VGA_GC_INDEX, %dx
	mov %rcx, %rax
	out %al, %dx

	mov $VGA_GC_DATA, %dx
	mov (%rbx), %al
	out %al, %dx

	inc %rbx
	inc %rcx

	cmp $VGA_NUM_GC_REGS, %rcx
	jne 1b


	#Write Attribute Controller registers
	mov $0, %rcx

1:	mov $VGA_INSTAT_READ, %dx
	in %dx, %al

	mov $VGA_AC_INDEX, %dx
	mov %rcx, %rax
	out %al, %dx

	mov $VGA_AC_WRITE, %dx
	mov (%rbx), %al
	out %al, %dx

	inc %rbx
	inc %rcx

	cmp $VGA_NUM_AC_REGS, %rcx
	jne 1b


	# Unblank display and lock palette

	mov $VGA_INSTAT_READ, %dx
	in %dx, %al

	mov $VGA_AC_INDEX, %dx
	mov $0x20, %al
	out %al, %dx

	pop %rbx
	ret

# sets a single palette index
# rdi - red (0-63)
# rsi - green (0-63)
# rdx - blue (0-63)
# rcx - index (0-255)	
vga_set_palette_index:

	mov %rdx, %r8
	
	mov $0xFF, %al
	mov $VGA_PEL_MASK, %dx
	out %al, %dx
	
	mov %rcx, %rax
	mov $VGA_PEL_WRITE, %dx
	out %al, %dx

	mov $VGA_PEL_DATA, %dx

	mov %rdi, %rax
	out %al, %dx

	mov %rsi, %rax
	out %al, %dx

	mov %r8, %rax
	out %al, %dx
	
	ret


