# mips-assembler
## This is an assembler for the MIPS architecture running on the MARS emulator
* Basically, the assembler is supposed to convert MIPS assembly code into binary machine code
* To run, just assemble the files and run main.asm
* The file being assembled should be named test.asm
### Limitations
All the files individually work to parse R type instructions, however at this time, integration of all the parts wasn't possible. Once integrated, the binary file will have each instruction on a separate line. The size of each line should be under 128 bytes and there needs to be an empty line at the end, which also complies with POSIX guidelines.
