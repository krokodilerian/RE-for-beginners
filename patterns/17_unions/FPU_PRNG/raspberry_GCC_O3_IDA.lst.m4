include(`commons.m4')float_rand
                STMFD   SP!, {R3,LR}
                BL      my_rand
; R0=_EN(`pseudorandom value')_RU(`псевдослучайное значение')
                FLDS    S0, =1.0
; S0=1.0
                BIC     R3, R0, #0xFF000000
                BIC     R3, R3, #0x800000
                ORR     R3, R3, #0x3F800000
; R3=_EN(`pseudorandom value')_RU(`псевдослучайное значение') & 0x007fffff | 0x3f800000
; _EN(`copy from R3 to FPU (register S15).')_RU(`копировать из R3 в FPU (регистр S15).')
; _EN(``it behaves like bitwise copy, no conversion done:'')_RU(``это работает как побитовое копирование, без всякого конвертирования'')
                FMSR    S15, R3
; _EN(`subtract 1.0 and leave result in S0:')_RU(`вычесть 1.0 и оставить результат в S0:')
                FSUBS   S0, S15, S0
                LDMFD   SP!, {R3,PC}

flt_5C          DCFS 1.0

main
                STMFD   SP!, {R4,LR}
                MOV     R0, #0
                BL      time
                BL      my_srand
                MOV     R4, #0x64 ; 'd'

loc_78
                BL      float_rand
; S0=_EN(`pseudorandom value')_RU(`псевдослучайное значение')
                LDR     R0, =aF         ; "%f"
; _EN(`convert float type value into double type value (printf() will need it):')_RU(`сконвертировать значение типа float в значение типа double (это нужно для printf()):')
                FCVTDS  D7, S0
; _EN(`bitwise copy from D7 into R2/R3 pair of registers (for printf()):')_RU(`побитовое копирование из D7 в пару регистров R2/R3 (для printf()):')
                FMRRD   R2, R3, D7
                BL      printf
                SUBS    R4, R4, #1
                BNE     loc_78
                MOV     R0, R4
                LDMFD   SP!, {R4,PC}

aF              DCB "%f",0xA,0
