/*
	Code By: Javier Castro Rodríguez
	01/06/2018


*/


.include "inter.inc"
.text
        ldr   r0, =GPBASE
/* guia bits            xx999888777666555444333222111000*/
        mov   r1, #0b00001000000000000000000000000000
        str   r1, [r0, #GPFSEL0]  @ Configure GPIO9 as out & GPIO2 and GPIO3 as in
/* guia bits            xx999888777666555444333222111000*/
        mov   r1, #0b00000000000000000000000000000001
        str   r1, [r0, #GPFSEL1]
	mov   r2, #0b00000000000000000000000000000100
	mov   r4, #0b00000000000000000000000000001000
/* guia bits            10987654321098765432109876543210*/
        mov   r1, #0b00000000000000000000011000000000
        str   r1, [r0, #GPSET0]
bucle:
	ldr   r3, [r0, #GPLEV0]
	tst   r3, r2
	bne   bucle2
/* guia bits            10987654321098765432109876543210*/
        mov   r1, #0b00000000000000000000010000000000
        str   r1, [r0, #GPCLR0]   @ Turn off GPIO10
infi:	b     infi
bucle2:
	tst   r3, r4
	beq tol10
	bne   bucle
tol10:
/* guia bits            10987654321098765432109876543210*/
        mov   r1, #0b00000000000000000000001000000000
        str   r1, [r0, #GPCLR0]   @ Turn off GPIO9