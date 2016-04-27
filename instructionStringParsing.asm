.data
string: .ascii "add"
nLine: .asciiz "\n"
opcode: .space 5
reg1: .space 5
reg2: .space 5
reg3: .space 5
regArray: .word opcode, reg1, reg2, reg3
addL: .ascii "add"
subL: .ascii "sub"
opcodeArray: .word addL, subL

.text
parse:
	la $a0, string
	jal getComponents 
	#jal getBinaryString	
	jal printArray
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
	beq $s0, 3, endLoop1
	lb  $a0, ($t0)	
	jal checkASCII
	move $a1, $v0
	jal storeCharOnArray	
        add $t0, $t0, 1 
        add $s0, $s0, 1        
	j loop1		
endLoop1:
	jr $ra
		
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
	j return0
	
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
	j return0
	
dollar:
	li $v0, 0
	j changePtr 
comma:
	li $v0, 0
	j return0 
increment:	
	li $v0, 1
return0:
	jr $ra 


printArray:	
	la $t0, regArray
	addi $t1, $t1, 0
loop2:	
	beq $t1, 3, return1
	sll $t2, $t1, 2
	add $t2, $t0, $t2	
	move $a0, $t2
	li $v0, 4
	syscall	
	addi $t1, $t1, 1
	j loop2	
return1:
	jr $ra


getBinaryString:
	la $s0, opcodeArray
	add $s1, $s1, $zero 	
	la $s2, regArray
	add $t6, $t6, $s2
	
	
loop3:	
	sll $t7, $s1, 2 
	add $t7, $s0, $t7 
	move $a0, $t7
	move $a1, $t6	
	addi $s1, $s1, 1 
	jal methodComp
 	beqz $v0, found 	
 	j loop3
 	jr $ra
 	
 found:
 	move $v0, $s1
 	jr $ra

methodComp:  
    	add $t0,$zero,$zero  
   	add $t1,$zero,$a0  
  	add $t2,$zero,$a1  

loop4:  
        lb $t3($t1)         
        lb $t4($t2)  
        beqz $t3,checkt2    
        beqz $t4,missmatch  
        slt $t5,$t3,$t4    
        bnez $t5,missmatch  
    	addi $t1,$t1,1     
        addi $t2,$t2,1  
    	j loop4  

missmatch:   
    	addi $v0,$zero,1  
    	j endfunction  
checkt2:  
    	bnez $t4,missmatch  
	add $v0,$zero,$zero  

endfunction:  
    	jr $ra	


	

	
	
