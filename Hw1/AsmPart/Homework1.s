.data
    buffer: .space 80
    msg1:   .asciiz "Enter As string like NN.NN O NN.NN :   "
    str2:  .asciiz "You wrote:\n"
    str3:  .asciiz "input size is  :\n"

    newline:   .asciiz  "\n"
.text
#   $8 == input size 

main:
    jal takeString #take input from user 
    jal printInputSize # print input
   

    # Exit
    li  $v0,10      # exit
    syscall

printInputSize:
    ori      $8,$0,0        #  count = 0
    la       $9,buffer      #  point at first c
loop:   
    lbu      $10,0($9)      # get the char
    sll      $0,$0,0        # branch delay
       
    beq      $10,$0,done    # exit loop if char == null
    sll      $0,$0,0        # branch delay

    addiu    $8,$8,1        # count++
    addiu    $9,$9,1        # point at the next char

    j        loop
    sll      $0,$0,0        # branch delay slot
done:    
    sll      $0,$0,0        # target for branch

    la $a0, str3    # load and print "you wrote" string
    li $v0, 4
    syscall

    move $a0,$8
    li $v0, 1
    syscall

    # Print \n
    li  $v0,4       # print_string syscall code = 4
    la  $a0, newline
    syscall
    
    jr $ra          # Jump to addr stored in $ra
#end routine

takeString:

    la $a0, msg1    # Load and print string asking for string
    li $v0, 4
    syscall

    li $v0, 8       # take in input

    la $a0, buffer  # load byte space into address
    li $a1, 20      # allot the byte space for string

    move $t0, $a0   # save string to t0
    syscall

    la $a0, str2    # load and print "you wrote" string
    li $v0, 4
    syscall

    la $a0, buffer  # reload byte space to primary address
    move $a0, $t0   # primary address = t0 address (load pointer)
    li $v0, 4       # print string
    syscall

    jr $ra          # Jump to addr stored in $ra
#end routine
