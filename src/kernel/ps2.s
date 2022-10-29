/*
This file is part of gamelib-x64.

Copyright (C) 2014 Otto Visser

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

.include "src/kernel/00_boot_vars.s"

.file "src/kernel/ps2.s"

.section .kernel.data
ps2_init_str:		.asciz "* Initializing PS/2 subsystem...\n"
ps2_init_done_str:	.asciz "* Initializing PS/2 subsystem: done\n"
ps2_status_str:		.asciz "ps/2 status: %x\n"
keyboard_in_str:	.asciz "Keyboard in: %x\n"

PS2_COMMAND	= 0x64
PS2_DATA	= 0x60


code_set1:	.byte 0, 0, '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '=', 0
			.byte 0, 'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '[', ']', 0
			.byte 0, 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\'', '\`'
			.byte 0, '\\', 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/', 0
			.byte '*', 0, ' ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
			.byte '7', '8', '9', '-', '4', '5', '6', '+', '1', '2', '3', '0', '.'
			.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
			.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
			.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
scan_buffer:	.space 256
.section .kernel

init_ps2:
	enter	$0, $0

	mov		$ps2_init_str, %r8
	#call	printf

	# steps analogue to http://wiki.osdev.org/%228042%22_PS/2_Controller
	# step 1: TODO: make sure USB goes first and disables USB legacy; after that we check there's ps/2 or not
	# step 2: TODO check that with ACPI (bit 1, offset 109 in FADT should be on)
	# step 3: disable devices
	#mov		$0xAD, %rax
	#out		%al, $PS2_COMMAND
	#mov		$0xA7, %rax
	#out		%al, $PS2_COMMAND

	# step 4: flush the buffer
	in		$PS2_DATA, %al		# ignore content

	# step 5: set controller configuration byte
	
	# step 6: perform self test
#	mov		$0xAA, %rax
#	out		%al, $PS2_COMMAND
# TODO check response: 0x55

	# step 7: one or two channels? (see step 5)

# step 8: perform interface test

# step 9: enable devices

# step 10: reset devices

	mov		$ps2_init_done_str, %r8
	#call	printf

	# Clear scan code buffer
	mov $255, %rcx
1:	movb $0, scan_buffer(%rcx)
	sub $1, %rcx
	jnz 1b
	

	leave
	ret

print_ps2_status:
	enter	$0, $0
	push	%rax

	mov		$0, %rax
	in		$PS2_COMMAND, %al
	push	%rax
	mov		$ps2_status_str, %r8
	#call	printf

	leave
	ret

ps2_bottom_half:
	enter	$0, $0
	push	%rax

1:	call 		ps2_process_scancode

	in 		$PS2_COMMAND, %al
	test 		$0x1, %al
	jnz 		1f # If there are still codes in the buffer, keep processing them

	
	pop	%rax
	leave
	ret

ps2_process_scancode:
	mov 		$0, %bl #value that we will write
	mov		$0, %rax
	in		$PS2_DATA, %al
	bt		$7, %rax			
	jc		1f
	mov 		$1, %bl
1:
	and		$0x7F, %rax #deactive 7th bit
	mov 		%bl, scan_buffer(%rax)
	
	ret

ps2_translate_scancode:
	enter	$0, $0
	push	%rax

	mov		$code_set1, %rax
	mov		(%rax, %r8, 1), %al
	and		$0xFF, %rax
	mov		%rax, %r8

	pop		%rax
	leave
	ret

