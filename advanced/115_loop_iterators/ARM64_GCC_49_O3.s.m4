include(`commons.m4'); X0=a1
; X1=a2
; X2=cnt
f:
	cbz	x2, .L1            ; cnt==0? _EN(`exit then')_RU(`тогда выйти')
; _EN(`calculate last element of "a1" array')_RU(`вычислить последний элемент массива "a1"')
	add	x2, x2, x2, lsl 1
; X2=X2+X2<<1=X2+X2*2=X2*3
	mov	x3, 0
	lsl	x2, x2, 2
; X2=X2<<2=X2*4=X2*3*4=X2*12
.L3:
	ldr	w4, [x1],28        ; _EN(``load at X1, add 28 to X1 (post-increment)'')_RU(``загружать по адресу в X1, прибавить 28 к X1 (пост-инкремент)'')
	str	w4, [x0,x3]        ; _EN(`store at')_RU(`записать по адресу в') X0+X3=a1+X3
	add	x3, x3, 12         ; _EN(`shift')_RU(`сдвинуть') X3
	cmp	x3, x2             ; _EN(`end')_RU(`конец')?
	bne	.L3
.L1:
	ret
