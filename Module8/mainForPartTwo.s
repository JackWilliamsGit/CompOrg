.text
.global main
main:
	#push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#print prompt
	LDR r0, =prompt
	BL printf

	#scanf
	LDR r0, =format
	SUB sp, sp, #4
	LDR r1, [sp, #0]
	BL scanf
	LDR r0, [sp, #0]
	ADD sp, sp, #4

	BL CToF
	MOV r1, r0
	LDR r0, =prompt1
	BL printf

	#print other prompt
	LDR r0, =prompt2
	BL printf

	#scanf
	LDR r0, =format
	SUB sp, sp, #4
	LDR r1, [sp, #0]
	BL scanf
	LDR r0, [sp, 0]
	ADD sp, sp, #4

	BL InchesToFt
	MOV r1, r0
	LDR r0, =prompt3
	BL printf

	#pop stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Enter a temp in Celcius to convert it to Fahrenheit: \n"
	prompt1: .asciz "Your temp in Fahrenheit is %d \n"
	prompt2: .asciz "Enter your length in inches to convert it to feet: \n"
	prompt3: .asciz "Your length in feet is %d \n"
	format: .asciz "%d"
