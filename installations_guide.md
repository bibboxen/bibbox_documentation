# Installations guide (dansk)
Denne guide indholder en kort og længer gennemgang af hvordan man install BibBox som et SelfCheck system (SC). Denne løsning benytter [Ubuntu Server 16.04 LTS](https://www.ubuntu.com/download/server). Så denne gennemgang er en installation af Ubuntu Server og derefter et installations script.

Installation kræver at man har en internet forbindelse, da det meste at det krævede software automatisk downloads fra Internettet. Installations scriptet kommer med et ekstra script til at ændre IP til en static adresse.

Guiden antager at man benytter en USB nølge til at foretage installationen og at denne indholder både Ubuntu Server og BibBox installations script (men det kunne være på forskellige nøgler).

__Hint__: Server installation bruger _n-curses_ UI hvor man slår ting fra/til med "__space__", skifter område med "__tabulator__" og bekræfter sine valg med "__enter__".

__Hint__: "__tab__" kan osse bruge til at auto-complete kommandor og stier i filesystemet. To hurtige tryk på "__tab__" vil komme med foreslag, hvis der er mere end en auto-complete mulighed.

## Kort gennemgang.
1. Install Ubuntu Server
2. Vælg sprog __"English"__
3. Vælg location __"other"__, __"Europe"__ og derefter __"Danmark"__
4. Vælg locales til __"United Kingdom - en_GB.UTF-8"__
5. __"No"__ til at automatisk keyboard
6. Tryk enter til __"Danish"__ og __"Danish"__ som layout
7. Angive hostname
8. Opret bruger konto "__bibbox__" med tilhørende adgangskode og svar __"Yes"__ hvis den spørge efter "Weak password"
9. __"No"__ til at krypter hjemme mappen
10. Vælg tidszone __"Europe/Copenhagen"__
11. Hvis den spørge til at "umount partitions" svar __"Yes"__
12. Partition af disken - vælg __"Guided - use entire disk"__
13. Vælg disk og svar __"Yes"__ til at skrive ændringer til disk
14. Tryk enter til __"Proxy"__ og derved ikke vælge nogle
15. Vælg __"No automatic updates"__
16. Tab til __"Continue"__ med kun "standard system utilities" som valgt software
17. Install Grub i master boot record, hvis det komme op så vælg disken __"sda"__
18. Finish installation og reboot
19. Login som __"bibbox"__
20. Indsæt USB nøgle med install scripts - __"sudo mount /dev/sdb1 /media/cdrom"__
21. Kopier scripts og drivers - __"cp -rf /media/cdrom/install /home/bibbox/"__
22. Umount USB - __"sudo umount /media/cdrom"__
23. Lave script executable - __"sudo chmod +x /home/bibbox/install/*.sh"__
24. Kør script - __"cd /home/bibbox/install"__ og __"./install.sh"__
25. Hvis maskine ikke er på det rigtig netværk vælg __"n"__ til at sætte static IP
26. Vælg wireless netkort og slå dette fra. Normalt start det med __"wlp"__
27. Hvis den spørg efter password skrive _bibbox_ brugens adgangskode. Dette kan se flere gang under installation hvis denne tager længer tid end normalt.


__Skift til statisk IP__

1. Ctrl __"w"__ for at lukke Chrome (som vil start igen med det samme)
2. Ingen Chrome når at start __"Højre klik"__
3. Vælg "Terminal"
4. Gå ind i install __"cd /home/bibbox/install"__
5. Køre __"./ip.sh"__
6. Vælg ethernet kort, normalt _"enp"_ (på Intel nuc "enp3s0")
7. Angiv netværksadresser
8. Vælg wireless kort, normalt start med _"wlp"_
9. Reboot ved at skrive __"reboot"__ og tryk enter





## Detaljeret gennemgang

#### Step 1
Efter boot op vil den første skærm vise de installations muligheder man har fra USB pen'en. Denne skærm kan se forskellige ud at efter om den er grafisk eller tekst baseret. Men lige meget hvad skal man vælge punktet "__Install Ubuntu Server__".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/01.png" alt="Drawing" style="width: 500px; align: center"/>

-------------------------

#### Step 2 (Select a language)
Vælg sprog "__English__" man kan osse vælge danish, men det har ingen betydning da det enlige system er låst ned til kun at køre BibBox SelfCheck (SC) systemet. Resten af denne guide antager at valget er engelsk.

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
Vælg "__United Kingdom - en_GB.UTF-8__" som local til at baser system på.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/06.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 7 (Configure the keyboard - 1)
Her skal man vælge "__No__" da man ellers skal trykke en række speciale taster for at automatisk find dit keyboard layout, hvilket er langt mere besværligt.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/07.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 8 (Configure the keyboard - 2)
Vælg land "__Danish__" som gerne skulle være valgt på forhånd ellers find den på listen og tryk enter.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/08.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 9 (Configure the keyboard - 3)
Vælg igen "__Danish__" med mindre du vil benytte et ikke standard dansk tastetur.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/09.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 10 (Automatically detected network)
Installation vil nu automatisk find det tilkoblet netværk (DHCP) og oprette forbindelse til Internettet.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/10.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 11 (Configure the network - hostname)
Angive systemet netværksnavn.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/12.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 12 (Set up users and passwords - full name)
Opret super burger på systemet, det er ikke krævet at denne bruger hedder "bibbox" men det er anbefalt. De efter følgende script skulle tage højde for at andre brugernavn bruges. Men dette er ikke testet på nuværende tidspunkt.

Angiv navn: __bibbox__

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/13.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 13 (Set up users and passwords - user name)
Vælge samme navn som i forrige skridt.

Angiv brugernavn: __bibbox__

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/14.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 14 (Set up users and passwords - password)
Angiv super brugerens adgangskode - husk at denne skal bruges senere til at sikkerhedsopdatere systemet mm.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/15.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 15 (Set up users and passwords - password verify)
Angiv adgangskoden igen.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/16.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 16 (Set up users and passwords - weak password)
Hvis du har valgt en adgangskode system synes er forkort eller svag, vil dette skærmbillede kommer frem. Bare sige "__Yes__" til at accepter svagt password.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/17.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 17 (Set up users and passwords - encrypt)
Vælg "__No__" til at krypter hjemme mappen for brugen.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/18.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 18 (Configure the Clock)
Hvis der er forbindelse til Internettet (NTP) vil der være for valgt "__Europe/Copenhagen__" som tidszone. Ellers vælg den på listen.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/19.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 19 (Partition disks - 1)
Hvis den spørge om den skal unmount partitioner allerede i så vælg "__Yes__" til at umount dem.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/20.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 20 (Partition disks - 2)
Til partitionering af disken vælg "__Guided - use entire disk__" for at benytte hele disken.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/21.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 21 (Partition disks - 3)
Vælge hoved disk normalt kaldt "_sda_" hvis der er flere på listen.

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
Vi ønsker ikke at benytte automatisk opdatering, da vi gerne vil have kontrol over softwaren på SC systemet for at sikre det er stabilt.

Så vælg "__No automatic updates__".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/25.png" alt="Drawing" style="width: 500px;"/>

-------------------------

### Step 25 (Software selection)
Brug tab til at komme til "__Continue__" så vi kun vælger "__standard system utilities__" som det eneste vi installer på nuværende tidspunkt.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/26.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 26 (Install the GRUB boot loader on a hard disk)
For at kan boot systemet op efter installation skal grub installeres på master boot record. Så vælg "__Yes__" til dette. Hvis der er mere end en disk vil den komme og spørge hvilken disk dette vil være "__sda__" som udgangspunkt.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/27.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 27 (Finish the installation)
Fjern USB installations pen'en og vælg "__Continue__" hvilket vil genstart maskine. Den vil nu være klar til at køre selv installation af BibBox softwaren.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/28.png" alt="Drawing" style="width: 500px;"/>


-------------------------



## Kørelse af BibBox _install.sh_ script

#### Step 1
Login som brugeren "__bibbox__" på systemet.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_01.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 2
Indsæt USB nøgle med BibBox installations scriptet og mount denne ind i "__/media/cdrom__". USB nøglen vil normalt frem komme som "_sdb1_", men kan hvis der er flere USB nøgler komme som næste bogstav "_sdc1_".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_02.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 3
Kopier installations folder med script og drivers ind i hjemme mappen for "_bibbox_" brugeren.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_03.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 4
Kør installations script ved at gå ind i mappen install. 

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_04.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 5
Eksekvere file "_install.sh_" for at påbegynde installations processen af BibBox SC software.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_05.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 6
Første skridt i installations scripter er om du vil benytte en statisk IP adresse eller forsætte med en dynamisk IP. Vi antager her at vi forsætter med en dynamisk IP (statiske kan sætte senere) og vælger derefter at slå WIFI fra på maskinen (normalt start den med "_wlp_").

__Bemærk__: grund til at man slår WIFI fra at det under nogle installation har automatisk forbundet til åbne netværk og derved forstyret hentningen af filer under installationen (med forventning om login på netværk).

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_06.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 7
Her efter start installation med at hente filer og laver forskellige opsætninger. Dette vil tage en del tid alt efter hastigheden på nettet. Under installation kan der blive spurgt efter "_bibbox_" brugerens adgangskode, hvilket man så bare skal indtast. 

__Bemærk__: hvis skærmen bliver sort/blank under installation er dette en screensaver, som kan fjernes ved at trykke f.eks. pil ned (da denne tast på ingen måde kan forstyre installation bagved).

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_07.png" alt="Drawing" style="width: 500px;"/>

Når installationen er gennemført vil maskinen genstart og start Google Chrome i kiosk mode i en minimal grafisk desktop. Selve konfiguration af brugergrænsefladen ske via det administrative system (web-grænseflade) på BibBox Admin Serveren, som så kan upload konfigurationen til SC maskinen.

-------------------------

# Static IP
Efter installation kan man åbne en ny terminal og skifte til en statisk IP med scriptet "_ip.sh_" i "_install_" mappen.


#### Step 1
For at få adgang til en terminal skal man trykke "__ctrl+w__" og hurtig klikke på højre mus tast på en lyse grå baggrund før Google Chrome når at genstarter. Man vil så få en menu (som vist på billedet), hvis man ikke klikker andre steder vil denne være der efter Chrome er kommet frem igen.

Vælge "__Terminal emulator__" for at start terminalen.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_00.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 2
Den opstartet terminal med Google Chrome i baggrunden.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_08.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 3
Gå ind i "_install_" folderen og køre kommandoen "__./ip.sh__" for at start scriptet til at skift til en statisk IP.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_09.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 4
Vælg det netkort som ønske ændret til statisk IP (normalt på Intel nuc, vil det være "_enp3s0_").

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_10.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 5
Angiv netværksadresser der ønske brugt, hvis default vil bruges trykker der bare på "__enter__" uden at angiv noget for det enkelt valg.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_11.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 6
Slå WIFI fra ved at valg det wireless netkort (starter normalt med "_wlp_").

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_12.png" alt="Drawing" style="width: 500px;"/>

-------------------------

#### Step 7
Genstart maskine for at sikre at ændringen slår igennem. Dette gøres ved at skrive "__reboot__" og trykke "__enter__".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/install_13.png" alt="Drawing" style="width: 500px;"/>

Når maskinen er startet på med Google Chrome er maskine færdig konfigureret og klar til at modtage yderlig konfiguration for den administrative server.
