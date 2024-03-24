
#
# Program name:		main.s
# Author: 		Jack Williams
# Date: 		3/17/24
# Purpose: 		Find the average speed in kilometers/hr of a user's road trip. 
#			Practice global functions and linking to a library.
#

.text
.global main

main:
	#push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#Print the prompt describing the program
	LDR r0, =prompt
	BL printf

	#prompt user to enter miles traveled
	LDR r0, =prompt1
	BL printf

	#scanf, then store miles in r4. DONT FORGET ABOUT THE NEW SCANF FORMAT.
	LDR r0, =inputFormat
	SUB sp, sp, #4
	MOV r1, sp
	BL scanf
	LDR r4, [sp, #0]
	ADD sp, sp, #4

	#prompt user to enter the hours spent
	LDR r0, =prompt2
	BL printf

	#scan for user input, then store hours in r5
	LDR r0, =inputFormat
	SUB sp, sp, #4
	MOV r1, sp
	BL scanf	
	LDR r5, [sp, #0]
	ADD sp, sp, #4

	# Call function that finds the avg speed in kph. 
	# Function has arguments of (int hours, int miles). 
	# Speed is returned in r0.
	MOV r0, r5
	MOV r1, r4
	BL kph

	#Print the answer
	MOV r6, r0
	LDR r0, =prompt3
	MOV r1, r6
	BL printf

	#pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

data:
	prompt: .asciz "You just took a trip. Enter the miles traveled and the 
hours spent, and the average speed (kilometers/hour) will be calculated"
	prompt1: .asciz "\n\nMiles traveled: "
	prompt2: .asciz "\nHours spent: "
	prompt3: .asciz "\nYour average speed on this trip was %d kilometers/hr\n\n"
	inputFormat: .asciz "%d"
	inputNum: .word 0

#endmain
