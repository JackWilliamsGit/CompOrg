
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
	LDR r0, =number
	LDR r0, [r0]
	BL printf	


	EndIf:
	
	#Pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
data:
	prompt: .asciz "Enter a single character input. I'll tell you if it was an alphabetical char or not. \n" 
	error: .asciz "Not an alphabetical character! \n"
	valid: .asciz "You entered a character! \n"
	format: .asciz "%s"
	number: .space 40

#endmain




