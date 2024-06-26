# vind credits bally mpu35 en zet freeplay
## start debugger
Als test gebruiken we de harlem globetrotters roms. Standaard staan de dipswitches in vpinmame zo  dat de credits niet te zien zijn. De handleiding geeft aan dat dipswitch 27 aan moet staan om de credits te tonen. Als vpinmame met debugger op de voorgrond staat kun je met “G \[return\]” naar GO mode en vanuit GO mode met ‘\`’ \(backtick onder escape\) naar de debugger. Kijk uit voor de escape key, daarmee verlaat je vpinmame.

\( in GO mode: TAB → DIP SWITCHES → set 27 on → return → reset \)

DEBUG \[\`\]: 

De eerste ram monitor wijst naar U7 op adres \$0.

Zet het tweede ram monitor display naar \$200 waar de U8 RAM zit. 

```{image} ../images/credits1.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
```

````{div} block
````


Je ziet dan iets soortgelijks:
```{image} ../images/credits2.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: left
```


Het scherm bestaat uit 5 delen:
* disassembly(links)
* CPU state en registers (rechts boven)
* RAM1 (rechts midden)
* RAM2 (rechts onder)
* command prompt (helemaal onder)

De help is via F1 bereikbaar.

De delen die net gewijzigd zijn zijn lichtblauw. 
````{div} block
````
Als we in GO mode een credit toevoegen en gelijk daarna naar debug mode gaan zien we een soortgelijk scherm:

```{image} ../images/credits3.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
```

Ga je weer naar GO mode en drukken weer een credit bij geeft de debug mode het volgende scherm:
0x239 en 0x2b1 zijn hele goede kandidaten. Als je nu met [TAB] naar RAM2 gaan kun je het geheugen aanpassen.

```{image} ../images/credits4.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
```

Als je 0x239 bijvoorbeeld 9F maakt zie je in GO mode dat je 9 credits hebt. Start je dan een spel met [1] dan zie je dat ze weer naar 4F zijn gegaan.

Als je dit experiment herhaalt met 0x2b1 dan zullen je zien dat het blijvend is. 0x2b1 bevat de credits. Als we meer dan 9 credits hebben zul je zien dat het hoge deel van de credits in 0x2b2 staat.

Nu konden we het optisch vinden. Met meer geheugen is het gemakkelijker om iedere keer dat je een bepaalde stand hebt het geheugen op te slaan in een bin bestand en dan de bestanden vergelijken.
Nu moeten we nog vinden waar de credits beschreven worden. Typisch is dat bij het inwerpen van een munt of bij het starten van een spel.

Goed gebruik is om voor ieder volledig experiment de emulator even te resetten zodat het resultaat gemakkelijker te vergelijken is. Dit doe je met [F3]. Wacht tot de emulator volledig gestart is en ga naar debug mode [`]. In de command mode type je:”WP 2B1 W[return]” en “G[return]”. Je hebt nu een watchpoint gemaakt die naar adres 2b1 kijkt en de debugger activeert bij een schrijfactie.

Zodra je met [1] een spel start komt de debugger weer naar voren op het adres NA de schrijfactie. Met [pijl omhoog] kun je het vorige comando zien. Omdat het instructiescherm niet weet wat de start van het commando was kan het soms wat rare instructies geven die weer veranderen met een  [pijl omhoog]. Doe dat dus een paar keer.
````{div} block
````

```{image} ../images/credits5.png
:alt: memory-map
:class: bg-primary mb-1
:width: 600px
```


STA (X+\$5) lijkt niet op iets met 0x2b1. Maar aangezien X hier 0x2AC is en er +$5 staat klopt het wel. Toch is dit niet de plek voor de aanpassing. Dit lijkt te globaal. We moeten dus gaan kijken waar deze functie aangeroepen is. met [F8] volgen we de DEX en de RTS. Ga nu weer met pijltjes omhoog tot de listing verspringt tot leesbare code.

```{image} ../images/credits6.png
:alt: memory-map
:class: bg-primary mb-1
:width: 200px
:align: left
```

LDX #\$2B1 ziet er goed uit. Als we de BSR van \$5f4a eens vervangen door twee nops? Dat kun je doen door in debug “D 1 5F4A[return]” te typen en dan met [TAB] naar het voormalige RAM1 scherm te gaan en “01 01” te typen. Ga nu weer terug naar GO mode en kijk of het gewerkt heeft.

````{div} block
````
```{image} ../images/credits7.png
:alt: memory-map
:class: bg-primary mb-1
:width: 200px
:align: left
```
Reset de emulator met [F3]. Er lijkt niets meer te gebeuren.  Als we kijken zit de emulator in  een lus. 

## Checksum
```{image} ../images/checksum1.png
:alt: memory-map
:class: bg-primary mb-1
:width: 200px
:align: left
```
Dit is de checksum test die aan het begin uitgevoerd wordt.

Een stukje voor de lus zien we een check of adres \$516E de waarde \$5A5A heeft. Indien dat waar is springt het over de loop heen. We kunnen de BEQ vervangen door een BRA, of 5A5A in dat adres zetten. Omdat het buiten onze rom valt vervangen we de BEQ(27) door BRA(20) op adres 58F0.

Type in de debugger “D 1 58F0” en tab naar dat scherm. Pas de waarde 27 aan in 20. Pas na [return] op de command prompt zal de instructie verspringen.

```{image} ../images/checksum2.png
:alt: memory-map
:class: bg-primary mb-1
:width: 300px
:align: left
```
```{image} ../images/checksum3.png
:alt: memory-map
:class: bg-primary mb-1
:width: 300px
:align: right
```

````{div} block
````


Wis de watchpoints met WC en ga weer terug naar GO mode [G]. Na de reset met [F3] kun je spellen starten zonder extra credits toe te voegen.

Het is niet verstandig om de checksum uit te zetten omdat de kast bij slechte roms solenoids kan inschakelen. Beter is het natuurlijk om te zorgen dat de checksum klopt. 

## Checksum reparatie

Zet de BEQ (27) weer terug op adres 58f0 zodat de checksum test weer werkt.
Met “save U6 5800 5fff” kunnen we de aangepaste U6 rom opslaan.
Om de checksum locaties te vinden en de code beter te doorgronden moet je disassembleren of decompileren. 
````{div} block
````
```{image} ../images/checksum4.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: left
```
In de snippet hiernaast zie je op 5800 en 5ff7 codes staan die niet te disassembleren zijn.
De aanname is dat deze twee addressen dan ook de checksum alignment bytes zijn.


```{image} ../images/checksum5.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: left
```


````{div} block
````
```{image} ../images/checksum6.png
:alt: memory-map
:class: bg-primary mb-1
:width: 600px
```

De checksum tool start vanaf 0 per rom. 
In dit geval moeten we er dus 5800 afhalen.
We houden dus voor alignment adressen 0 en 0x7f7 over.

Met een checksum tooltje zien we dus dat alignment 0 OK is en 7f7 eigenlijk b7 zou moeten zijn.
Pas de checksum(alignment) aan. Dat kun je doen door in debug “D 1 5FF7[return]” te typen en dan met [TAB] naar het voormalige RAM1 scherm te gaan en “b7” te typen. 

Met “save U6B 5800 5fff” kunnen we de aangepaste U6 rom met juiste checksum opslaan. Je kunt de checksum tool nog een keer op U6B gebruiken om te kijken of het klopt.
Ga in de emulator weer terug naar GO mode en kijk of het gewerkt heeft. Reset de emulator met [F3]. Als alles goed is start het spel weer gewoon en behouden we onze credits bij het starten van een nieuw spel.

Als we de U6B in een eprom zouden branden zou het dus ook in de echte kast moeten werken.
