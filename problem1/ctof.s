#
# Program name: ctof.s
# Author: Jack Kurowski
# Date:9/17/2023
# Purpose: This program converts a user input temp in C to F
#
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
ldr r1, =cel
bl scanf


#Convert to fahrenheit
ldr r1, =cel
ldr r1, [r1]
mov r4, #9
mul r0, r1, r4
mov r1, #5
bl __aeabi_idiv
add r1, r0, #32

#Print result
ldr r0, =output
bl printf


# Return to the OS
ldr lr, [sp, #0]
add sp, sp, #4
mov pc, lr

.data
prompt: .asciz "Please enter a temperature in Celsius\n"
formatin: .asciz "%d"
cel: .word 0
output: .asciz "\nThe temperature in fahrenheit is %d\n"
