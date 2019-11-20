/*
This file is part of gamelib-x64.

Copyright (C) 2014 Tim Hegeman

gamelib-x64 is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

gamelib-x64 is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with gamelib-x64. If not, see <http://www.gnu.org/licenses/>.
*/

.global setTimer
.global putChar
.global readKeyCode

MODE2H_BACKUP = 0x120000
MODE13H_BACKUP = 0x110000	

.section .kernel

# void setTimer(int16 reloadValue)
#
# The timer used by this library continually counts down from the reloadValue
# and fires an interrupt whenever this counter reaches zero. As the timer has
# a clock of 1193182 Hz, the interrupt rate is (1193182 / reloadValue) Hz.
# E.g., for 60 Hz the reloadValue should be set to 19886.
#
# Note: this library uses the legacy PIT, which is not guaranteed to reach
#       more than 100 Hz on physical machines. (100 Hz is typically used by
#       operating systems to schedule processes.)
setTimer:
	pushq	%rbp
	movq	%rsp, %rbp

	movb	$0x36, %al
	outb	%al, $0x43

	movq	%rdi, %rax
	outb	%al, $0x40
	xchgb	%al, %ah
	outb	%al, $0x40

	movq	%rbp, %rsp
	popq	%rbp
	ret

# void putChar(int8 x, int8 y, int8 char, int8 color)
#
# Writes a character to the screen at coordinates (x, y). The resolution of
# the screen is 80 by 25 characters. For more information, look up "VGA text mode".
putChar:
	pushq	%rbp
	movq	%rsp, %rbp

	# The address to write to is 0xB8000 + 2 * (80 * y + x)
	andq	$0xFF, %rdi
	andq	$0xFF, %rsi
	shlq	$4, %rsi		# RSI = 16 * y
	movq	%rsi, %rax		# RAX = 16 * y
	shlq	$2, %rsi		# RSI = 64 * y
	addq	%rsi, %rax		# RAX = 80 * y
	addq	%rdi, %rax

	# Ensure the index on the screen is within bounds
	cmpq	$2000, %rax
	jae		1f

	movq	$0xB8000, %rdi
	shlq	$1, %rax
	addq	%rax, %rdi		# RDI now holds the address at which the 

	# Write the character
	movb	%dl, %al
	movb	%cl, %ah
	movw	%ax, (%rdi)

1:
	movq	%rbp, %rsp
	popq	%rbp
	ret




# int8 readKeyCode()
#
# Reads a single byte from the keyboard buffer. If a byte could be read,
# it is returned in the lowest 8 bits of the return value. Otherwise, 0
# is returned. For information on how to interpret these bytes, look up
# PS2 scan codes.
readKeyCode:
	pushq	%rbp
	movq	%rsp, %rbp

	call	ps2_getkey
	movq	$0, %rax
	or		%r8, %r8
	jz		1f
	movzx	%r8b, %rax

1:
	movq	%rbp, %rsp
	popq	%rbp
	ret

# void switchToMode13h()
# Switches the video mode to 13h (320x200 256 colors) as outlined by the
# VGA standard. Before it does so, it backs up 64 kb from 0xA0000 into
# 0x100000. It restores 64 kb from 0x110000 into 0xA0000.
switchToMode13h:

	mov $m13h_regs, %rdi
	call vga_write_regs

	
	
	mov $0x4000, %rcx
	mov $0xA0000, %rsi
	mov $MODE2H_BACKUP, %rdi
	rep movsq

	mov $0x4000, %rcx
	mov $MODE13H_BACKUP, %rsi
	mov $0xA0000, %rdi
	rep movsq
	
	ret

# void switchToMode2h()
# Switches to the default text mode. This is equivalent to mode 12h
# (80x25 text) as defined by the VGA standard. Before it does so, it backs
# up 64 kb from 0xA0000 into 0x110000. It restores 64 kb from 0x100000
# into 0xA0000	
switchToMode2h:	
	mov $0x10000, %rcx
	mov $0xA0000, %rsi
	mov $MODE13H_BACKUP, %rdi
	rep movsb

	mov $0x10000, %rcx
	mov $MODE2H_BACKUP, %rsi
	mov $0xA0000, %rdi
	rep movsb

	mov $m2h_regs, %rdi
	call vga_write_regs
	
	ret

