# testrom maken
```{sidebar}
{download}`blinky.asm<../downloads/blinky.asm>`
```
```{image} ../images/testrom_src.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```
In blinky.asm zie je een heel eenvoudig programma wat de led aan U11-CA2 laat knipperen. (complete listing als download)

De assembler welke ik gebruikt heb voor het voorbeeld is:  

http://john.ccac.rwth-aachen.de:8000/as/
````{div} block
````
Assembleer de listing naar 6800 machine code:
```
d:\Pinball\aswcurr\bin\asw.exe -cpu 6800 -A blinky.asm
```
```{image} ../images/testrom_asw.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: left
```
Als er niets fout ging wordt een blinky.p bestand aangemaakt. De flipperkast of emulator kan hier niets mee. We moeten het nog naar een bin of rom-image converteren.


````{div} block
````

Converteer de code naar een rom bestand.
```
d:\Pinball\aswcurr\bin\p2bin.exe blinky.p
```
```{image} ../images/testrom_p2bin.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```
Als we de blinky.bin over de U6 rom zetten zal de emulator hiervan opstarten omdat de resetvector $FFFE in deze rom valt.
```
copy /y blinky.bin d:\Pinball\roms\hglbtrtr\720-35_6.716
```
Start pinmame met onze eigen rom:
```
PinMAME_VC2012vcmd.exe hglbtrtr --rompath d:/Pinball/roms -debug
```
````{div} block
````

```{image} ../images/testrom_debug.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```
Bij het opstarten krijgen we een melding dat er iets mis is met de checksum, dat kunnen we negeren.
Zoals je ziet zijn de labels en de macros  verdwenen.
Jammer genoeg werkt de diagnostics led niet helemaal zoals verwacht binnen de gebruikte vpinmame versie.
Door het gebruik van deze testrom is goed te zien dat de “leesbare” listing van blinky.asm een stuk minder leesbaar is geworden. Bij het onderzoek van een volledige rom hebben we geen listing en moeten we dus door dit soort brei heen worstelen.
