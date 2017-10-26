    .text
    .globl main #starting point: must be global 

main: # DoCalculation
    jal takeString #take input from user 
    jal printInputSize # print input    
    jal IntialRegister # intialize input registers   
    
    la $9,MyArr      #  address of input
    add $9,$9,$27    
    lb $8, 0($9)      #  ilk adresdeki byte ı al
    jal  IsDigit  # $8 == a[i];
    beq $30,$0 ControlIsZero #if control == 0 a[i] is not digit
ForN1DP: #for (; i < size; ++i) {
    jal  IsDigit  # control = IsDigit(a[i]);
    beq  $30,$0 C_ForN1DP  #control == 0  break loop
    li   $7,0 # temp variable is zero
                #todo ra daki değeri sakla
    jal  ControlIsOne # if (control == 1) // sayı ise 
    bge  $27,$11 C_ForN1DP # index >= size break
    j ForN1DP # back 
C_ForN1DP:
    add $27,$27,1 # ++i; // noktayı geçtik 
Halt:
    # Exit
    li  $v0,10      # exit
    syscall

ControlIsOne: # if control == 1
    add $14,$14,$14 # number1Decimal *= 10;
    add $7,$7,1     # counter is 10 break
    ble $7 ,10 ControlIsOne #counter <=10 ken dön 
    sub $14,$14,48   #number1Decimal-= 48;
    add $9,$9,$27    
    lb $8, 0($9)      #  ilk adresdeki byte ı al
    add $19,$19,1    # ++number1DecimalSize;
    jr  $ra          # Jump to addr stored in $ra

ControlIsZero:
    li  $16,1 #number1IsPozitif = 1
    add $27,$27,1     #++i;
    jr  $ra          # Jump to addr stored in $ra

IsDigit: # if digit control == 1 else control == 0
    move $10,$8  # $10 = a[index]
    sub  $10,$10,0x30 # a[index] -= '0'
    bge  $10,$0 IsDigit_J # if (t >= 0)
    move $30,$0 #return 0;

    jr $ra          # Jump to addr stored in $ra
IsDigit_J:    
    sub $10,$0,$10  #t *= -1;
    add $10,$10,9   #t += 9;
    bge  $10,$0 IsDigit_J1 #  if (t >= 0)
    jr $ra          # Jump to addr stored in $ra
IsDigit_J1:
    li $30,1  # $30 = 1 ;
    jr $ra          # Jump to addr stored in $ra

CheckOperator:

add_SR:

substract_SR:

multiply_SR:

    

IntialRegister:
    move $11,$8    #   $11 = SizeOfinput ;
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
    li   $27,0    #   i
    li   $30,0    #   control
    jr $ra          # Jump to addr stored in $ra

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

    sub $8,$8,1 
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
    .data
MyArr: .space 80
    msg1:   .asciiz "Enter As string like NN.NN O NN.NN :   "
    str2:  .asciiz "You wrote:\n"
    str3:  .asciiz "input size is  :\n"
    newline:   .asciiz  "\n"