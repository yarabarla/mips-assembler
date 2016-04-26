# Plays Westminster Quartets :)
play:
	li $v0, 33 	# syscall to output a MIDI sound synchronously
	li $a3, 100	# volume (0-127)
	
	li $a0, 64	# pitch = E
	li $a1, 700	# duration in ms
	li $a2, 0	# piano
	syscall
 
 	li $a0, 68	# pitch = G#
	li $a1, 700	# duration in ms
	li $a2, 0	# piano
	syscall
	
	li $a0, 66	# pitch = F#
	li $a1, 700	# duration in ms
	li $a2, 0	# piano
	syscall
	
	li $a0, 59	# pitch = B
	li $a1, 1400	# duration in ms
	li $a2, 0	# piano
	syscall
	
	li $a0, 64	# pitch = E
	li $a1, 700	# duration in ms
	li $a2, 0	# piano
	syscall
	
	li $a0, 66	# pitch = F#
	li $a1, 700	# duration in ms
	li $a2, 0	# piano
	syscall
	
 	li $a0, 68	# pitch = G#
	li $a1, 700	# duration in ms
	li $a2, 0	# piano
	syscall
	
	li $a0, 64	# pitch = E
	li $a1, 700	# duration in ms
	li $a2, 0	# piano
	syscall