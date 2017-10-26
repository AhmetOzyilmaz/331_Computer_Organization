	.text
    .globl main #starting point: must be global 

main: # DoCalculation
  
    # Exit
    li  $v0,10      # exit
    syscall

    .data