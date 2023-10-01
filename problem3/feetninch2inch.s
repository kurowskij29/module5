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
ldr r1, =feet
ldr r2, =inches
bl scanf


#Convert to inches
ldr r1, =feet
ldr r2, =inches
ldr r1, [r1]
ldr r2, [r2]
mov r4, #12
mul r3, r1, r4
add r1, r3, r2

#Print result
ldr r0, =output
bl printf


# Return to the OS
ldr lr, [sp, #0]
add sp, sp, #4
mov pc, lr

.data
prompt: .asciz "Please enter a length with feet and inches, separated by a space:\n"
formatin: .asciz "%d %d"
feet: .word 0
inches: .word 0
output: .asciz "\nThe length in inches is %d\n"
