# Project aanmaken
Start Ghidra en kies voor file → new project.
Kies non-shared.
```{image} ../images/project1.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```

Kies voor de drie puntjes bij project directory. Ga naar d:\pinball en maak de directory “workshop2a” aan.
Kies voor project name ook voor “workshop2a”.

````{div} block
````
```{image} ../images/project2.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```
Kies voor file→import file
Kies voor de U6 rom. 

Klik op de drie puntjes achter language om de juiste processor te kiezen.

````{div} block
````
```{image} ../images/project3.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```
Door in het filter 6800 te typen wordt de lijst overzichtelijker. Kies voor MC6800.


````{div} block
````
```{image} ../images/project4.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```

Na deze keuze is de options knop klikbaar geworden. Klik hier op.
Pas de naam en het start adres aan.

````{div} block
````
Je krijgt nu een overzichtsscherm:

```{image} ../images/project5.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```



````{div} block
````
```{image} ../images/project6.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```

Na OK(s) kom je terug in het project scherm:


Klik op de draak of dubbelklik op de rom regel.
Antwoord de analyze vraag met “Nee/No”

Als eerste slaan we deze lege versie even op als een andere naam. File save ‘720…..’as .
De .1 extensie is goed, klik op save.


````{div} block
````
```{image} ../images/project7.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```
Ga in de listing naar 5ffe  [g 5ffe→ok], 
dit is de reset vector.

Het ziet er niet uit als een vector.

````{div} block
````
```{image} ../images/project8.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```
We moeten er eerst een pointer van maken [p] of [rechtermuis→data→pointer].

````{div} block
````
```{image} ../images/project9.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```


````{div} block
````
```{image} ../images/project10.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```



````{div} block
````
```{image} ../images/project11.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```
Omdat we weten wat deze regel betekend kunnen we hem labelen. 
Klik op het adres aan het begin van de regel.
Druk op [l] en vul de dialoog in:

Klik op OK


````{div} block
````
```{image} ../images/project12.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```
Dubbelklik nu op DAT_58df.
Druk weer op [l] om een label te maken: 


````{div} block
````
```{image} ../images/project13.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```

Klik nu op de 58df en druk op [d] van disassembly. Nu zie je de balk die hiervoor rood was met paarse blokken gevuld worden.

````{div} block
````
```{image} ../images/project14.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```

DAT_0091 is nog rood omdat Ghidra niet weet wat hier hoort, DAT_516e is rood omdat het in een andere rom zit.
````{div} block
````
```{image} ../images/project15.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```

Ga naar file→add to program en kies de ROM van U1.





````{div} block
````
```{image} ../images/project16.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```

Klik op options en vul het in:



````{div} block
````
```{image} ../images/project17.png
:alt: memory-map
:class: bg-primary mb-1
:width: 400px
:align: right
```

Doe hetzelfde voor ROM U2: 










Na het toevoegen is DAT_516e niet langer rood.

Doe weer een save as, nu met .2