# memory map

````{div} block
````
```{image} ../images/memorymap1.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```
We missen nog steeds allerlei IO adressen zoals ram en PIAs.
window -> memory map -> "+" (add)

\$0000-007F 6810 RAM  (length-80)

\$0088-008B 6821 PIA U10 length=4

\$0090-0093 6821 PIA U11 length=4

\$0200-02FF 5101 NVRAM length=100 (upper 4 bits only! - ROMs expect lower 4 bits to read high)


````{div} block
````


Om het leven wat gemakkelijker te maken kun je met python scripting dit soort acties uit laten voeren. (deze staan in https://github.com/gnulnulf/ghidra-pinball/ )


```{image} ../images/memorymap2.png
:alt: memory-map
:class: bg-primary mb-1
:width: 600px
```

````{div} block
````
```{image} ../images/memorymap3.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```
Na dit script zal al heel wat van de code gedisassembleerd zijn. We kunnen een extra analyze starten met [Analysis → auto analyze ]

Kies dezelfde vinkjes als hiernaast en druk op analyze.


````{div} block
````

Er zijn nu nog een aantal blokken rood en niet gedisassembleerd.
````{div} block
````
```{image} ../images/memorymap4.png
:alt: memory-map
:class: bg-primary mb-1
:width: 600px

```
Klik op de regel met 1000 en druk op [d] van disassembly. Je krijgt een bad instruction bookmark.
Herhaal dit op regel 1001 en je ziet weer veel veranderen. (1000 is waarschijnlijk de checksum alignment)

Vaak zijn "bd/b7/86/8d" populaire start punten voor een disassembly.

Is er maar één instructie? Dan is het vast wat anders, kies [ctrl-z] om het ongedaan te maken.

Veel gebruikte toetsen zijn:
* d (disassemble)
* c (remove disassemble)
* y ( repeat last data )

Sommige blokken herhalen patronen welke allemaal adressen kunnen zijn en in een van de roms eindigen.

Negeer blokken met bijvoorbeeld 41,42,43,44.

15xx15xx16xx etc -> druk[p] en maak pointer


````{div} block
````
```{image} ../images/memorymap5.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```
Als je hier pointers van maakt wordt het snel duidelijk dat het een soort van index is.

Er blijven een aantal blokken over met oplopende nummertjes en ze sluiten allemaal af met FF.
Deze negeren we voorlopig.

Sla het geheel weer op.