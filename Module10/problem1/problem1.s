
#
# Program name:		Problem 2
# Author: 		Jack Williams
# Date: 		3/29/24	
# Purpose: 		Write a program to prompt the user for a number and determine if that number is prime. 
#			Your program should print out "Number n is prime" if the number is prime, and "Number 
#			n is not prime if the number is not prime. The user should be able to enter a "-1" to 
#			end the problem. It should print an error if 0, 1, 2 or any negative number other than
#			 -1 are entered.		

.text
.global main

main:
	#push the stack
	SUB sp, sp, #24
	STR lr, [sp, #0]
	STR r4, [sp, #4]
	STR r5, [sp, #8]
	STR r6, [sp, #12]
	STR r7, [sp, #16]
	STR r8, [sp, #20]

	#initialize: [Sentinel Loop]
	LDR r0, =prompt
	BL printf
	LDR r0, =formatNum
	LDR r1, =num
	BL scanf

	#start label: [Sentinel Loop]
	StartSentinel:

	#condition check- branch to end if condition met: [Sentinel Loop]
	LDR r0, =num
	LDR r0, [r0]
	CMP r0, #-1
	BEQ EndSentinel

		#Statement (block) if true: [Sentinel Loop]
		LDR r0, =prompt1
		BL printf
		LDR r0, =formatNum
		LDR r1, =myNum	
		BL scanf
		LDR r0, =myNum
		LDR r0, [r0]

		#if-else statement
		MOV r1, #0
		CMP r0, #0
		ADDEQ r1, r1, #1	//if r0=0, set r1 to 1
		MOV r2, #0
		CMP r0, #1
		ADDEQ r2, r2, #1	
		ORR r1, r1, r2		//if r0= 0 or 1, set r1 to 1
		MOV r2, #0
		CMP r0, #2
		ADDEQ r2, r2, #1	
		ORR r1, r1, r2		//if r0= 0, 1, or 2, set r1 to 1	
		MOV r2, #0
		CMP r0, #-1
		ADDLT r2, r2, #1	
		ORR r1, r1, r2		//if r0= 0, 1, 2, or < -1, set r1 to 1

		CMP r1, #1
		BEQ error
			#if input is valid: [if-else statement]
			
			#dictionary: r4 is max counter, r5 is counter (divisor), r6 is myNum (dividend), r7 is remainder,			 	     #	 	  r8 is isPrimeIndicator
			#initialize: [Control Counter Loop]
			MOV r5, #2
			LDR r4, =myNum
			LDR r4, [r4]
			SUB r4, r4, #1
			LDR r6, =myNum
			LDR r6, [r6]
			MOV r7, #0	
			MOV r8, #0

			StartControlCounter:
				#check end condition: [Control Counter Loop]
				CMP r5, r4
				BGT EndControlCounter
				
				#implement loop block: [Control Counter Loop]
				#if r6%r5 !=0, get next value
				#if r6%r5 =0, print "number is prime" and end Control Counter
				#r6%r5 = r6-(r6/r5)*r5
				MOV r0, r6
				MOV r1, r5
				BL __aeabi_idiv
				MUL r0, r0, r5
				SUB r0, r6, r0
				
				CMP r0, #0
				ADDEQ r8, r8, #1
				BEQ EndControlCounter

				#get the next value: [Control Counter Loop]
				ADD r4, r4, #1
				#branch to start label: [Control Counter Loop]
				B StartControlCounter

			EndControlCounter:

			#stray output becuase idk where else to put it
			CMP r8, #1
			BNE Prime
				LDR r0, =promptNotPrime
				LDR r1, =myNum
				LDR r1, [r1]
				BL printf
				B endIfPrime
			Prime:
				LDR r0, =promptPrime
				LDR r1, =myNum
				LDR r1, [r1]
				BL printf
				B endIfPrime
			endIfPrime:		

			#if input is valid: [if-else statement]
			B endError
		error:
			LDR r0, =errorMsg
			BL printf
		endError:

		#get next value: [Sentinel Loop]
		LDR r0, =prompt
		BL printf
		LDR r0, =formatNum
		LDR r1, =num
		BL scanf
		LDR r0, =num
		LDR r0, [r0]
		#branch to start label: [Sentinel Loop]
		BL StartSentinel

	EndSentinel:

	#pop the stack
	LDR lr, [sp, #0]
	LDR r4, [sp, #4]
	LDR r5, [sp, #8]
	LDR r6, [sp, #12]
	LDR r7, [sp, #16]
	LDR r8, [sp, #20]
	ADD sp, sp, #24	
	MOV pc, lr

.data
	prompt: .asciz "Enter -1 to end program. Enter any other key to continue. "
	prompt1: .asciz "Enter a number to see if prime. Input cannot be 0, 1, 2, or negative. "
	promptPrime: .asciz "The number %d is prime!\n"
	promptNotPrime: .asciz "The number %d is not prime.\n"
	errorMsg: .asciz "Invalid input\n" 
	formatNum: .asciz "%d"
	num: .word 0
	myNum: .word 0
#endmain
