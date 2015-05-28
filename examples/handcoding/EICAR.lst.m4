include(`commons.m4'); _EN(`initial conditions')_RU(`изначальное состояние'): SP=0FFFEh, SS:[SP]=0
0100 58            pop     ax
; AX=0, SP=0
0101 35 4F 21      xor     ax, 214Fh       
; AX = 214Fh and SP = 0
0104 50            push    ax              
; AX = 214Fh, SP = FFFEh and SS:[FFFE] = 214Fh
0105 25 40 41      and     ax, 4140h       
; AX = 140h, SP = FFFEh and SS:[FFFE] = 214Fh
0108 50            push    ax              
; AX = 140h, SP = FFFCh, SS:[FFFC] = 140h and SS:[FFFE] = 214Fh
0109 5B            pop     bx              
; AX = 140h, BX = 140h, SP = FFFEh and SS:[FFFE] = 214Fh
010A 34 5C         xor     al, 5Ch         
; AX = 11Ch, BX = 140h, SP = FFFEh and SS:[FFFE] = 214Fh
010C 50            push    ax
010D 5A            pop     dx              
; AX = 11Ch, BX = 140h, DX = 11Ch, SP = FFFEh and SS:[FFFE] = 214Fh
010E 58            pop     ax              
; AX = 214Fh, BX = 140h, DX = 11Ch and SP = 0
010F 35 34 28      xor     ax, 2834h       
; AX = 97Bh, BX = 140h, DX = 11Ch and SP = 0
0112 50            push    ax
0113 5E            pop     si              
; AX = 97Bh, BX = 140h, DX = 11Ch, SI = 97Bh and SP = 0
0114 29 37         sub     [bx], si
0116 43            inc     bx
0117 43            inc     bx
0118 29 37         sub     [bx], si
011A 7D 24         jge     short near ptr word_10140
011C 45 49 43 ...  db 'EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$'
0140 48 2B   word_10140  dw 2B48h  ; CD 21 (INT 21) _EN(`will be here')_RU(`будет здесь')
0142 48 2A               dw 2A48h  ; CD 20 (INT 20) _EN(`will be here')_RU(`будет здесь')
0144 0D                  db  0Dh
0145 0A                  db  0Ah
