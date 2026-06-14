	.INCLUDE "DEFS.S"
	.INCLUDE "MACRO.S"
	.INCLUDE "EARLY_V3F.S"
	.INCLUDE "BOOT_V3F.S"

	.PUSHSECTION .forth.dict
_forth_dict_rom_start:
	.POPSECTION

	.INCLUDE "CORE.S"

	.PUSHSECTION .forth.dict
	.2BYTE 0X0000
_forth_dict_rom_end:
	.POPSECTION



	.PUSHSECTION .text
forth:

	
	
1:
	li x1, 0x3F
	j 1b
	.POPSECTION
