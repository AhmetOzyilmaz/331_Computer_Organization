    .text
    .globl main #starting point: must be global 
main: # DoCalculation

Halt:
    li  $v0,10      # exit
    syscall
