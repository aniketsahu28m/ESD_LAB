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
	LDR R3,=DST
	MOV R10,#8
	
UP
	AND R2,R1,#0x0F
	CMP R2,#09
	BCC DOWN
	ADD R2,#7
	
DOWN
	ADD R2,#0x30
	STR R2,[R3],#4
	LSR R1,#4
	SUBS R10,#1
	BNE UP
	
STOP
	B STOP
	
SRC DCD 0x12AB56DF

	
	AREA mydata, DATA, READWRITE
DST DCD 0



	END
	
	