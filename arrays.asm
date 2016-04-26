.data
#arrays are parallel 
# I1, T1, P1, F1 are respectively the instruction name, type, opcode, and funct

#instructions
I1: .asciiz "add"
I2: .asciiz "addi"
I3: .asciiz "addiu"
I4: .asciiz "addu"
I5: .asciiz "and"
I6: .asciiz "andi"
I7: .asciiz "beq"
I8: .asciiz "bne"
I9: .asciiz "j"
I10: .asciiz "jal"
I11: .asciiz "jr"
I12: .asciiz "lbu"
I13: .asciiz "lhu"
I14: .asciiz "ll"
I15: .asciiz "lui"
I16: .asciiz "lw"
I17: .asciiz "nor"
I18: .asciiz "or"
I19: .asciiz "ori"
I20: .asciiz "slt"
I21: .asciiz "slti"
I22: .asciiz "sltiu"
I23: .asciiz "sltu"
I24: .asciiz "sll"
I25: .asciiz "srl"
I26: .asciiz "sb"
I27: .asciiz "sc"
I28: .asciiz "sh"
I29: .asciiz "sw"
I30: .asciiz "sub"
I31: .asciiz "subu"

#instruction types
T1: .asciiz "R"
T2: .asciiz "I"
T3: .asciiz "I"
T4: .asciiz "R"
T5: .asciiz "R"
T6: .asciiz "I"
T7: .asciiz "I"
T8: .asciiz "I"
T9: .asciiz "J"
T10: .asciiz "J"
T11: .asciiz "R"
T12: .asciiz "I"
T13: .asciiz "I"
T14: .asciiz "I"
T15: .asciiz "I"
T16: .asciiz "I"
T17: .asciiz "R"
T18: .asciiz "R"
T19: .asciiz "I"
T20: .asciiz "R"
T21: .asciiz "I"
T22: .asciiz "I"
T23: .asciiz "R"
T24: .asciiz "R"
T25: .asciiz "R"
T26: .asciiz "I"
T27: .asciiz "I"
T28: .asciiz "I"
T29: .asciiz "I"
T30: .asciiz "R"
T31: .asciiz "R"

#opcodes
P1: .asciiz  "000000"
P2: .asciiz  "001000"
P3: .asciiz  "001001"
P4: .asciiz  "000000"
P5: .asciiz  "000000"
P6: .asciiz  "001100"
P7: .asciiz  "000100"
P8: .asciiz  "000101"
P9: .asciiz  "000010"
P10: .asciiz "000011"
P11: .asciiz "000000"
P12: .asciiz "100100"
P13: .asciiz "100101"
P14: .asciiz
P15: .asciiz "001111"
P16: .asciiz "100011"
P17: .asciiz "000000"
P18: .asciiz "000000"
P19: .asciiz "001101"
P20: .asciiz "000000"
P21: .asciiz "001010"
P22: .asciiz "001011"
P23: .asciiz "000000"
P24: .asciiz "000000"
P25: .asciiz "000000"
P26: .asciiz "101000"
P27: .asciiz
P28: .asciiz "101001"
P29: .asciiz "101011"
P30: .asciiz "000000"
P31: .asciiz "000000"

#funct (only R-Type has this)
F1: .asciiz "100000"
F2: .asciiz  "DNE"
F3: .asciiz  "DNE"
F4: .asciiz "100001"
F5: .asciiz "100100"
F6: .asciiz  "DNE"
F7: .asciiz  "DNE"
F8: .asciiz  "DNE"
F9: .asciiz  "DNE"
F10: .asciiz "DNE"
F11: .asciiz "001000"
F12: .asciiz "DNE"
F13: .asciiz "DNE"
F14: .asciiz "DNE"
F15: .asciiz "DNE"
F16: .asciiz "DNE"
F17: .asciiz "100111"
F18: .asciiz "100101"
F19: .asciiz "DNE"
F20: .asciiz "101010"
F21: .asciiz "DNE"
F22: .asciiz "DNE"
F23: .asciiz "101011"
F24: .asciiz "000000"
F25: .asciiz "000010"
F26: .asciiz "DNE"
F27: .asciiz "DNE"
F28: .asciiz "DNE"
F29: .asciiz "DNE"
F30: .asciiz "100010"
F31: .asciiz "100011"


InstructionsArray: .word I1, I2, I3, I4, I5, I6, I7, I8, I9, I10
			 I11, I12, I13, I14, I15, I16, I17, I18
			 I19, I20, I21, I22, I23, I24, I25, I26
			 I27, I28, I29, I30, I31

TypesArray: .word T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12			 
		  T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23
		  T24, T25, T26, T27, T28, T29, T30, T31
		  
OpArray: .word	P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12
		P13, P14, P15, P16, P17, P18, P19, P20, P21, P22
		P23, P24, P25, P26, P27, P28, P29, P30, P31

FunctArray: .word F1, F2, F3, F4, F5, F6, F7, F8, F9, F10
		  F11, F12, F13, F14, F15, F16, F17, F18, F19
		  F20, F21, F22, F23, F24, F25, F26, F27, F28, F29
		  F30, F31			 
