---
jupytext:
    formats: md:myst
    text_representation:
        extension: .md
        format_name: myst
kernelspec:
    display_name: Python 3 (ipykernel)
    language: python
    name: python3
---

# know your NMI / memory map

Voordat we kunnen uitzoeken waar bijvoorbeeld de credits verwerkt worden moeten we eerst weten  hoe de flipperkast werkt. Heel kort door de bocht leest de processor geheugen uit en voert uit wat hij daar tegen komt. Hardware zoals ram, rom en pia hebben eigen adressen waarmee je kunt communiceren. 
Na een reset begint de MC6800 processor altijd met het lezen van het start adres uit adres \$FFFE. 

Memory mapping van bijvoorbeeld de PIA
```{code-cell} 
:tags: [remove-cell]
#, remove-output
%matplotlib inline
%config InlineBackend.figure_format = 'svg'
#ipython3

import schemdraw
import schemdraw.elements as elm
from myst_nb import glue
import schemdraw.logic as logic

from schemdraw.parsing import logicparse 

U10='A3 and A7 and  ( not A9 and not A12 ) '
drawing = logicparse(U10, outlabel='${U10Active}$')
drawing.draw()
drawing.save('logic.svg')

```

```{image} ../chapters1/logic.svg
:alt: logic
:class: bg-primary mb-1
:width: 200px
:align: left
```

 A12 | A9 |A7|A3 | active
---|---|---|---|---
 0 | 0 | 0|0|0
 0 | 0 | 0|1|0
 0 | 0 | 1|0|0
 *0* | *0* | *1*|*1*|*1*
 0 | 1 | 0|0|0
 0 | 1 | 0|1|0
 0 | 1 | 1|0|0
 0 | 1 | 1|1|0
 1 | 0 | 0|0|0
 1 | 0 | 0|1|0
 1 | 0 | 1|0|0
 1 | 0 | 1|1|0
 1 | 1 | 0|0|0
 1 | 1 | 0|1|0
 1 | 1 | 1|0|0
 1 | 1 | 1|1|0
 

Handmatig mappen kan best veel werk zijn. 
```{image} ../images/mmap.png
:alt: memory-map
:class: bg-primary mb-1
:width: 200px
:align: left
```
Je zoekt in het schema naar de CS0/CS1/CS2 signalen op de U10 6821 en zoekt welke adreslijnen  erbij horen.
CS2 heeft ook nog een streepje waardoor het een geinverteerd signaal is. De 6821 voelt zich aangesproken als CS0=1,CS1=1 en CS2=0.
Als voorbeeld CS0=A3, CS1=A7 CS2=?? Iets met A9 en A12. 
A9 en A12 lopen door wat inverterende poortjes. Uiteindelijk hebben we op CS2 een 0 als A9 en A12 beiden 0 zijn.

Met de vraagtekentjes doet U10 niets, X zit aan de index vast.

```
15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00
?? ?? ??  0  ?  ?  0  ?  1  ?  ?  ?  1  ?  X  X
 0  0  0  0 |0  0  0  0 |1  0  0  0 |1  0  0  0
      0           0           8           8  
```
$0088 is dus het basis adres van U10 6821. 
Gelukkig zijn de meeste maps al een keer gemaakt en staan ze ook in pinmame.

```	
<rom name="750-07_1.716" size="2048" crc="da594719" sha1="0aaa50e7d62da64f88d82b00cf0747945be88818" region="cpu1" offset="1000"/>
<rom name="750-08_2.716" size="2048" crc="3c783931" 	sha1="ee260511063aff1b72e18b3bc5a5be81aecf10c9" region="cpu1" offset="5000"/>
<rom name="720-35_6.716" size="2048" crc="78d6d289" 	sha1="47c3005790119294309f12ea68b7e573f360b9ef" region="cpu1" offset="5800"/>
```
Hieruit volgt de volgende memory map:
| adres | chip |
|-------|------|
| $0000-007F | U7 6810 RAM |
| $0088-008B | U10 6821 PIA |
| $0090-0093 | U11 6821 PIA | 
| $0200-02FF | U8 5101 RAM |
| $1000-17FF | U1 ROM |
| $5000-57FF | U2 ROM |
| $5800-5FFF | U6 ROM |

De 5101 heeft nog de rare eigenschap dat alleen de hoge datalijnen aangesloten zitten. De lage geven altijd 1 terug.

Omdat we op zoek zijn naar credits en de credits na uit en aanzetten nog beschikbaar zijn verwachten we die gegevens in de nvram van \$200 tot \$2ff.

De processor start van \$FFFE maar U6 gaat maar tot \$5FFF. Omdat U6 niet kijkt naar alle lijnen reageert hij ook op \$F800-\$FFFF. Eigenlijk start de MPU dus van \$xFFE.