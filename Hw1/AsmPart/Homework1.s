	.data
MyArr: .space 80
    msg1:   .asciiz "Enter As string like NN.NN O NN.NN :   "
    str2:  .asciiz "You wrote:\n"
    str3:  .asciiz "input size is  :\n"
    newline:   .asciiz  "\n"
	.text
main: # DoCalculation
    jal takeString #take input from user 
    jal printInputSize # print input	
    move $11,$8    #   size of input ;
    li   $12,0    #   int number1Decimal = 0;
    li   $13,0    #   int number1Float = 0;
    li   $14,0    #   int number2Decimal = 0;
    li   $15,0    #   int number2Float = 0;
    li   $16,0    #   int number1IsPozitif = 0;
    li   $17,0    #   int number2IsPozitif = 0;
    li   $18,0    #   int resultIsPozitif = 0;
    li   $19,0    #   int number1DecimalSize = 0;
    li   $20,0    #   int number1FloatSize = 0;
    li   $21,0    #   int number2DecimalSize = 0;
    li   $22,0    #   int number2FloatSize = 0;
    li   $23,0    #   int resultDecimal = 0;
    li   $24,0    #   int resultFloat = 0;
    li   $25,0    #   int resultDecimalSize = 0;
    li   $26,0    #   int resultFloatSize = 0;
    li   $27,0    #   index
    li   $30,0    #   control

    la $9,buffer      #  address of input
    lb $8, 0($9)      #  ilk adresdeki byte ı al
    jal  IsDigit  # $8 == a[index];
    add  $10,$10,1 # temp
    sub  $10,$10,1 # temp  
Halt:
    # Exit
    li  $v0,10      # exit
    syscall

IsDigit: # if digit control == 1 else control == 0
    move $10,$8  # $10 = a[index]
    sub  $10,$10,0x30 # a[index] -= '0'
    bge  $10,$0 IsDigit_J # if (t >= 0)
    move $0,$30 return 0;
    jr $ra          # Jump to addr stored in $ra
IsDigit_J:    
    sub $10,$0,$10  #t *= -1;
    add $10,$10,9   #t += 9;
    bge  $10,$0 IsDigit_J1 #  if (t >= 0)
    jr $ra          # Jump to addr stored in $ra
IsDigit_J1:
    move $30,1  # $30 = 1 ;
    jr $ra          # Jump to addr stored in $ra

CheckOperator:

add_SR:

substract_SR:

multiply_SR:


#end main
printInputSize:
    ori      $8,$0,0        #  count = 0
    la       $9,MyArr      #  point at first c
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

    la $a0, MyArr  # load byte space into address
    li $a1, 20      # allot the byte space for string

    move $t0, $a0   # save string to t0
    syscall

    la $a0, str2    # load and print "you wrote" string
    li $v0, 4
    syscall

    la $a0, MyArr  # reload byte space to primary address
    move $a0, $t0   # primary address = t0 address (load pointer)
    li $v0, 4       # print string
    syscall

    jr $ra          # Jump to addr stored in $ra
#end routine
