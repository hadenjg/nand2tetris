// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// Assumes that R0 >= 0, R1 >= 0, and R0 * R1 < 32768.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// in c
// int ram0 = 3;
// int ram1 = 4;
// int ram2 = 0;
// int i = 0;
// While ( i < ram1)
// {
//   ram2= ram0 + ram2
//	 i++;
// }

@i 		// i refers to some mem location
M=1
@R2		//refers to RAM[2]
M=0

(LOOP)
	@i
	D=M		// d = i value
	
	@R1
	D=D-M 	// d = i-RAM[1]
	
	@END
	D;JGT 	// if i-RAM[1] > 0 go to END
	
	@R0
	D=M 	// set d = RAM[0]
	
	@R2
	M=D+M	// set RAM[2] += RAM[0]
	
	@i
	M=M+1 	// increment i
	
	@LOOP
	0;JMP
	
(END)
	@END
	0;JMP	//infinite loop
