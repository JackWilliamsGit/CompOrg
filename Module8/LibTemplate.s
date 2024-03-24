
# Filename:	libConversions.s
# Author: 	Jack Williams
# Date: 	3/18/24
# Purpose:	Implement two functions here that do unit conversions. This will be linked to 
#		a file containing a main program.


# Library rules: Declare the funcitons as static external (labels that are .global and are 
# defined in the current file).

.global miles2kilometer
.global kph
.global CToF
.global InchesToFt

.text
# Function: 	miles2kilometer
# Purpose: 	convert a value in miles to a value in kilometers
# Input: 	r0 - number of miles
# Output: 	r0 - number of kilometers
miles2kilometer:

	#push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#Convert miles to kilometer.
	MOV r3, #161
	MUL r0, r0, r3
	MOV r1, #100

	#Divide operation accepts 2 arguments: 
	# (divisor in r0, dividend in r1. Result is stored in r0)
	BL __aeabi_idiv

	# For greatest precision, when you are multiplying something by a fractional number,
	# you are supposed to multiply, then divide.

	#pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
#end miles2kilometer

.text
# Function: 	kph
# Purpose: 	convert x miles traveled over y hours into a kilometer/hour speed.
# Input: 	r0 - number of hours
#		r1 - number of miles
# Output: 	r0 - speed in km/h
kph:
	#Stack push
	SUB sp, sp, #4
	STR lr, [sp]

	#Save r0 (hours) in r4
	MOV r4, r0

	#Save r1 (miles) in r5
	MOV r5, r1

	#Move miles into r0 as an argument
	MOV r0, r1

	#Call miles2kilometer(int hours)
	BL miles2kilometer

	#Kilometers is now in r0. Do maths to find kph speed. Result stored in r0.
	MOV r1, r4
	BL __aeabi_idiv

	#Stack pop
	LDR lr, [sp, #0]
	ADD sp, #4
	MOV pc, lr

.data
#end kph

.text
# Function: 	CToF
# Purpose: 	convert temp in C to F
# Input:	r0 - temp integer in Celcius
# Output:	r0 - temp integer in Fahrenheit
CToF:
	#Stack push
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#F= C*9/5 +32
	MOV r1, #9
	MUL r0, r0, r1
	MOV r1, #5
	BL __aeabi_idiv
	ADD r0, r0, #32

	#Stack pop
	LDR lr, [sp, #0]
	ADD sp, #4
	MOV pc, lr

.data
#end CToF

.text
# Function:	 InchesToFt
# Purpose: 	 COnvert inches to feet
# Input:	 r0 - int inches
# Output:	 r0 - int feet
InchesToFt:
	#Stack push
	SUB sp, sp, #4
	STR lr, [sp, #0]

	MOV r1, #12
	BL __aeabi_idiv

	#Stack pop
	LDR lr, [sp, #0]
	ADD sp, #4
	MOV pc, lr

.data
#end InchesToFt

