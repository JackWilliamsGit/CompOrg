#
# Program Name: negativeConversion.s
# Author: Jack Williams
# Date: 2/26/24
# Purpose: Find the opposite of user's input integer by using 2's compliment operation
#

.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    # print the prompt
    LDR r0, =prompt
    BL printf

    # get user input
    LDR r0, =formatString
    LDR r1, =num
    BL scanf
    LDR r0, =num
    LDR r0, [r0]
    MOV r1, r0
    
    # do the MVN operation and add 1
    MVN r2, r1
    ADD r1, r2, #1

    # print the result
    LDR r0, =output
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr
.data
    prompt: .asciz "Enter a positive integer to convert it to negative: \n"
    formatString: .asciz "%d"
    num: .word 0
    output: .asciz "\nThe negative number is %d\n"

