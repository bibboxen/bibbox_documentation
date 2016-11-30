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

__Note__: Husk at sætte maskine til at start automatisk ved "__Power failure__", hvilet osse gøres i BIOS.

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
1. Install Ubuntu Server
2. Vælg sprog __"English"__
3. Vælg location __"other"__, __"Europe"__ og derefter __"Danmark"__
4. Vælg locales til __"United Kingdom - en_GB.UTF-8"__
5. __"No"__ til at automatisk keyboard
6. Tryk enter til __"Danish"__ og __"Danish"__ som layout
7. Angiv hostname
8. Opret bruger konto "__bibbox__" med tilhørende adgangskode og svar __"Yes"__ hvis den spørger efter "Weak password"
9. __"No"__ til at kryptere hjemmemappen
10. Vælg tidszone __"Europe/Copenhagen"__
11. Hvis den spørger til at "umount partitions" svar __"Yes"__
12. Partition af disken - vælg __"Guided - use entire disk"__
13. Vælg disk og svar __"Yes"__ til at skrive ændringer til disk
14. Tryk enter til __"Proxy"__. Derved vælges ingen
15. Vælg __"No automatic updates"__
16. Tab til __"Continue"__ med kun "standard system utilities" som valgt software
17. Install Grub i master boot record, hvis det kommer op vælg så disken __"sda"__
18. Færdiggør installationen og genstart
19. Login som __"bibbox"__
20. Kør "__ifconfig__" og notere IP adresse
21. Indsæt USB nøgle med install scripts - __"sudo mount /dev/sdb1 /media/cdrom"__
22. Kopier scripts og drivers - __"cp -rf /media/cdrom/install /home/bibbox/"__
23. Umount USB - __"sudo umount /media/cdrom"__
24. Lav scriptet executable - __"sudo chmod +x /home/bibbox/install/*.sh"__
25. Kør scriptet - __"cd /home/bibbox/install"__ og __"./install.sh"__
26. Hvis maskinen ikke er på det rigtig netværk vælg __"n"__ til at sætte static IP
27. Vælg wireless netkort og slå dette fra. Normalt starter det med __"wlp"__
28. Hvis den spørger efter password skriv _bibbox_-brugerens adgangskode. Dette kan ske flere gang under installationen,
 hvis denne tager længere tid end normalt.
29. Hvis den spørger om andet end specificeret i vejledningen ovenfor skal der svares "no" i alle tilfælde.


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
Denne skærm kan se forskellig ud alt efter om den er grafisk- eller tekstbaseret. Men lige meget hvad skal man vælge punktet "__Install Ubuntu Server__".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/01.png" alt="Drawing" style="width: 500px; align: center"/>

-------------------------

#### Step 2 (Select a language)
Vælg sprog "__English__". Man kan også vælge danish, da dette ingen betydning har på det endelige system, der er låst ned til kun at køre BibBox SelfCheck (SC) systemet. 
Resten af denne guide antager at valget er engelsk.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/02.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 3 (Select your location - 1)
Vælg din location "__Other__" som land.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/03.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 4 (Select your location - 2)
Vælg "__Europe__" som region.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/04.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 5 (Select your location - 3)
Vælg "__Danmark__" som område.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/05.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 6 (Configure locales)
Vælg "__United Kingdom - en_GB.UTF-8__" som locale til at basere systemet på.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/06.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 7 (Configure the keyboard - 1)
Her skal man vælge "__No__", da man ellers skal trykke en række specialtaster for automatisk at finde dit keyboard layout, hvilket er langt mere besværligt.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/07.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 8 (Configure the keyboard - 2)
Vælg land "__Danish__", som gerne skulle være valgt på forhånd, ellers find den på listen og tryk enter.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/08.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 9 (Configure the keyboard - 3)
Vælg igen "__Danish__" medmindre du vil benytte et ikke standard dansk tastatur.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/09.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 10 (Automatically detected network)
Installationen vil nu automatisk finde det tilkoblede netværk (DHCP) og oprette forbindelse til Internettet.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/10.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 11 (Configure the network - hostname)
Angiv systemets netværksnavn.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/12.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 12 (Set up users and passwords - full name)
Opret superburger på systemet. Det er ikke krævet, at denne bruger hedder "bibbox", men det er anbefaldet. 
NB! De efterfølgende scripts skulle tage højde for at andre brugernavne kan bruges. Men dette er ikke testet på nuværende tidspunkt.

Angiv navn: __bibbox__

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/13.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 13 (Set up users and passwords - user name)
Vælg samme navn som i forrige skridt.

Angiv brugernavn: __bibbox__

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/14.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 14 (Set up users and passwords - password)
Angiv superbrugerens adgangskode - husk at denne skal bruges senere til at sikkerhedsopdatere systemet mm.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/15.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 15 (Set up users and passwords - password verify)
Angiv adgangskoden igen.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/16.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 16 (Set up users and passwords - weak password)
Hvis du har valgt en adgangskode som systemet syntes er for kort eller svagt, vil dette skærmbillede kommer frem. Bare sige "__Yes__" til at acceptere svagt password.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/17.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 17 (Set up users and passwords - encrypt)
Vælg "__No__" til at kryptere hjemmemappen for brugeren.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/18.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 18 (Configure the Clock)
Hvis der er forbindelse til Internettet (NTP) vil der være valgt "__Europe/Copenhagen__" som tidszone. Ellers vælg den på listen.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/19.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 19 (Partition disks - 1)
Hvis den spørger om den skal unmount partitioner så vælg "__Yes__" til at umount dem.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/20.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 20 (Partition disks - 2)
Til partitionering af disken vælg "__Guided - use entire disk__" for at benytte hele disken.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/21.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 21 (Partition disks - 3)
Vælge hoveddisk, normalt kaldt "_sda_", hvis der er flere på listen.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/22.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 22 (Partition disks - 4)
Vælg at skrive ændringer til disken. "__Yes__" for at oprette partitionerne.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/23.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 23 (Configure the package manger)
Vælg ingen proxy ved at trykke "__enter__".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/24.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 24 (Configure tasksel)
Vi ønsker ikke at benytte automatiske opdateringer, da vi gerne vil have kontrol over softwaren på SC systemet for at sikre det er stabilt.

Så vælg "__No automatic updates__".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/25.png" alt="Drawing" style="width: 500px;"/>

-------------------------

### Step 25 (Software selection)
Brug tab til at komme til "__Continue__" så vi kun vælger "__standard system utilities__", som det eneste vi installerer på nuværende tidspunkt.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/26.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 26 (Install the GRUB boot loader on a hard disk)
For at boote systemet op efter installation skal grub installeres på master boot record. 
Så vælg "__Yes__" til dette. 
Hvis der er mere end en disk vil den komme og spørge hvilken disk dette vil være - brug disk valgt i step 21, "__sda__" som udgangspunkt.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/27.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 27 (Finish the installation)
Fjern USB installations-pen'en og vælg "__Continue__" hvilket vil genstarte maskinen. 
Den vil nu være klar til at køre selv-installationen af BibBox softwaren.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/28.png" alt="Drawing" style="width: 500px;"/>


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
