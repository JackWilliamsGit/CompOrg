
#
# Program name:		problem3.s
# Author: 		Jack Williams
# Date: 		3/23/24
# Purpose: 		Implement a function to find the largest of 3 values.  The function signature 
#			is "findMaxOf3(int val1, int val2, int val3)".  The function should compare the 
#			3 values, and return the largest.  Be sure to use the ABI standards for all 
#			arguments and return values.  Write a program to prompt for 3 values, call this
#			function to the find the maximum value, and print out the maximum value.  Follow 
#			proper style for assembly.	

.text
.global main

main:
	#Push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#Prompt for and read var1, var2, var3
	LDR r0, =prompt
	BL printf
	LDR r0, =format
	LDR r1, =var1
	BL scanf
	LDR r0, =format
	LDR r1, =var2
	BL scanf
	LDR r0, =format
	LDR r1, =var3
	BL scanf	

	#Call findMaxOf3
	BL findMaxOf3

	#Pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt: .asciz "Enter 3 integers. The largest one will be printed.\n" 
	format: .asciz "%d"
	var1: .word 0
	var2: .word 0
	var3: .word 0

#endmain

.text
findMaxOf3:
	#Push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#call var1Check
	B var1Var2Check

	#if(var1<var2)
	var1Var2Check:
	LDR r0, =var1
	LDR r0, [r0]
	LDR r1, =var2
	LDR r1, [r1]
	CMP r0, r1
	#B else
	BGE var1Var3Check
		#(var1<var2) is true. Check if (var2<var3).
		B var2Var3Check
	#if(var1<var3)
	var1Var3Check:
	LDR r0, =var1
	LDR r0, [r0]
	LDR r1, =var3
	LDR r1, [r1]
	CMP r0, r1
	#B else
	BGE var1Largest
		#(var1<var3) is true. Var3 is largest.
		B var3Largest

	#if(var2<var3)
	var2Var3Check:
	LDR r0, =var2
	LDR r0, [r0]
	LDR r1, =var3
	LDR r1, [r1]
	CMP r0, r1
	#B else
	BGE var2Largest
		#(var2<var3) is true. Var3 is largest.
		B var3Largest

	var1Largest:
		#var1 is largest. Print summary.
		LDR r0, =summary
		LDR r1, =var1
		LDR r1, [r1]
		BL printf
		B endOfProgram	
	var2Largest:
		#var2 is largest. Print summary.
		LDR r0, =summary
		LDR r1, =var2
		LDR r1, [r1]
		BL printf
		B endOfProgram
	var3Largest:
		#var3 is largest. Print summary.
		LDR r0, =summary
		LDR r1, =var3
		LDR r1, [r1]
		BL printf
		B endOfProgram

	endOfProgram:	

	#Pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	summary: .asciz "The largest number is %d\n"


