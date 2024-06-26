# Inleiding

```{admonition} Waarschuwing
:class: warning
Als je dit met een echte kast doet moet je bijzonder opletten dat er niets verbrandt. Het is verstandig om eerst in de emulator te testen, dan in een kast waar de solenoids niet aangesloten zijn en dan pas een volledige test te doen. Laat ook nooit een kast met je custom rom werken zonder dat je erbij bent én in de mogelijkheid bent om de kast af te schakelen.
```


## Case: Harlem Globetrotters voorzien van oneindige credits.

### Voorkennis
* hexadecimale getallen
* binaire getallen
* basis digitale electronica (0/1, hoog/laag)
* schema lezen

### benodigdheden
* schematics, MPU
* datasheets, MC6800, MC6821
* pinmame (debug)
* hxd
* ghidra (met 6800)
* game roms
* (python3?)

### stappenplan
* ghidra builden
* java/ghidra installeren
* project maken
* memory map
* disassembleren
* zoeken naar credits

## Gebruikte links:
* (https://www.pinitech.com/switch_database.php?name=Bally_Harlem_Globetrotters)
* (https://www.ipdb.org/files/1125/Bally_1979_Harlem_Globetrotters_On_Tour_Manual.pdf)
* (https://www.vpforums.org/index.php?showtopic=42220&page=1)
* (http://www.pinball4you.ch/okaegi/pro_soft.html)
* (https://www.geoffreybrown.com/blog/a-hexdump-program-in-python/)
* (http://www.8bit-era.cz/6800.html)
* (https://github.com/gnulnulf/pinball-testrom)
* (https://github.com/gnulnulf/ghidra-pinball)
* https://github.com/sigurasg/ghidra_scripts
* https://github.com/gnulnulf/ghidra