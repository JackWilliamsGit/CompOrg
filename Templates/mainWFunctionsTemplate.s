
#
# Program name:		main.s
# Author: 		Jack Williams
# Date: 		
# Purpose: 		
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

	#Pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

data:
	prompt: .asciz " \n" 
	prompt1: .asciz " \n"
	prompt2: .asciz " \n"
	prompt3: .asciz " \n"
	format: .asciz "%d"
	number: .word 0

#endmain


.text
functionName:
	#Push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]



	#Pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data

#endfunctionName

