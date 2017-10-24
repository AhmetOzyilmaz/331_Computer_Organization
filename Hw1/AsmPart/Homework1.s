	.data
buffer: .space 80
    msg1:   .asciiz "Enter As string like NN.NN O NN.NN :   "
    str2:  .asciiz "You wrote:\n"
    str3:  .asciiz "input size is  :\n"
    newline:   .asciiz  "\n"
	.text
main:
    jal takeString #take input from user 
    jal printInputSize # print input	
	
	la $9,buffer      #  address of input
   	lb $8, 0($9)      #  ilk adresdeki byte ı al
    move $10, $8 # adress 8 deki sayıyı  10.adrese ata
  	sub $10,$10,0x2D # - ilk eleman - ise negatiftir ise
  	beq $10,$0 add_SR
    move $10, $8 # adress 8 deki sayıyı  10.adrese ata
  	sub $10,$10,0x2D # - ise #constrol is first elemen is negative
  	beq $10,$0 IsNegative1 # değilse ilk sayının int ve float kısımkarını ve sayılarını size bilgilerini ve ve kendini alıcaz
    jal 1NDP # ilk sayının decimal partını alıcak

 
    # Exit
    li  $v0,10      # exit
    syscall

1NDP:#first number decimal part
    lb $8, 0($9)      #  ilk adresdeki byte ı al
    move $10, $8 # index deki elemanı al
    jal IsDigit #   $18 == is digit se 1 değilse 0 olucak
    bgt $18,1

    jr $ra          # Jump to addr stored in $ra
IsDigitSe: #ilk elemanı 10 kere topla sonra ikinci elemanla topla
   
Sum10Times:
    
    j 1NDP         # Jump to addr stored in $ra

IsDigit: # $10 adress
    sub $10,$10,0x30 # array[0]-=0 
    ble $10,$0
    
    jr $ra          # Jump to addr stored in $ra

NotNegative1:
    ori $16,$0,0
    jr $ra 
IsNegative1:
    ori $16,$0,1
    jr $ra          # Jump to addr stored in $ra


add_SR:

substract_SR:

multiply_SR:

#end main
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
