	.data
file: .asciiz "test.asm"      # filename for input
buffer: .space 1000	     # arbitrary since input file size is unknowable

	.text
import:
	#open a file for writing
	li   $v0, 13       # system call for open file
	la   $a0, file     # board file name
	li   $a1, 0        # Open for reading
	li   $a2, 0
	syscall            # open a file (file descriptor returned in $v0)
	move $s6, $v0      # save the file descriptor

	#read from file
	li   $v0, 14       # system call for read from file
	move $a0, $s6      # file descriptor
	la   $a1, buffer   # address of buffer to which to read
	li   $a2, 1000   # hardcoded buffer length
	syscall            # read from file


	# Close the file
	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file


