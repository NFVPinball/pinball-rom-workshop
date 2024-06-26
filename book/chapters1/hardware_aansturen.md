# hardware aansturen

## led circuit

```{figure} ../images/u11_led.png
---
class: bg-primary mb-1
width: 300px
align: left
---
diagnostic led circuit
```

Als voorbeeld het aansturen van de diagnostics led. Vanaf de led kun je twee kanten op, naar een weerstand en naar een transistor. De weerstand R29 zit aan de voeding vast en daar kunnen we dus niet veel mee. De transistor Q2 zit als schakelaar in het schema. Aan de basis hangt weerstand R28 welke weer aan een pullup hangt en aan PIA U11 CA2.
Om de led aan te sturen moeten we dus U11-CA2 als uitgang zetten en deze uitgang hoog of laag te maken.

````{div} block
````

## 6821 PIA datasheet




```{figure} ../images/pia_reg.png
---
class: bg-primary mb-1
width: 400px
align: left
---
6821 register page
```

In de datasheet van de 6821 staat hoe we CA2 aan kunnen sturen. Bit5 ,bit4 en bit3 van het control register CRA bepalen dus het gedrag van CA2.
Het start adres van U11 is 0x90. De datasheet geeft ook aan hoe de registers via RS0/RS1 te bereiken zijn. Gelukkig zitten RS0 en RS1 aan A0 en A1 waardoor het gewoon oploopt.
```
0x90 DDRA/PDRA
0x91 CRA
0x92 DDRB/PDRB
0x93 CRB
```
Om CA2 laag te maken moeten we dus xx110xxx in CRA zetten waarbij de x geen invloed heeft. In het ideale geval lees je het register en pas je alleen die bits aan waarna je het weer terugzet.
Om CA2 hoog te maken moeten we xx111xxx in CRA zetten.
```
00110000 = 0x30
00111000 = 0x38
Laag:	LDAA #$30
	STAA $91
hoog:	LDAA #$38
	STAA $91
```

