#
#Program name:  ageProgram.s
#Author:        Jack Williams
#Date:          2/20/24
#Purpose:       Practice creating prompts, using formatted strings, using gdb tui, and printf/scanf
#


.text
.global main
main:
    #Push the stack record
    SUB sp, sp, #4
    STR lr, [sp]

    #Problem 1:
    #Print a prompt
    LDR r0, =prompt1
    BL printf
    
    #Read the user input
    LDR r0, =format1
    LDR r1, =num1
    BL scanf

    #Print the user input
    LDR r0, =output1
    LDR r1, =num1
    LDR r1, [r1, #0]
    BL printf

    #Problem 2:
    #Print a prompt
    LDR r0, =prompt2
    BL printf

    #Read the user input
    LDR r0, =format1
    LDR r1, =num2
    BL scanf

    #Print the input with tabs around it
    LDR r0, =output2
    LDR r1, =num2
    LDR r1, [r1, #0]
    BL printf

    #Problem 3:
    #Print a prompt
    LDR r0, =prompt3
    BL printf

    #Read user input
    LDR r0, =format1
    LDR r1, =num3
    BL scanf

    #Print the output
    LDR r0, =output3
    LDR r1, = num3
    LDR r1, [r1, #0]
    BL printf

    #EXTRA CREDIT
    #Enter a float, store it in a 64 bit space, then print it
    LDR r0, =prompt4
    BL printf

    LDR r0, =format2
    LDR r1, =num4
    BL scanf

    LDR r0, =output4
    LDR r1, =num4
    LDR r1, [r1, #0]
    BL printf


    #Pop the stack record and return
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "Part 1: Enter your age user, we are dying to know\n"
    format1: .asciz "%d"
    num1:    .word 0
    output1: .asciz "You're %d  years old?? Yikes, someone call an ambulance\n\n"

    prompt2: .asciz "Part 2: Enter a number that will be printed with tabs around it\n"
    num2:    .word 0
    output2: .asciz "Your input number is --\t%d\t-- \n\n"

    prompt3: .asciz "Part 3: Print your favorite number\n"
    num3:    .word 0
    output3: .asciz "Your favorite number is \"%d\" \n\n"

    prompt4: .asciz "EXTRA CREDIT: Enter a floating point number\n"
    format2: .asciz "%f"
    num4:    .space 8
    output4: .asciz "Your floating point number is %f"


#End main

