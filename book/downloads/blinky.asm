
	cpu 6800
	; to fill eprom
	org	$5800	;op dit adres willen we onze code starten

; Macros om het wat leesbaarder te krijgen	
DATAA	equ 0
DATAB	equ 2
DDRA	equ 0
DDRB	equ 2
CRA		equ 1
CRB		equ	3

; memory map van de mpu35
;$0000-007F 6810 RAM
;$0088-008B 6821 PIA U10
;$0090-0093 6821 PIA U11
;$0200-02FF 5101 RAM (upper 4 bits only! - ROMs expect lower 4 bits to read high)

PIAU10		equ	$0088
PIAU11		equ	$0090
RAMU7		equ $0000
RAMU7SIZE	equ $80
RAMU8		equ $0200
RAMU8SIZE	equ $100

; PIAU10_CA1 self test switch
; PIAU10_CB1 zero crossing
; PIAU11_CA1 display interrupt
; PIAU11_CB1 J5-32 (pulled down)

; PIAU10_CA2 display enable
; PIAU10_CB2 S25-32 + LAMPSTROBE1
; PIAU11_CA2 diagnostic led + LAMPSTROBE2
; PIAU11_CB2 SOLENOID/SOUNDSELECT

START:		;label start
; CRA
;   7   |   6   |  5 4 3   |   2  | 1 0
; IRQA1 | IRQA2 | CA2 CTRL | DDRA | CA1
ONLYBLINK_DIAG_LED:
BLINKLOOP:
	;CA2/CB2 output and follow (bit4/5 =1) (bit3=data)
	ldaa	#$30			; A=0x30 ( 0boo110ooo )
	STAA	PIAU11 + CRA	; plaats de waarde van A $30 in het CRA van U11

; 512kHz int, 8cycles DELAY= 16ns per loop
; 0.5s / 0.000016 = 31250 times
	LDX		#31250		; X=31250
.DELAY0b:	
	DEX					; X=X-1 (4 cycles) en pas status register aan.
	BNE .DELAY0b		; Niet nul? ga naar .DELAY0b 4 cycles
			
	;CA2/CB2 output and follow (bit4/5 =1) (bit3=data)
	ldaa	#$38		; A=0x38 ( 0boo111ooo )
	STAA	PIAU11 + CRA	; plaats de waarde van A $38 in het CRA van U11
; 512kHz int, 8cycles DELAY= 16ns per loop
; 0.5s / 0.000016 = 31250 times
	LDX		#31250		; X=31250
.DELAY0a:	
	DEX					; X=X-1 (4 cycles) en pas status register aan.
	BNE .DELAY0a		; Niet nul? ga naar .DELAY0b 4 cycles
	BRA BLINKLOOP		; en weer terug naar begin van de loop

NMI:
SWI:
IRQ:
	RTI		; return from interrupt

VECTOR:
; VECTOR table
	org $5FF8	;op dit adres willen we deze tabel starten
; IRQ vector
	dw 	IRQ
; SWI vector
	dw 	SWI
; NMI vector
	dw 	NMI
; reset vector
	dw 	START
