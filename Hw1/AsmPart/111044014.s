.text
.globl main #starting point: must be global 

main:

	jal readStr

	la $a0, readBuffer
	jal parseInt
	move $s0, $t0

	#temp for digits of float part
	move $s5, $t1

	move $a0, $t1
	jal parseInt
	move $s1, $t0

	# s6 -> digits of float part
	sub $s6, $t1, $s5
	sub $s6, $s6, 1

	move $a0, $t1
	jal parseOperator
	move $s2, $t0

	# skip one whitespace
	add $t1, $t1, 1

	move $a0, $t1
	jal parseInt
	move $s3, $t0

	#temp for digits of float part
	move $s5, $t1

	move $a0, $t1
	jal parseInt
	move $s4, $t0

	# s7 -> digits of float part
	sub $s7, $t1, $s5
	sub $s7, $s7, 1
	
	li $t7,4
	sub $t1,$t7,$s6 
	move $a3,$t1
	jal powTen
	move $s6,$t2

	sub $t1,$t7,$s7 
	move $a3,$t1
	jal powTen
	move $s7,$t2 

	# pow with 10^ 4 - s6 
	mult $s1, $s6
	mflo $s1

		# pow with 10^ 4 - s6 
	mult $s4, $s7
	mflo $s4

	li $a3 , 4
	jal powTen 

	# pow with 10^ 4 
	mult $s0, $t2
	mflo $s0

		# pow with 10^ 4
	mult $s3, $t2
	mflo $s3

	li $t7,-1
	bge $s0,$0 Neg_Jump_1

	mult $t7,$s1
	mflo $s1
Neg_Jump_1:

	bge $s3,$0 Neg_Jump_2

	mult $t7,$s4
	mflo $s4
Neg_Jump_2:


	li $t5,43 # '+'
	beq $s2,$t5 Sum

	li $t5,45 # '-'
	beq $s2,$t5 Substract

	li $t5,42 # '*'
	beq $s2,$t5 Multiply

Result: #s5 result register
	
	div $s5,$t2
	mflo $t5  # result integer part
	mfhi $t6  # float part

	div $t2,$t3
	mflo $t2  # result integer part

	div $t6,$t2
	mflo $t6  # result float part part

	  # "Result is  "
    la $a0, str4
    li $v0, 4
    syscall

   	# Print \n
    li  $v0,1       # print_int syscall code = 1
    move  $a0, $t5
    syscall  

	# Print ','
    li  $v0,4       # print_string syscall code = 4
    la  $a0, comma
    syscall

       	# Print \n
    li  $v0,1       # print_int syscall code = 1
    move  $a0, $t6
    syscall  

Halt:
    # Exit
    li  $v0,10      # exit
    syscall
# END MAIN

Sum:
	add $s5,$s0,$s1
	add $s5,$s5,$s3
	add $s5,$s5,$s4	
	j Result

Substract:
	sub $s5,$s0,$s3
	add $s5,$s5,$s1
	sub $s5,$s5,$s4
	j Result

Multiply:

	j Result

#find 10^n
powTen:
	# -> $a0 n 
	# -> $t2
	li $t2,1 # t2= 10
	li $t3,10
pow_Loop:
	mult $t2, $t3 # t= i*10
	mflo $t2
	sub $a3,$a3,1
	bgt $a3,$0 pow_Loop 
	jr $ra
parseOperator:
	#a0 -> buffer
	#
	#t0 -> operator
	#t1 -> lastAdress (index)
	#
	#t2 -> tempchar
	#t3 -> cmp char

	li $t0, 0

	move $t1, $a0
parseOperator_loop:
	lb $t2, 0($t1) 		# t2= t1[0]
	add $t1, $t1, 1		# t1= t1+1

	li $t3, 43 # '+'
	beq $t2, $t3 parseOperator_end

	li $t3, 45 # '-'
	beq $t2, $t3 parseOperator_end

	li $t3, 42 # '*'
	beq $t2, $t3 parseOperator_end

	li $t3, 10 # '\n'
	beq $t2, $t3 parseOperator_end

	j parseOperator_loop

parseOperator_end:
	move $t0, $t2
	jr $ra

parseInt:
	#a0 -> buffer
	#
	#t0-> parsed int
	#t1-> lastAdress (index)
	#
	#t2 -> tempchar
	#t3 -> cmp char
	#t4 -> sign

	li $t0, 0
	li $t4, 1

	move $t1, $a0

parseInt_loop:
	lb $t2, 0($t1) 		# t2= t1[0]
	add $t1, $t1, 1		# t1= t1+1

	li $t3, 46 # '.'
	beq $t2, $t3 parseInt_end

	li $t3, 32 # ' '
	beq $t2, $t3 parseInt_end

	li $t3, 45 # '-'
	bne $t2, $t3 parseInt_cont
	li $t4, -1
	j parseInt_loop

parseInt_cont:
	li $t3, 48 # '0'
	blt $t2, $t3 parseInt_end

	li $t3, 57 # '9'
	bgt $t2, $t3 parseInt_end

	li $t3, 10 # 10 for multiply
	mult $t0, $t3 # i= i*10
	mflo $t0 # t0= 10 * t0
	sub $t2, $t2, 48 # t2= int(t2)
	add $t0, $t0, $t2

	j parseInt_loop

parseInt_end:
	##
	mult $t0, $t4 # t0 = sign * t0
	mflo $t0
	jr $ra



readStr:
	# ask
    la $a0, msg1
    li $v0, 4
    syscall

    #read str
    li $v0, 8

    #set buffer and size
    la $a0, readBuffer
    li $a1, 20

    syscall

    # "you wrote"
    la $a0, str2
    li $v0, 4
    syscall

    # print str back
    la $a0, readBuffer  # reload byte space to primary address
    li $v0, 4       # print string
    syscall

    jr $ra          # Jump to addr stored in $ra
#end routine

.data
readBuffer: .space 80
    msg1:   .asciiz "Enter As string like NN.NN O NN.NN :   "
    str2:  .asciiz "You wrote:\n"
    str3:  .asciiz "input size is  :\n"
    str4:  .asciiz "Result is    :\n"

    newline:   .asciiz  "\n"
    comma:   .asciiz  ","


   