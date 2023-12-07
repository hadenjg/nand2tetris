// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// loop in keyboard address location
// if > 0 jump to the loop that writes all values as black
// if == 0 jump to the loop that writes all the values as white
// but you don't want it to constantly be writing the whole time....
// need 2 seperate loops
// loop keyboard address location waiting for > 0
// once that occurs, jump to write black screen
// then once the screen is black jump to loop waitng for keyboard address to be ==0
// then once kbd is == 0.  jump to loop that writes screen to be white.
// then go back to the top and wait for keyboard to be > 0
(START)
	@SCREEN
	D=A
	@fff
	M=D
(BLACK)
	@KBD
	D=M
	@FILL
	D;JGT  // if greater than 0 jump to fill
	@fff
	D=M
	@KBD
	D=A-D //subtract address of kdb from address of incrementing screen
	@BLACK
	D;JEQ // if the address is the same as kdb go back to black	
	@fff
	A=M
	M=0  //setting the value of that resides at the address of the screen to 0
	@fff
	M=M+1 //increment to next address
	@BLACK
	0;JMP
	
(FILL)
	@SCREEN
	D=A
	@fff
	M=D   // fff now stores the address of screen
(WRITE)
	@KBD
	D=M
	@START
	D;JEQ //jump to the start if keyboard == 0
	@fff
	D=M
	@KBD
	D=A-D
	@WRITE
	D;JEQ
	@fff
	A=M
	M=-1
	@fff
	M=M+1
	@WRITE
	0;JMP


