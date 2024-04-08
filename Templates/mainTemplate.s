
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

	#Prompr, read and print number
	LDR r0, =promptNum
	BL printf
	LDR r0, =formatNum
	LDR r1, =number
	BL scanf	
	LDR r0, =formatOutNum
	LDR r1, =number
	LDR r1, [r1, #0]
	BL printf
	
	#Prompt, read and print string
	LDR r0, =promptStr
	BL printf
	LDR r0, =formatStr
	LDR r1, =name
	BL scanf
	LDR r0, =formatOutStr
	LDR r1, =name
	BL printf	

	#Pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

data:
	promptNum: .asciz "Enter your number \n" 
	promptStr: .asciz "Enter your name \n"
	formatNum: .asciz "%d"
	formatStr: .asciz "%s"
	number: .word 0
	name: .space 40
	formatOutNum: .asciz "Your number is %d"
	formatOutStr: .asciz "Your name is %s"

#endmain


.text
functionName:
	#Push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]
	#Also push r4-r12 if they will be used.



	#Pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data

#endfunctionName

