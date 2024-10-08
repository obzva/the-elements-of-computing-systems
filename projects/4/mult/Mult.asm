// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// i = 0
@i
M=0

// M[R2] = 0
@R2
M=0

(LOOP)
// if i - M[R1] == 0 then goto END
@i
D=M
@R1
D=D-M
@END
D;JEQ

// M[R2] += M[R0]
@R0
D=M
@R2
M=D+M

// i++
@i
M=M+1

// iterate
@LOOP
0;JMP

(END)
// terminate with inifinite loop
@END
0;JMP