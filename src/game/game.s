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

.keysPressed: .quad 0
.gameMode: .quad 0
.spaceDelay: .quad 0
.delayTicks: .quad 0xA
  
.section .game.text

gameInit:

	// mov $65535, %rdi 
	// call setTimer

	// call    switchToMode13h
    // movq    $colours_data, %rdi
    // call    setPalette
	


	ret



gameLoop:
	mov $0, %rax 
	mov %rax, .keysPressed

	mov $0x1C, %rdi  			# check enter
	call queryKeyCode 
	mov .keysPressed, %rcx 
	or %rcx, %rax
	mov %rax, .keysPressed

	mov  $0x39, %rdi 			# check space 
	call queryKeyCode 
	shl $1, %rax
	mov .spaceDelay, %rdx  
	cmp $0, %rdx
	jne 1f						# clicked once every .spaceDelay
	cmp $0, %rax 				
	je 2f						# .spaceDelay == 0 && rax == 0 --> jump
	mov .delayTicks, %rdx 
	mov %rdx, .spaceDelay		# reset counter
	movb .keysPressed, %cl 
	or %rcx, %rax 
	mov %rax, .keysPressed
	1:
	mov .spaceDelay, %rax 
	dec %rax
	mov %rax, .spaceDelay
	2:

	

	// cmpb $0, .gameMode 
	// jne 1f 
	mov .keysPressed, %rdi 
	call ss_showWelcome

	// 1:

	// mov $0, %rdi 
	// mov $0, %rsi 
	// mov $'T', %rdx 
	// mov $0x06, %rcx 
	// call putChar

// 	# Check if the space key has been pressed
// 	mov $0x1C, %rdi
// 	call	queryKeyCode
// 	cmpq	$0, %rax
// 	je		1f
// 	# If so, print a 'Y'
// 	movb	$'Y', %dl
// 	jmp		2f

// 1:
// 	# Otherwise, print a 'N'
// 	movb	$'N', %dl

// 2:
// 	movq	$0, %rdi
// 	movq	$0, %rsi
// 	movb	$0x0f, %cl
// 	call	putChar

	ret
