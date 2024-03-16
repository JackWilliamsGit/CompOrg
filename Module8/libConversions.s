
# Declare the funcitons as static external (labels that are
# .global and are defined in the current file).
.global miles2kilometer
.global kph
.text

miles2kilometer:
	#Convert miles to kilometers. 
	#Function has 1 argument (int miles) in r0.
	MUL r0, r0, #161
	MOV r1, #100

	#Divide operation accepts 2 arguments: 
	# (divisor in r0, dividend in r1. Result is stored in r0)
	BL __aeabi_idiv

	# Insert comment about how even greater precision could ******
	# be achieved using this method for integer numbers **********

kph:
	#Convert x miles traveled over y hours int a kilometer/hour speed.
	#Function has 2 arguments (int hours, int miles) in r0 and r1.
	
	#Permanently store arguments in registers
	
	




.data

# end miles2kilometer
#end kph

