	.data
.include "arrays.asm"

	.text
getOpcode:
	move $t3, $a0		# Stores instruction index
	la $s3, OpArray		# Loads address of array of opcodes
	lw $t4, ($s3)		# Gets first element
		
	li $t5, 7		# Word so have to move by 7
	multu $t5, $t3 		# Actual index compensating for size of a word
	mflo $t3		# Gets the lowest 32 bits
	add $t4, $t4, $t3	# Moves to the right element
	move $v0, $t4
	jr $ra
	
getFunctCode:
	move $t3, $a0		# Stores instruction index
	la $s3, FunctArray		# Loads address of array of opcodes
	lw $t4, ($s3)		# Gets first element
		
	li $t5, 7		# Word so have to move by 7
	multu $t5, $t3 		# Actual index compensating for size of a word
	mflo $t3		# Gets the lowest 32 bits
	add $t4, $t4, $t3	# Moves to the right element
	move $v0, $t4
	jr $ra
	

	
	
	