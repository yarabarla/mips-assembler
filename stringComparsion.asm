.data
string: .ascii "add $t1, $t2"
nLine: .asciiz "\n"
opcode: .space 5
reg1: .space 5
reg2: .space 5
reg3: .space 5
regArray: .word opcode, reg1, reg2, reg3
addL: .asciiz "add"
subL: .asciiz "add"
opcodeArray: .word addL, subL

.text
strCompare:
	la $a0, string
	jal getComponents 
	
return2Main:	
	#jal printArray
	jal getBinaryString
returnBString:
	j exit
	
exit:
	li $v0, 10
	syscall		

	
getComponents:	 
	la $t0, string
	add $s0, $zero, $zero
	add $s1, $zero, $zero
	addi $s7, $zero, 1
	la $s2, regArray
	add $t2, $s2, $zero	
	addi $t4, $t4, 1
loop1:	
	beq $s0, 32, endLoop1
	lb  $a0, ($t0)	
	jal checkASCII
	move $a1, $v0
	jal storeCharOnArray	
        add $t0, $t0, 1 
        add $s0, $s0, 1        
	j loop1		
endLoop1:
	j return2Main
		
storeCharOnArray:
	beq $a1, 0, return	
	sb $a0, ($t2)
        add $t2, $t2, 1        
return:
        jr $ra
	
changePtr:
	sll $t3, $t4, 2
	add $t2, $s2, $t3
	add $t4, $t4, 1
	jr $ra
	
checkASCII:	
	beq $a0, 32, space
	beq $a0, 36, dollar 
	beq $a0, 44, comma
	beq $a0, 10, comma
	j increment	
space: 	
	li $v0, 0 
	addi $s7, $s7, -1
	beq $s7, 0 changePtr	
	jr $ra 
	
dollar:
	li $v0, 0
	j changePtr 
comma:
	li $v0, 0
	jr $ra 
increment:	
	li $v0, 1
	jr $ra 


printArray:	
	la $t0, opcodeArray
	addi $t1, $t1, 0
loop2:	
	beq $t1, 3, return1
	sll $t2, $t1, 2
	add $t2, $t0, $t2	
	lw $a0, ($t2)
	li $v0, 4
	syscall	
	addi $t1, $t1, 1
	j loop2	
return1:
	jr $ra


getBinaryString2:
	#for opCodeArray
	la $s0, opcodeArray
	add $s1, $s1, $zero 
	
	#for regArray	
	la $s2, regArray
	add $t6, $t6, $s2
	move $a0, $t6
	
loop3:	
	beq $s1, 2, endLoop2	
	
	sll $t7, $s1, 2 
	add $t7, $s0, $t7 
	move $a1, $t7 	
	addi $s1, $s1, 1   
	jal stringCompare	
 	beqz $v0, found 	 
 	j loop3
 endLoop2:
 	jr $ra
 	
 found:
 	move $a0, $v0
	li $v0, 1
	syscall
 	#move $v0, $s1
 	jr $ra
 	
getBinaryString:
	#for opCodeArray.
	add $t6, $zero, $zero
	add $t7, $zero, $zero
	
	la $s0, opcodeArray	
	add $t7, $t7, $s0
	move $a0, $s0 		
	li $v0, 4
	syscall
	
	#for regArray	
	la $s2, regArray
	add $t6, $t6, $s2	
	la $a0, ($t6)
	li $v0, 4
	syscall

	j returnBString

stringCompare:  
    	add $t0,$zero,$zero  
   	add $t1,$zero,$a0  
  	add $t2,$zero,$a1  

loop4:  
        lb $t3($t1)         
        lb $t4($t2)  
        beqz $t3,verify    
        beqz $t4,miss  
        slt $t5,$t3,$t4    
        bnez $t5,miss  
    	addi $t1,$t1,1     
        addi $t2,$t2,1  
    	j loop4  

miss:   
    	addi $v0,$zero,1  
    	j endMethod  
verify:  
    	bnez $t4,miss  
	add $v0,$zero,$zero   

endMethod:  
    	jr $ra	


	

	
	
