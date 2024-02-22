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
    
    #Read the user integer
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
    



    #Pop the stack record and return
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "Enter your age user, we are dying to know\n"
    format1: .asciz "%d"
    num1:    .word 99
    output1: .asciz "You're %d  years old?? Yikes, someone call an ambulance\n"


#End main

