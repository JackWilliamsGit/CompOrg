
#
# Program name:		problem1-2.s
# Author: 		Jack Williams
# Date: 		3/23/24
# Purpose: 		Write and test a function to check if a user input is an alphabetical character or not.
#			Implement it in two ways:
#				1. As a logical variable	
#				2. Any way that does not use logical values.
#

.text
.global main

main:
	#Push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#Prompt for and read number
	LDR r0, =prompt
	BL printf
	LDR r0, =format
	LDR r1, =number
	BL scanf	

	#Without using r1 as a logical variable, do the If statement.
	LDR r0, =number
	LDR r0, [r0]
	#If (input <=0x41 && input >=0x51) 
	CMP r0, #0x41
	LDRLE r1, =true
	CMP r0, #0x51
	LDRGE r2, =true
	AND r1, r1, r2		// If true, r1=1

	#If (input <=0x61 && input >=0x7a)
	CMP r0, #0x61
	LDRLE r1
	MOV r3, #0
	CMP r0, #0x7a
	ADDLE r3, r3, #1
	AND r2, r2, r3		// If true, r2=1
	ORR r1, r1, r2		// If either are true, r1=1

	CMP r1, #1
	BLT else
		LDR r0, =output
		BL printf
		B endError
	else:
	LDR r0, =error
	BL printf

	endError:
	
	#Pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
data:
	prompt: .asciz "Enter a single character input. I'll tell you if it was an alphabetical char or not. \n" 
	error: .asciz "Not an alphabetical character! \n"
	output: .asciz "You entered a character! \n"
	format: .asciz "%d"
	number: .word 0
	true: .asciz "true"

#endmain




