.*:     file format .*

Disassembly of section .text:

00001000 <_start>:
    1000:	f000 f802 	bl	1008 <__myfunc_veneer>
    1004:	e7fe      	b.n	1004 <_start\+0x4>
	\.\.\.

00001008 <__myfunc_veneer>:
    1008:	b401      	push	{r0}
    100a:	4802      	ldr	r0, \[pc, #8\]	; \(1014 <__myfunc_veneer\+0xc>\)
    100c:	4684      	mov	ip, r0
    100e:	bc01      	pop	{r0}
    1010:	4760      	bx	ip
    1012:	bf00      	nop
    1014:	061a9019 	.word	0x061a9019
	\.\.\.

00080000 <_stack>:
	\.\.\.

061a9018 <myfunc>:
 61a9018:	4770      	bx	lr
