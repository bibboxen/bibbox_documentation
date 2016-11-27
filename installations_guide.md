# Installations guide (dansk)
Denne guide indholder en kort og længer gennemgang af hvordan man install BibBox som et SelfCheck system (SC). Denne løsning benytter [Ubuntu Server 16.04 LTS](https://www.ubuntu.com/download/server). Så denne gannemgang er en installation af Ubuntu Server og derefter et installations script.

Installation kræver at man har en internet forbindelse, da det meste at det krævede software automatisk downloads fra Internettet. Installations scriptet kommer med et ekstra script til at ændre IP til en static adresse.

Guiden antager at man benytter en USB pen til at foretage installationen og at denne indholder både Ubuntu og BibBox installations script (men det kunne være på forskellige pens).

__Hint__: Server installation bruger _n-curses_ UI hvor man slår ting fra/til med "Space", skifter område med "Tabulator" og bekræfter med Enter.

## Kort gennemgang.
1. Install Ubuntu Server
2. Vælg sprog "English"
3. Vælg location "other", "Europe" og derefter "Danmark
4. Vælg locales til "United Kingdom - en_GB.UTF-8"
5. "No" til at automatisk keyboard
6. Tryk enter til "Danish" og til "Danish" layout
7. Angive hostname
8. Opret bruger konto "__bibbox__" med tilhørende adgangskode og svar "Yes" hvis den spørge efter "Weak password"
9. "No" til at krypter hjemme mappen
10. Vælg tidszone "Europe/Copenhagen"
11. Hvis den spørge til at "umount partitions" svar "Yes"
12. Partition af disken - vælg "Guided - use entire disk"
13. Vælg disk og svar "Yes" til at skrive ændringer til disk
14. Tryk enter til "Proxy" og derved ikke vælge nogle
15. Vælg "No automatic updates"
16. Tab til "Continue" med kun "standard system utilities" som valgt "Software selection"
17. Install Grub i master boot record, hvis det komme op så vælg disken "sda"
18. Finish installation og reboot
19. .....






## Detaljeret gennemgang

#### Step 1
Efter boot op vil den første skærm vise de installations muligheder man har fra USB pen'en. Denne skærm kan se forskellige ud at efter om den er grafisk eller tekst baseret. Men lige meget hvad skal man vælge punktet "__Install Ubuntu Server__".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/01.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 2 (Select a language)
Vælg sprog "English" man kan osse vælge dansk, men det har ingen betydning da det enlige system er låst ned til kun at køre BibBox SC systemet. Resten af denne guide antager at valget er engelsk.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/02.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 3 (Select your location - 1)
Vælg din location "Other" som land.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/03.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 4 (Select your location - 2)
Vælg "Europe" som region.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/04.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 5 (Select your location - 3)
Vælg "Danmark" som område.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/05.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 6 (Configure locales)
Vælg "United Kingdom - en_GB.UTF-8" som local til at baser system på.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/06.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 7 (Configure the keyboard - 1)
Her skal man vælge "No" da man ellers skal trykke en række speciale taster for at automatisk find dit keyboard layout, hvilket er langt mere besværligt.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/07.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 8 (Configure the keyboard - 2)
Vælg land "Danish" som gerne skulle være valgt på forhånd ellers find den på listen og tryk enter.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/08.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 9 (Configure the keyboard - 3)
Vælg igen "Danish" med mindre du vil benytte et ikke standard dansk tastetur.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/09.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 10 (Automatically detected network)
Installation vil nu automatisk find det tilkoblet netværk (DHCP) og oprette forbindelse til Internettet.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/10.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 11 (Configure the network - hostname)
Angive systemet netværksnavn.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/12.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 12 (Set up users and passwords - full name)
Opret super burger på systemet, det er ikke krævet at denne bruger hedder "bibbox" men det er anbefalt. De efter følgende script skulle tage højde for at andre brugernavn bruges. Men dette er ikke testet på nuværende tidspunkt.

Angiv navn: __bibbox__

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/13.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 13 (Set up users and passwords - user name)
Vælge samme navn som i forrige skridt.

Angiv brugernavn: __bibbox__

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/14.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 14 (Set up users and passwords - password)
Angiv super brugerens adgangskode - husk at denne skal bruge senere og til at sikkerheds opdatere system senere.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/15.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 15 (Set up users and passwords - password verify)
Angiv adgangskoden igen.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/16.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 16 (Set up users and passwords - weak password)
Hvis du har valgt en adgangskode system synes er forkort eller svag, vil dette skærmbillede kommer frem. Bare sige "Yes" til at accepter svagt password.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/17.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 17 (Set up users and passwords - encrypt)
Vælg "No" til at krypter hjemme mappen for brugen.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/18.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 18 (Configure the Clock)
Hvis der er forbindelse til Internettet (NTP) vil der være for valgt "Europe/Copenhagen" som tidszone. Ellers vælg den på listen.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/19.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 19 (Partition disks - 1)
Hvis den spørge om den skal unmount partitioner allerede i så vælg "Yes" til at umount dem.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/20.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 20 (Partition disks - 2)
Til partitionering af disken vælg "Guided - use entrie disk" for at benytte hele disken.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/21.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 21 (Partition disks - 3)
Vælge hoved disk normalt kaldt "_sda_" hvis der er flere på listen.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/22.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 22 (Partition disks - 4)
Vælg at skrive ændringer til disken ("Yes") for at oprette partitionerne.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/23.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 23 (Configure the package manger)
Vælg ingen proxy ved at trykke Enter.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/24.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 24 (Configure tasksel)
Vi ønsker ikke at benytte automatisk opdatering, da vi gerne vil have kontrol over softwaren på SC systemet for at sikre det er stabilt.

Så vælg "__No automatic updates__".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/25.png" alt="Drawing" style="width: 595px;"/>

-------------------------

### Step 25 (Software selection)
Brug tab til at komme til __"Continue"__ så vi kun vælger __"standard system utilities"__ som det eneste vi installer på nuværende tidspunkt.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/26.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 26 (Install the GRUB boot loader on a hard disk)
For at kan boot systemet op efter installation skal grub installeres på master boot record. Så vælg __"Yes"__ til dette. Hvis der er mere end en disk vil den komme og spørge hvilken disk dette vil være __"sda"__ som udgangspunkt.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/27.png" alt="Drawing" style="width: 595px;"/>

-------------------------

#### Step 27 (Finish the installation)
Fjern USB installations pen'en og vælg __"Continue"__ hvilket vil genstart maskine. Den vil nu være klar til at køre selv installation af BibBox softwaren.

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/28.png" alt="Drawing" style="width: 595px;"/>


-------------------------



## Kørelse af BibBox _install.sh_ script

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/29.png" alt="Drawing" style="width: 595px;"/>

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/30.png" alt="Drawing" style="width: 595px;"/>

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/31.png" alt="Drawing" style="width: 595px;"/>

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/32.png" alt="Drawing" style="width: 595px;"/>

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/33.png" alt="Drawing" style="width: 595px;"/>

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/34.png" alt="Drawing" style="width: 595px;"/>

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/35.png" alt="Drawing" style="width: 595px;"/>

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/36.png" alt="Drawing" style="width: 595px;"/>

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/37.png" alt="Drawing" style="width: 595px;"/>

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/38.png" alt="Drawing" style="width: 595px;"/>

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/39.png" alt="Drawing" style="width: 595px;"/>

# Static IP
