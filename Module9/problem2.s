
#
# Program name:		problem2.s
# Author: 		Jack Williams
# Date: 		3/23/24
# Purpose: 		Implement a grading program as follows.  It should follow the proper style for assembly. 
#				1. Prompt for a name and an average.
#				2. If the average is <0 or >100,  print an error
#				3. Else calculate a grade as 90-100 as A, 80-90 as B, 70-80 as C, else F.
#				4. Print out the student's name and grade.

.text
.global main

main:
	#Push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#Prompt for and read name
	LDR r0, =prompt
	BL printf
	LDR r0, =format
	LDR r1, =name
	BL scanf

	#Prompt for and read grade
	LDR r0, =prompt1
	BL printf
	LDR r0, =format1
	LDR r1, =grade
	BL scanf		

	#Print grade (grade in r0)
	LDR r0, =grade
	LDR r0, [r0]
	BL checkGrade

	#Pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt: .asciz "Enter your name:\n" 
	prompt1: .asciz "Enter your grade:\n"
	format: .asciz "%s"
	format1: .asciz "%d"
	name: .space 40
	grade: .word 0

#endmain

.text
checkGrade:
	#Push the stack
	SUB sp, sp, #8
	STR lr, [sp, #0]
	STR r4, [sp, #4]	

	#Store r0 in r4 for safety
	MOV r4, r0

	#Check if(grade >= 0 && grade <=100)
	MOV r1, #0
	CMP r0, #0
	ADDGE r1, r1, #1	// If grade>=0, r1=1
	MOV r2, #0
	CMP r0, #100
	ADDLE r2, r2, #1	// If grade<=100, r2=1
	AND r1, r1, r2		// If both, r1=1

	#Print error if invalid. 
	CMP r1, #1
	BNE error
		#Grade is valid
		B gradeEvaluation
	error:
		#Grade is invalid
		LDR r0, =errorMsg
		BL printf
		B endError

	gradeEvaluation:
	#If (grade >=90, A is stored)
	MOV r2, #0
	CMP r0, #90
	LDRGE r3, =A
	BGE endEvaluation

	#If (grade >=80, B is stored)
	MOV r2, #0
	CMP r0, #80
	LDRGE r3, =B
	BGE endEvaluation

	#If (grade >=70, C is stored)
	MOV r2, #0
	CMP r0, #70
	LDRGE r3, =C
	BGE endEvaluation
	
	#Else (F is stored)
	LDR r3, =F
	B endEvaluation

	#Print summary
	endEvaluation:
	LDR r0, =summary
	LDR r1, =name
	MOV r2, r3
	BL printf

	endError:

	#Pop the stack
	LDR lr, [sp, #0]
	LDR r4, [sp, #4]
	ADD sp, sp, #8
	MOV pc, lr

.data
	errorMsg: .asciz "Invalid input. Grade must be between 0 and 100\n"
	A: .asciz "A"
	B: .asciz "B"
	C: .asciz "C"
	F: .asciz "F"
	summary: .asciz "Your name is %s and your grade is %s.\n"

