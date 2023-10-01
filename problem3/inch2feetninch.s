#
# Program name: feetninch2inch.s
# Author: Jack Kurowski
# Date:9/17/2023
# Purpose: This program converts a user input feet/inches to inches only
.text
.global main
main:
# Save return to os on stack
sub sp, sp, #4
str lr, [sp, #0]

# Print prompt and scan input
ldr r0, =prompt
bl printf
ldr r0, =formatin
ldr r1, =inches
bl scanf


#Convert to feet and inches
ldr r1, =inches
ldr r1, [r1]
mov r4, r1
mov r0, r1
mov r1, #12
bl __aeabi_idiv
mul r5, r0, r1
sub r6, r4, r5
mov r1, r0
mov r2, r6


#Print result
ldr r0, =output
bl printf


# Return to the OS
ldr lr, [sp, #0]
add sp, sp, #4
mov pc, lr

.data
prompt: .asciz "Please enter a length in inches:\n"
formatin: .asciz "%d"
inches: .word 0
output: .asciz "\nThe length in feet and inches is %d\' %d\"\n"
