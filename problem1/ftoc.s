#
# Program name: ftoc.s
# Author: Jack Kurowski
# Date:9/17/2023
# Purpose: This program converts a user input temp in F to C
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
ldr r1, =fahr
bl scanf


#Convert to celsius
ldr r1, =fahr
ldr r1, [r1]
sub r1, r1, #32
mov r4, #5
mul r0, r1, r4
mov r1, #9
bl __aeabi_idiv
mov r1, r0


#Print result
ldr r0, =output
bl printf


# Return to the OS
ldr lr, [sp, #0]
add sp, sp, #4
mov pc, lr

.data
prompt: .asciz "Please enter a temperature in Fahrenheit\n"
formatin: .asciz "%d"
fahr: .word 0
output: .asciz "\nThe temperature in Celsius is %d\n"
