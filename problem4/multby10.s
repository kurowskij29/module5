#
# Program name: negate.s
# Author: Jack Kurowski
# Date:9/17/2023
# Purpose: This program converts a user input number to its negative
#
.text
.global main
main:
# save return to os on stack
sub sp, sp, #4
str lr, [sp, #0]

# print prompt and scan input
ldr r0, =prompt
bl printf
ldr r0, =formatin
ldr r1, =input
bl scanf


#Use shifts to multiply by 10
ldr r1, =input
ldr r1, [r1]
lsl r2, r1, #3 //this multiplies by 8 and stores in new
add r3, r2, r1 // add once to get x9
add r4, r3, r1 // add a second to get x10



#Print result
mov r1, r4 //put result in r1
ldr r0, =output
bl printf


# Return to the OS
ldr lr, [sp, #0]
add sp, sp, #4
mov pc, lr

.data
prompt: .asciz "Please enter an integer\n"
formatin: .asciz "%d"
input: .word 0
output: .asciz "\nThe number x10 is %d\n"
