# CryptID – Platformfüggetlen Identity-based Encryption megoldás

## Debreceni Egyetem, Informatikai Kar, Számítógéptudományi Tanszék

Szerzők: Bagossy Attila, Vécsi Ádám

Témavezető: Dr. Pethő Attila

## Absztrakt

A nyilvános kulcsú kriptográfia egy fiatal ága az Identity-based Encryption (IBE), melynek ötletét Adi Shamir fogalmazta meg 1984-ben, míg első, a gyakorlatban is használható leírását Dan Boneh és Matthew Franklin adta 2001-ben. Az IBE lényege, hogy a publikus kulcs egy olyan karakterlánc, mely egy adott domainen belül egyértelmű azonosítóként szolgál. Erre egyszerű példa egy email cím vagy egy felhasználónév.

Az internetre csatlakozó mobil eszközök robbanásszerű elterjedése igényt ébresztett hatékony és hordozható kriptográfiai rutinok iránt. Ugyanakkor az Identity-based Encryption jelenleg nem rendelkezik szabadon hozzáférhető, platformfüggetlen megvalósítással. Ez adta a motivációt a dolgozatban bemutatott programkönyvtár elkészítéséhez. A CryptID nevet viselő szoftvercsomag a Boneh-Franklin IBE egy nyílt forrású, kifejezetten a web igényeire szabott implementációja. Újszerűsége két irányból is megközelíthető: A megvalósításban rejlő újdonság, hogy technológiai alapját a WebAssembly biztosítja, aminek köszönhetően nemcsak a szerveroldalon, hanem a kliensoldalon, vagy akár a webtől teljesen elszakadva nyújt platformfüggetlen és hatékony titkosítási megoldást. Az implementáción túlmutató újdonság az IBE publikus kulcsában keresendő. A dolgozatban bemutatott könyvtár strukturált publikus kulcsokra épül, melyekben az egyedi azonosítón felül tetszőleges metaadat elhelyezhető.

A dolgozatunkban a programkönyvtár ismertetését követően részletesen elemezzük annak teljesítményét. A teljesítménymérések alapját asztali számítógépen és mobil eszközön, különböző beágyazó környezetekben gyűjtött adatok képzik, ahol lehetséges, más, hasonló implementációk összevetésével.

Zárásként két lehetséges alkalmazást is bemutatunk, melyek a könyvtár újdonságaira fókuszálnak: a CryptID.email nevű webalkalmazás egy platformfüggetlen fájltitkosítási megoldást jelent, míg a Személyre szabott zárthelyi egy esettanulmány, mely a publikus kulcsba helyezhető metaadatok egy felhasználási lehetőségére világít rá.

## Build

A dolgozat PDF-be való buildeléséhez Windowson felhasználható a `make.bat` állomány. A buildhez a `latexmk` és a `pdflatex` programok szükségesek.
