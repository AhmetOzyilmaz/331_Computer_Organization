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





Halt:
    # Exit
    li  $v0,10      # exit
    syscall
# END MAIN

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
    newline:   .asciiz  "\n"