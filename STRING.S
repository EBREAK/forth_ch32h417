	DEFW MEMCMP, "MEMCMP"
	# ( C-ADDR1 C-ADDR2 COUNT -- N )
	# If count is zero, n is zero.
	# If count is greater than zero, compare the two strings 
	# character by character, up to count characters. If the two 
	# strings are identical up to count characters, n is zero.
	# If the two strings are not identical up to count characters,
	# n is minus-one (-1) if the first non-matching character in
	# the string specified by c-addr1 has a lesser numeric value
	# than the corresponding character in the string specified by
	# c-addr2 and one (1) otherwise
	# Unlike COMPARE, MEMCMP does not operate on strings of
	# differing lengths; count specifies the exact number of
	# characters to be compared, and no length comparison is
	# performed if the two strings are identical up to count
	# characters.
	mv x14, x15
	lw x13, 0(x9)
	lw x12, 4(x9)
	addi x9, x9, 8
	bnez x14, 1f
	li x15, 0
	ret
1:
	lbu x10, 0(x12)
	lbu x11, 0(x13)
	sub x15, x10, x11
	beqz x15, 2f
	bltz x15, 3f
	li x15, 1
	ret
3:
	li x15, -1
	ret
2:
	addi x12, x12, 1
	addi x13, x13, 1
	addi x14, x14, -1
	bnez x14, 1b
	ret
	ENDW MEMCMP
