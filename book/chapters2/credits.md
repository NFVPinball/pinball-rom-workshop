# Credits


````{div} block
````
```{image} ../images/2credits1.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```
In de vorige workshop hebben we gezien dat de credits op geheugenadres 2b1 staan.
Ga naar search→program text en zoek alle verwijzingen naar 2b1 in de listing.





````{div} block
````
```{image} ../images/2credits2.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```

In de zoekresultaten zelf zien we referenties naar 02b1 zelf, die negeren we. De overigen zijn intererssant.







````{div} block
````
```{image} ../images/2credits3.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```

Volg de JSR naar 5e77 en probeer te begrijpen wat daar aan de hand is.


````{div} block
````
```{image} ../images/2credits4.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```

Drie maal hetzelfde aanroepen en opslaan in DAT_0001 tot en met DAT_0003.




````{div} block
````
```{image} ../images/2credits5.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```

Volg de 5e84.
````{div} block
````
De code kun je vertalen naar pseudo code:
```bash
A=(X)
A>>4
A=<9? Anders A=0
  X=X+1
  B=(X)
  B=<90? Anders B=0
    A=A+B
    return
```
(In de volatile ram worden alleen de hoge 4 bits gebruikt)

````{div} block
````
```{image} ../images/2credits6.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```

Deze functie lijkt dus de BCD waarde te lezen  voor 2 adressen. Laten we de functie een handigere naam geven. Ik vind het persoonlijk handig om het adres in de funtie te laten staan.

Als je het echt goed wilt aanpakken kun je de functie ook voorzien van parameters en return waarden.





````{div} block
````
```{image} ../images/2credits7.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```

50ec, FUN_get_3xBCD2_to_DAT_3_2_1_5e77(0x2b1) een zet DAT_0003 in A. 
Voorlopig hernoem ik de FUN_50ec naar FUN_getCredits_50ec
Hier is ook de referentie interessant, wie roept dit aan?
De credits waarde wordt getest of het niet nul is. De referentie 5122(*)  is een tabel. (switches?)





````{div} block
````
```{image} ../images/2credits8.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```







````{div} block
````
```{image} ../images/2credits9.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```












````{div} block
````
```{image} ../images/2credits10.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```

De labels zijn voor ieder bekend stukje aangemaakt en ieder adres wat bekend is krijgt een label en een datatype. Zo krijg je uiteindelijk een leesbare listing van de code.

