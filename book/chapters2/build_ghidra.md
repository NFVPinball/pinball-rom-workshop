# Ghidra installeren
Er zijn twee opties om ghidra te installeren:
* zip uitpakken
* zelf bouwen

## Ghidra van zip installeren
pak de ghidra.zip uit in bijvoorbeeld d:\pinball\ghidra

In Windows kun je de ghidraRun.bat gebruiken om ghidra te starten.

Indien je geen java 11 hebt kun je de jdk uit hoofdstuk 1 gebruiken.

## Ghidra builden 
Ghidra is een reverse engineering tool van de NSA en maakt het disassembleren en reference mapping een stuk eenvoudiger.
Zelf builden is nodig omdat 6800 en 6809 support nog niet in de standaard Ghidra versie zit.

In de huidige workshop staat alles in d:\Pinball, je kunt dit natuurlijk aanpassen.

### Java11
Als je nog geen java jdk11 hebt of je bestaande versie met rust wilt laten kun je een andere versie gebruiken. Ikzelf gebruik openjdk van https://adoptium.net/temurin/releases/?version=11 in d:\Pinball\jdk11 .
```bash
SET JAVA_HOME=d:\pinball\jdk11
```

### Gradle
Download gradle van https://gradle.org/releases/ en installeer deze in d:\pinball\gradle .

### Ghidra bouwen
```bash
Ghidra
d:\
cd d:\Pinball
mkdir git
cd git
git clone https://github.com/gnulnulf/ghidra.git --branch 6809  (branch nfv?)
cd ghidra
d:\Pinball\gradle\bin\gradle -I gradle\support\fetchDependencies.gradle init
d:\Pinball\gradle\bin\gradle buildGhidra
```

Dit duurt op een klein systeem behoorlijk lang.
Na het succesvol builden moet er in build→dist→zip een zipfile staan.

