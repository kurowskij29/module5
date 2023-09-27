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


#Convert to negative
ldr r1, =input
ldr r1, [r1]
mvn r2, r1
add r1, r2, #1

#Print result
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
output: .asciz "\nThe negative is %d\n"
