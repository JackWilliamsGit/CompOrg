#
# Program Name: feetInchConverter
# Author: Jack Williams
# Date: 2/26/24
# Purpose: use arithmetic operators to convert feet to inches, and vice versa
#

.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    # Program Part 1: feet -> inches
    # Get user input for feet
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =num
    BL scanf
    LDR r0, =num
    LDR r0, [r0]
    MOV r4, r0

    # Convert to inches
    MOV r5, #12
    MUL r4, r4, r5

    # Get user input for inches
    LDR r0, =prompt1
    BL printf
    LDR r0, =formatString
    LDR r1, =num
    BL scanf
    LDR r3, =num
    LDR r3, [r3]

    # Combine feet and inches into only inches, print
    ADD r1, r3, r4
    LDR r0, =output
    BL printf

    # Program Part 2: inches-> feet
    # Get user input for inches
    LDR r0, =prompt2
    BL printf
    LDR r0, =formatString
    LDR r1, =num
    BL scanf
    LDR r7, =num
    LDR r7, [r7]     // total inches in r7

    # Convert to feet and inches
    MOV r0, r7
    MOV r1, #12
    BL __aeabi_idiv
    MOV r4, r0       // total feet in r4
    MUL r5, r4, r1
    SUB r6, r7, r5   // remaining inches in r6

    # Print result
    LDR r0, =output1
    MOV r1, r4
    MOV r2, r6
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr
.data
    prompt: .asciz "Program Part 1: Enter feet and then inches to convert to total inches.\nFeet: "
    prompt1: .asciz "Inches: "
    prompt2: .asciz "Program Part 2: Enter an amount of inches to convert to feet and inches.\nInches: "
    formatString: .asciz "%d"
    num: .word 0

    output: .asciz "\nYour total value in inches is: %d\n\n"
    output1: .asciz "\nYour total value is %d feet %d inches\n"

