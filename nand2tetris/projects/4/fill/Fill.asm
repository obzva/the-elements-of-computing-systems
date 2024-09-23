// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// initialize the addresses
@SCREEN
D=A
@black_addr
M=D
@white_addr
M=D

// this is the last address of the screen
@24576
D=A
@last
M=D-1

// this loop detects the key press
(KBDLOOP)
    @KBD
    D=M

    @BLACK
	D;JGT

	@WHITE
	D;JEQ

	@KBDLOOP
	0;JMP

// paint them black while pressing keys
(BLACK)
	// set WHITE_ADDR to starting address
	@SCREEN
	D=A
	@white_addr
	M=D

	@black_addr
	D=M
	@last
	D=D-M
	@KBDLOOP
	D;JGT

	@black_addr
	A=M
	M=-1

	@black_addr
	M=M+1
	
	@KBDLOOP
	0;JMP

// clean the whole screen if no press
(WHITE)
	// set BLACK_ADDR to starting address
	@SCREEN
	D=A
	@black_addr
	M=D

	@white_addr
	D=M
	@last
	D=D-M
	@KBDLOOP
	D;JGT

	@white_addr
	A=M
	M=0

	@white_addr
	M=M+1
	
	@WHITE
	0;JMP
