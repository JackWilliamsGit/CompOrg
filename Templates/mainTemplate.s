
#
# Program name:		main.s
# Author: 		Jack Williams
# Date: 		
# Purpose: 		
#

.text
.global main

main:
	#push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#Print the prompt
	LDR r0, =prompt
	BL printf

	#prompt user to enter number
	LDR r0, =prompt1
	BL printf

	#scanf, then store number in r4
	LDR r0, =inputFormat
	SUB sp, sp, #4
	MOV r1, sp
	BL scanf
	LDR r4, [sp, #0]
	ADD sp, sp, #4

	#prompt user to enter number 2
	LDR r0, =prompt2
	BL printf

	#scan for user input, then store number 2 in r5
	LDR r0, =inputFormat
	SUB sp, sp, #4
	MOV r1, sp
	BL scanf	
	LDR r5, [sp, #0]
	ADD sp, sp, #4

	#pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz " \n" 
	prompt1: .asciz " \n"
	prompt2: .asciz " \n"
	prompt3: .asciz " \n"
	inputFormat: .asciz "%d"
	inputNum: .word 0

#endmain
