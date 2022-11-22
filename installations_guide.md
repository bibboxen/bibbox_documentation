# Installationsguide (dansk)
Denne guide indeholder en kort og en længere gennemgang af, hvordan man installerer BibBox som et SelfCheck system (SC). 
Denne løsning benytter [Ubuntu Server 16.04 LTS](https://www.ubuntu.com/download/server). 
Dette er derfor en gennemgang af installationen af Ubuntu Server og derefter et installations script.

Installationen kræver at man har en internet forbindelse, da det meste at det krævede software automatisk downloads fra Internettet. 
Installations-scriptet kommer med et ekstra script til at ændre IP til en static adresse.

Guiden antager at man benytter en USB nølge til at foretage installationen og at denne indholder både Ubuntu Server 
og BibBox installations-script (men det kunne være på forskellige nøgler).

__Hint__: Server-installation bruger _n-curses_ UI, hvor man slår ting fra/til med "__space__", 
skifter område med "__tabulator__" og bekræfter sine valg med "__enter__".

__Hint__: "__tab__" kan også bruges til at auto-complete kommandoer og stier i filesystemet. 
To hurtige tryk på "__tab__" vil komme med foreslag, hvis der er mere end en auto-complete mulighed.

## Preinstall (Intel NUC)
Hvis du ikke kører system på en Intel NUC maskine vil du kunne hoppe denne del af guiden over.

### BIOS opdatering
Det er anbefalet at opdatere BIOS på NUC til den seneste version, hvilket for dette skriv vil sige [PYBSWCEL.86A - 058](https://downloadcenter.intel.com/download/26445/BIOS-Update-PYBSWCEL-86A-). For mere information omkring opdatering læse [Intel's opdatering guide] (http://www.intel.com/content/www/us/en/support/boards-and-kits/000005636.html).


### BIOS/UEFI konfiguration Intel NUC
Intel NUC har problemer med at opstarten af Linux kernen med dennes default konfiguration, hvilket fremstår ved at maskine går i stå under opstarts processen. For at komme videre det skal man lave følgende ændring i selve BIOS konfigurationen.

__Note__: Husk at sætte maskine til at start automatisk ved "__Power failure__" til "__Power on__", hvilet osse gøres i BIOS.

#### Step 1 (Home screen)
Tryk F2 ved _"Intel NUC"_ logo'et under opstart, hvorefter følgende skærmbillede fremkommet. Her skal man vælge "__Advanced__" (fremhævet med rød cirkel) under "_Boot Order_".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/bios1.png" alt="Drawing" style="width: 500px; align: center"/>

-------------------------

#### Step 2 (Boot Order)
Klik på "__Boot Configuration__".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/bios2.png" alt="Drawing" style="width: 500px; align: center"/>


-------------------------

#### Step 3
Vælg "__OS Selection__" dropdown boksen og vælg "_Linux_" i denne.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/bios3.png" alt="Drawing" style="width: 500px; align: center"/>

-------------------------

#### Step 4
Tryk på "__exit__" ikonet og svar "__Yes__" til at gemme ændringeren.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/bios4.png" alt="Drawing" style="width: 500px; align: center"/>

-------------------------

### Boot Linux installation med UEFI

1. Tryk F10 ved "_Intel NUC_" logo'et
2. Vælg "__UEFI : USB : SanDisk Cruzer.....__"


## Kort gennemgang 
1. Vælg punktet "__Try or Install Ubuntu Server__"
2. Vælg sprog "__English__"
3. Vælg "__Continue without updating__" hvis den spørg efter ny installer
4. Vælg "__Danish__" tastatur layout
5. Vælg "__Done__"
6. Vælg "__Ubuntu Sever (minimized)__" 
7. Vælg "__Done__" til netværks setup med DHCP
8. "__Done__" til proxy
9. "__Done__" til mirror og brug det den har fundet
10. Vælg "__Done__" til at bruge hele disken
11. Udfyld bruger profile og maskine navn og vælg "__Done__"
12. Vælg "__Install OpenSSH server__" og vælg "__Done__"
13. Vælg "__Done__"
14. Når installation er færdig vælg "__Reboot now__"
15. Login som __"bibbox"__
16. Kør "__ifconfig__" og notere MAC adresse
17. Indsæt USB nøgle med install scripts - __"sudo mount /dev/sdb1 /media/cdrom"__
18. Kopier scripts og drivers - __"cp -rf /media/cdrom/install /home/bibbox/"__
19. Umount USB - __"sudo umount /media/cdrom"__
20. Lav scriptet executable - __"sudo chmod +x /home/bibbox/install/*.sh"__
21. Kør scriptet - __"cd /home/bibbox/install"__ og __"./install.sh"__
22. Hvis maskinen ikke er på det rigtig netværk vælg __"n"__ til at sætte static IP
23. Vælg wireless netkort og slå dette fra. Normalt starter det med __"wlp"__
24. Hvis den spørger efter password skriv _bibbox_-brugerens adgangskode. Dette kan ske flere gang under installationen,

__Skift til statisk IP__

1. Ctrl __"w"__ for at lukke Chrome (som vil starte igen med det samme)
2. Inden Chrome når at starte __"Højre klik"__
3. Vælg "Terminal"
4. Gå ind i install __"cd /home/bibbox/install"__
5. Køre __"./ip.sh"__
6. Vælg ethernet kort, normalt _"enp"_ (på Intel nuc "enp3s0")
7. Angiv netværksadresser
8. Vælg wireless kort, normalt starter det med _"wlp"_
9. Reboot ved at skrive __"reboot"__ og tryk enter





## Detaljeret gennemgang 

#### Step 1
Efter boot op vil den første skærm vise de installationsmuligheder man har fra USB pen'en. 
Denne skærm kan se forskellig ud alt efter om den er grafisk- eller tekstbaseret. Men lige meget hvad skal man vælge punktet "__Try or Install Ubuntu Server__".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/00.png" alt="Drawing" style="width: 500px; align: center"/>

-------------------------

#### Step 2 (Select a language)
Vælg sprog "__English__". Man kan også vælge danish, da dette ingen betydning har på det endelige system, der er låst ned til kun at køre BibBox SelfCheck (SC) systemet. 
Resten af denne guide antager at valget er engelsk.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/01.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 3
Alt efter hvor ny din Ubuntu 22.04 installations pen er kan dette billlede kommer frem og her vælges bare "__Continue without updating__"

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/02.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 4 (Layout - 1)
Vælg layout som passer til dit tastatur "__Danish__"

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/03.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 5 (Layout - 2)
Du kan vælge at skift "__Variant__", hvis du har et specielt tastatur eller vælg "__Done__"

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/04.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 6 
Vælg "__Ubuntu Sever (minimized)__" som installations type og vælg "__Done__".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/05.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 7 (Automatically detected network)
Installationen vil nu automatisk finde det tilkoblede netværk (DHCP) og oprette forbindelse til Internettet.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/06.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 8 (Configure the network - proxy)
Hvis du ikke er bag proxy vælg "__Done__" eller indsæt http/https proxy url.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/07.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 9 (Configure the network - mirror)
Bliver automatisk detected, så bare vælg "__Done__"

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/08.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 10 (Partition disks - 1)
Til partitionering af disken vælg "__Use entire disk__" for at benytte hele disken.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/09.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 11 (Profile setup)
Opret superburger på systemet. Det er ikke krævet, at denne bruger hedder "bibbox", men det er anbefaldet. 
NB! De efterfølgende scripts skulle tage højde for at andre brugernavne kan bruges. Men dette er ikke testet på nuværende tidspunkt.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/10.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 12 (SSH setup)
Vælg "__Install OpenSSH server__" for at have mulighed for fjernadministration og opdateringer af maskinne senere hen.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/11.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 13 (Featured Server Snaps)
Du skal ikke installer nogle extra features, bare vælg "__Done__".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/12.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 14 (Installation/Install complete!)
Den vil nu starte installation og når den er færdig kan man vælge "__Reboot Now__"

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/13.png" alt="Drawing" style="width: 500px;"/>



-------------------------



## Kørsel af BibBox _install.sh_ script

#### Step 1
Log ind som brugeren "__bibbox__" på systemet.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_01.png" alt="Drawing" style="width: 500px;"/>


-------------------------

#### Step 2
Hvis MAC adressen skal benytte til netværks opsætning f.eks. ISE. Så fåes denne ved at køre "__ifconfig__" (se skræmbilledet herunder hvor MAC adressen har en rød streg under)

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_001.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 3
Indsæt USB nøglen med BibBox installations scriptet og mount denne ind i "__/media/cdrom__". 
USB nøglen vil normalt komme frem som "_sdb1_", men kan hvis der er flere USB nøgler komme som næste bogstav "_sdc1_".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_02.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 4
Kopier installationsfolderen med script og drivers ind i hjemmemappen for "_bibbox_"-brugeren.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_03.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 5
Kør installationsscriptet ved at gå ind i mappen install. 

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_04.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 6
Eksekver filen "_install.sh_" for at påbegynde installations processen af BibBox SC software.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_05.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 7
Første skridt i installations scriptet er om du vil benytte en statisk IP adresse eller forsætte med en dynamisk IP. 
Vi antager her at vi fortsætter med en dynamisk IP (statisk IP kan sættes senere) og vælger derefter at slå WIFI fra på maskinen (normalt start den med "_wlp_").

__Bemærk__: grunden til at man slår WIFI fra, er at det under nogle installationer har automatisk forbundet 
til åbne netværk og det derved har forstyret hentningen af filer under installationen (med forventning om login på netværk).

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_06.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 8
Herefter starter installationen med at hente filer og lave de forskellige opsætninger. 
Dette vil tage en del tid alt efter hastigheden på nettet. 
Under installationen kan der blive spurgt efter "_bibbox_" brugerens adgangskode, hvilket man så bare skal indtaste. 

__Bemærk__: hvis skærmen bliver sort/blank under installation er dette en screensaver, 
som kan fjernes ved at trykke f.eks. pil ned (da denne tast på ingen måde kan forstyre installationen bagved).

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_07.png" alt="Drawing" style="width: 500px;"/>

Når installationen er gennemført vil maskinen genstarte og starte Google Chrome i kiosk mode i en minimal grafisk desktop. 
Selve konfigurationen af brugergrænsefladen sker via det administrative system (web-grænseflade) på BibBox Admin Serveren, 
som så kan uploade konfigurationen til SC maskinen.

-------------------------

# Static IP
Efter installationen kan man åbne en ny terminal og skifte til en statisk IP med scriptet "_ip.sh_" i "_install_" mappen.


#### Step 1
For at få adgang til en terminal skal man trykke "__ctrl+w__" og hurtigt klikke på højre mus tast på den lyse grå baggrund 
før Google Chrome når at genstarte. Man vil så få en menu (som vist på billedet), hvis man ikke klikker andre steder 
vil denne være der efter Chrome er kommet frem igen.

Vælge "__Terminal emulator__" for at start terminalen.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_00.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 2
Den opstartede terminal med Google Chrome i baggrunden.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_08.png?1" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 3
Gå ind i "_install_" folderen og kør kommandoen "__./ip.sh__" for at starte scriptet til at skifte til en statisk IP. Scriptet kan bruges til at skifte til DHCP, ved at svare "__y__" til første spørgsmål. Men her antager vi at man svarer "__n__" og "__y__" til næste spørgsmål om at sætte en statisk IP.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_09.png?1" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 4
Vælg det netkort som man ønsker ændret til statisk IP (normalt på Intel nuc, vil det være "_enp3s0_". Billedet herunder passer ikke med en Intel nuc, men en virtual maskine).

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_10.png?1" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 5
Angiv netværksadresser der ønskes brugt, hvis default vil bruges trykker man bare på "__enter__" uden at angive noget for det enkelte valg. Herefter skal man angive "_bibbox_" brugerens adgangskode for at foretage ændringeren.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_11.png?1" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 6
Slå WIFI fra ved at vælge det wireless netkort (starter normalt med "_wlp_").

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_12.png?1" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 7
Genstart maskinen for at sikre at ændringen slår igennem. Dette gøres ved at skrive "__reboot__" og trykke "__enter__".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_13.png" alt="Drawing" style="width: 500px;"/>

Når maskinen er startet op med Google Chrome er maskine færdig konfigureret og klar til at modtage yderligere konfiguration fra den administrative server.
