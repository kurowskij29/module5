#
# Program name: eorVarSwap.s
# Author: Jack Kurowski
# Date:9/17/2023
# Purpose: This program swaps 2 numbers w/o intermediate variables using xor
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
ldr r1, =a
ldr r2, =b
bl scanf


#Swap
ldr r1, =a
ldr r2, =b
ldr r1, [r1]
ldr r2, [r2]
eor r1, r1, r2
eor r2, r1, r2
eor r1, r1, r2


#Print result
ldr r0, =output
bl printf


# Return to the OS
ldr lr, [sp, #0]
add sp, sp, #4
mov pc, lr

.data
prompt: .asciz "Please enter 2 numbers, separated by a space:\n"
formatin: .asciz "%d %d"
a: .word 0
b: .word 0
output: .asciz "\nEntry 1 was assigned to r1 and entry 2 was assigned to r2. r1 is now %d and r2 is now %d\n"
