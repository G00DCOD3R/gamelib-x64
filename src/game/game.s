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

.file "src/game/game.s"

.global gameInit
.global gameLoop

.section .game.data

.keysPressed: .byte 0
gameMode: .byte 0
.printingDelay: .byte 0x0
.printingTicks: .byte 0x15
.delayTicks: .byte 0x8
.spaceDelay: .byte 0
.UPDelay: .byte 0
.DOWNDelay: .byte 0 
.LEFTDelay: .byte 0 
.RIGHTDelay: .byte 0 
  
.section .game.text

gameInit:

	// push %r12
	// sub $8, %rsp 
	// mov $8, %r12 
	// 1: 
	// cmp $0, %r12 
	// je 2f
	// 	mov $10, %rdi 
	// 	call random 
	// 	mov %rax, %rdx 
	// 	mov %r12, %rdi 
	// 	mov %r12, %rsi 
	// 	call print_number

	// dec %r12 
	// jmp 1b
	// 2:
	
	// add $8, %rsp 
	// pop %r12 

	ret



gameLoop:

	movb $0, .keysPressed		# keep track of every key that was pressed

	call .decrementDelays		# decrement all delays that are nonzero

	mov $0x1C, %rdi  			# check enter
	call queryKeyCode 
	movb .keysPressed, %cl 
	or %rcx, %rax
	movb %al, .keysPressed
	cmpb $0, .keysPressed
	jne .somethingPressed

	mov  $0x39, %rdi 			# check space (0x39)
	call queryKeyCode 
	shl $1, %rax
	movb .spaceDelay, %dl  
	cmpb $0, %dl
	jne 2f						# clicked once every .spaceDelay
	cmp $0, %rax 				
	je 2f						# .spaceDelay == 0 && rax == 0 --> jump
	movb .delayTicks, %dl 
	movb %dl, .spaceDelay		# reset counter
	movb .keysPressed, %cl 
	or %rcx, %rax 
	movb %al, .keysPressed
	jmp .somethingPressed
	2:


	mov  $0x48, %rdi 			# check UP (0x48)
	call queryKeyCode 
	shl $3, %rax
	movb .UPDelay, %dl  
	cmpb $0, %dl
	jne 2f						# clicked once every .UPDelay
	cmp $0, %rax 				
	je 2f						# .UPDelay == 0 && rax == 0 --> jump
	movb .delayTicks, %dl 
	movb %dl, .UPDelay		# reset counter
	movb .keysPressed, %cl 
	or %rcx, %rax 
	movb %al, .keysPressed
	jmp .somethingPressed
	2:
	
	mov  $0x4B, %rdi 			# check LEFT (0x4B)
	call queryKeyCode 
	shl $2, %rax
	movb .LEFTDelay, %dl  
	cmpb $0, %dl
	jne 2f						# clicked once every .LEFTDelay
	cmp $0, %rax 				
	je 2f						# .LEFTDelay == 0 && rax == 0 --> jump
	movb .delayTicks, %dl 
	movb %dl, .LEFTDelay		# reset counter
	movb .keysPressed, %cl 
	or %rcx, %rax 
	movb %al, .keysPressed
	jmp .somethingPressed
	2:

	mov  $0x4C, %rdi 			# check DOWN (0x4B)
	call queryKeyCode 
	shl $5, %rax
	movb .DOWNDelay, %dl  
	cmpb $0, %dl
	jne 2f						# clicked once every .DOWNDelay
	cmp $0, %rax 				
	je 2f						# .DOWNDelay == 0 && rax == 0 --> jump
	movb .delayTicks, %dl 
	movb %dl, .DOWNDelay		# reset counter
	movb .keysPressed, %cl 
	or %rcx, %rax 
	movb %al, .keysPressed
	jmp .somethingPressed
	2:


	mov  $0x4D, %rdi 			# check RIGHT (0x4B)
	call queryKeyCode 
	shl $4, %rax
	movb .RIGHTDelay, %dl  
	cmpb $0, %dl
	jne 2f						# clicked once every .RIGHTDelay
	cmp $0, %rax 				
	je 2f						# .RIGHTDelay == 0 && rax == 0 --> jump
	movb .delayTicks, %dl 
	movb %dl, .RIGHTDelay		# reset counter
	movb .keysPressed, %cl 
	or %rcx, %rax 
	movb %al, .keysPressed
	jmp .somethingPressed
	2:


	cmpb $0, gameMode 
	jne .nothingPressed
	.somethingPressed:

	cmpb $0, gameMode 
	jne 1f 
	movb .keysPressed, %dil 
	call ss_showWelcome
	ret							# we have nothing to update, since we are in menu mode, thus returning now

	1:
	// # we are in game mode 
	
	movb .keysPressed, %dil 
	call updateDirection		# one of arrow keys was pressed, so update pacman's direction

	// mov $50, %rdi 
	// mov $50, %rsi 
	// mov dir_pacman, %rdx 
	// call print_number

	.nothingPressed:

	cmpb $0, .printingDelay
	jne 1f				# don't jump == we have to update board 

	call move_characters
	movb .printingTicks, %al 
	movb %al, .printingDelay		# reset counter 
	jmp 2f

	1:					# we don't have to update our board yet
	movb .printingDelay, %al 
	dec %al 
	movb %al, .printingDelay
	2:


	ret



// decrement all key delays, so that we can distinguish between 
// one click and multpiple clicks
.decrementDelays: 
	mov $5, %rcx 
	mov $.spaceDelay, %rax 

	1: 
	cmp $0, %rcx 
	je 2f

		cmpb $0, (%rax)
		je 3f
		movb (%rax), %dl 
		dec %dl 
		movb %dl, (%rax)
		3:

	inc %rax 
	dec %rcx
	jmp 1b 
	2:

	ret


