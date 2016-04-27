	.data
line: .space 128	# Assuming line size limited to 128 characters
.include "readFile.asm"
	.text
main:
	la $s1, buffer		# Storing file input address *NOTE* buffer is where all the file data is stored
	jal clearLine		# Initializes line with null chars
	la $s2, line		# Stores address of where each line is stored
	li $t1, 0		# Initializing main loop iterator
	
	loop: 
	bge $t1, 1000, endloop		# loops 1000 times to get through the buffer
	lb $t2, ($s1)			# loads current position in buffer into the register
	sb $t2, ($s2)			# stores current char from buffer into the line
	bne $t2,'\n', cont		# if current char isn't a newline, go to cont label to continue
	jal parseLine			# else, parse the line
	jal clearLine			# clears the line space with null chars for the next line
	cont:
	move $a0, $t2		# prints char *DEBUGGING*
	li $v0, 11		# *DEBUGGING*
	syscall			# *DEBUGGING*
	add $t1, $t1, 1			# increments loop counter
	add $s1, $s1, 1 		# increments position in the buffer
	add $s2, $s2, 1			# increments position in line
	j loop

	endloop:
	
	.include "sound.asm"		# plays the music
	li $v0, 10			# syscall to exit program
	syscall
	
clearLine:		# This subroutine 'clears' the line .space with space chars to be used by the next line
	li $t3, 0	# counter
	la $t4, line	# initializes the address of the line space
	
	clearLoop:
	bge $t3, 128, endClearLoop	# 128 is the hardcoded length of the line space
	li $t2, '\n'			# loads null character into the register
	sb $t2, ($t4)			# stores null character into the line
	add $t3, $t3, 1			# increment the counter
	add $t4, $t4, 1			# move up one character from the current position in the line space
	j clearLoop
	endClearLoop:
	
	jr $ra
	
parseLine:
#	.include "instructionStringParsing.asm"			*DOESN'T INTEGRATE PROPERLY RIGHT NOW"*
	li $a0, 5	# Prints the number 5 when newline	*DEBUGGING*
	li $v0, 1	# Syscall to print integer	*DEBUGGING*
	syscall		# *DEBUGGING*
	jr $ra
