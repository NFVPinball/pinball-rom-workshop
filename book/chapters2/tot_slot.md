# Tot slot

Dit is wederom een hele korte introductie tot reverse engineering van roms.

Voorgestelde wijziging welke ook bij 0 credits moet werken:

```{image} ../images/tot_slot2.png
:alt: memory-map
:class: bg-primary mb-1
:width: 600px
```
````{div} block
````
Een onderzoekstactiek kan zijn:
* hardware vectors
  * reset
    * hardware initialisatie
    * checksum
  * irq(s)
    * switches
      * hoe werkt de driver
      * switchtable
      * switchstore
      * functies welke de switchstore gebruiken
    * lamps
      * hoe werkt de driver
      * lamp store
      * functies welke de lampstore gebruiken
* strings
  * referenties en functies
                  

Op deze manier kun je in principe iedere ROM te lijf. Al is een WPC ingewikkelder dan een classic bally. Begin bij classic bally, dan naar system11 en dan pas naar WPC. Nieuwere kasten op basis van Linux kunnen beter onderzocht worden via een filesystemdump omdat je anders alle OS onderdelen langs moet voordat je bij daadwerkelijke pinball code komt.

Oudere 8 bit processoren hebben weinig mogelijkheden en zijn dus ideaal om mee te starten.