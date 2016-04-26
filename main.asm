	.data
line: .space 128	# Assuming line size limited to 128 characters
.include "readFile.asm"
	.text
main:
	la $s1, buffer		# Storing file input address
	li $t1, 0		# Initializing main loop iterator
	
	
	loop: 
	bge $t1, 1000, endloop		# loops 1000 times to get through the buffer
	lb $t2, ($s1)			# loads current position in buffer into the register
	bne $t2,'\n', cont		# if current char isn't a newline, continue
	jal parse			# else, parse 
	cont:
	move $a0, $t2
	li $v0, 11
	syscall
	add $t1, $t1, 1			# increments loop counter
	add $s1, $s1, 1 		# increments position in the buffer
	j loop

	endloop:
	
	.include "sound.asm"		# plays the music
	li $v0, 10			# syscall to exit program
	syscall
	
parse:
	li $a0, 5	# Prints the number 5
	li $v0, 1	# Syscall to print integer
	syscall
	jr $ra
