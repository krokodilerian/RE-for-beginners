include(`commons.m4').LC2:
	.string	"32.01 ^ 1.54 = %lf\n"
main:
	sub	rsp, 8
	movsd	xmm1, QWORD PTR .LC0[rip]
	movsd	xmm0, QWORD PTR .LC1[rip]
	call	pow
	; _EN(`result is now in')_RU(`результат сейчас в') XMM0
	mov	edi, OFFSET FLAT:.LC2
	mov	eax, 1 ; _numvecreg
	call	printf
	xor	eax, eax
	add	rsp, 8
	ret
.LC0:
	.long	171798692
	.long	1073259479
.LC1:
	.long	2920577761
	.long	1077936455
