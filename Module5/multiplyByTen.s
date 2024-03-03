#
# Program: multiplyByTen.s
# Author: Jack Williams
# Date: 2/26/24
# Purpose: multiply an input value by 10 through LSL and ADD operators
#

.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    # Get integer from user
    LDR r0, =prompt
    BL printf
    LDR r0, =formatString
    LDR r1, =num
    BL scanf
    LDR r4, =num
    LDR r4, [r4]      // user value in r4

    # Perform shift and ADD operations
    LSL r0, r4, #3    // multiplies by 8
    LSL r1, r4, #1    // multiplies by 2
    ADD r1, r0, r1

    # Print answer
    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter the number you want to multiply by 10: \n"
    formatString: .asciz "%d"
    num: .word 0
    output: .asciz "Answer: %d\n\n"

