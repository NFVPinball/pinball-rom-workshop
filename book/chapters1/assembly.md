# Assembly
Omdat de 6800 een redelijk eenvoudige processor is kan er geen gebruik gemaakt worden van hogere programmeertalen zoals C of python. Vanaf de 6809 is wel wat C mogelijk maar dan nog geeft het meestal teveel overhead .

Assembly op de 6800 is redelijk eenvoudig van opzet. weinig registers, A,B,X,SP en het status register.

Veel operaties kunnen alleen op register A en status komt in het status register. Je zou je programma met een hex editor kunnen schrijven maar handiger is het om je programma automatisch te laten vertalen. Dit gebeurd door de assembler. Een groot voordeel van de assembler is ook de mogelijkheid om macros en labels te gebruiken.
Een programma bestaat uit de volgende structuur:
```
[label:] [instructie] [parameter(s)] [;commentaar]
```
Voorbeeld:
```
START: 	LDAA	#4	;A=4
	LDAB	#2	;B=2
	ABA		;A=A+B
	STAA	$0	; sla A op in adres 0
.LOOP	DECA		; A=A-1
	BNE	.LOOP	; als A!=0 dan ga naar .LOOP
	JMP	START	; ga naar START
```

Het gaat te ver om een hele cursus 6800 assembly te geven maar met een beetje programmeer ervaring kun je bekende programmeerzaken vertalen naar assembly.
Wat opvalt is dat iets als "if A>0" niet bestaat. Je doet iets met A waarna je naar het status register moet kijken naar de eigenschap van je actie. Bijvoorbeeld LDAA,DECA en TSTA  passen gelijk het status register aan. Daarna kun je met BEQ testen of het nul was. BNE in het voorbeeld hierboven test of het “niet nul” was.
In de 6800 programmers guide en de instruction set summary kun je zien of een instructie het status register gebruikt of aanpast.
(http://www.8bit-era.cz/6800.html) is een handige online referentie voor de instructies.