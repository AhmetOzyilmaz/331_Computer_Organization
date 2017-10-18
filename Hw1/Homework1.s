	# Start .text segment (program code)
	.text
	
	.globl	main
main:
	
	li $t0, 3           #terminating value
    li $t1, 4           #byte shifting 
    li $t2, 1           #i increments by 1  
    la $a1, A        # put address of time into $a1
    la $a2, B       # put address of miles into $a2     
    l.s $f1, ($a1)
    l.s $f2, ($a2)

	add.s $f3, $f1, $f2

	li $v0, 2
	mov.s $f12, $f3   # Move contents of register $f3 to register $f12
	syscall
	
	
	# Start .data segment (data!)
	.data
msg1:	.asciiz	"Enter A:   "
msg2:	.asciiz	"Enter B:   "
msg3:	.asciiz	"A + B = "
newline:   .asciiz	"\n"

A:       .float 3.08
B:       .float 4.15