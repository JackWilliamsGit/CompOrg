#
# Program Name:  tempConversion.s
# Author:        Jack Williams
# Date:          02/25/24
# Purpose:       Program to convert an inputted Temp in (F) to (C) and vice versa
#

.text
.global main
main:
    # Push the stack
    SUB sp, sp, #4
    STR lr, [sp]

    # Convert temperature from degree Celcius to Fahrenheit
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =degreeC
    BL scanf

    LDR r0, =degreeC
    LDR r0, [r0]
    MOV r1, #9
    MUL r0, r0, r1
    MOV r1, #5
    BL __aeabi_idiv

    MOV r2, r0
    MOV r1, #32
    ADD r0, r1, r2
    MOV r1, r0
    LDR r0, =outputF
    BL printf
    
    #Convert temperature from degree Fahrenheit to Celcius
    LDR r0, =prompt1
    BL printf
    LDR r0, =formatString
    LDR r1, =degreeF
    BL scanf

    LDR r0, =degreeF
    LDR r0, [r0]
    MOV r1, #32
    SUB r0, r0, r1
    MOV r2, r0
    MOV r1, #5
    MUL r0, r1, r2
    MOV r1, #9
    BL __aeabi_idiv
    MOV r1, r0
    LDR r0, =outputC
    BL printf

    # Pop the stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr
.data
    # Data for C-->F conversion program
    prompt: .asciz "\nEnter a temperature in C to convert to F: \n"
    formatString: .asciz "%d"
    degreeC: .word 0
    outputF: .asciz "Temperature in F is %d \n"

    # Data for F-->C conversion program
    prompt1: .asciz "\nEnter temperature in F to convert to C: \n"
    outputC: .asciz "Temperature in C is %d \n"
    degreeF: .word 0


