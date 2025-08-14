	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=SRC
	LDR R1,[R0]
	MOV R10,#3
	MOV R4,#0
	MOV R2,#1
	MOV R5,#0x0A
UP
	AND R3,R1,#0x0F
	MLA R4,R2,R3,R4
	LSR R1,#4
	MUL R2,R5,R2
	SUBS R10,#1
	BNE UP
STOP
	B STOP
	
SRC DCD 0x45

	
	AREA mydata, DATA, READWRITE
DST DCD 0

	END
	
	
	