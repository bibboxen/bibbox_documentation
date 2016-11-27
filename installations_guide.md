# Installations guide (dansk)
Denne guide indholder en kort og længer gennemgang af hvordan man install BibBox som et SelfCheck system (SC). Denne løsning benytter [Ubuntu Server 16.04 LTS](https://www.ubuntu.com/download/server). Så denne gannemgang er en installation af Ubuntu Server og derefter et installations script.

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
8. Opret bruger konto "bibbox" med tilhørende adgangskode og svar "Yes" hvis den spørge efter "Weak password"
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

### Step 1
Efter boot op vil den første skærm vise de installations muligheder man har fra USB pen'en. Denne skærm kan se forskellige ud at efter om den er grafisk eller tekst baseret. Men lige meget hvad skal man vælge punktet "__Install Ubuntu Server__".

<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/01.png" alt="Drawing" style="width: 595px;"/>


### Step 2


<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/02.png" alt="Drawing" style="width: 595px;"/>


### Step 3
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/03.png" alt="Drawing" style="width: 595px;"/>


### Step 4
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/04.png" alt="Drawing" style="width: 595px;"/>


### Step 5
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/05.png" alt="Drawing" style="width: 595px;"/>


### Step 6
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/06.png" alt="Drawing" style="width: 595px;"/>


### Step 7
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/07.png" alt="Drawing" style="width: 595px;"/>


### Step 8
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/08.png" alt="Drawing" style="width: 595px;"/>


### Step 9
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/09.png" alt="Drawing" style="width: 595px;"/>

### Step 10
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/10.png" alt="Drawing" style="width: 595px;"/>

### Step 12
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/12.png" alt="Drawing" style="width: 595px;"/>

### Step 13
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/13.png" alt="Drawing" style="width: 595px;"/>

### Step 14
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/14.png" alt="Drawing" style="width: 595px;"/>

### Step 15
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/15.png" alt="Drawing" style="width: 595px;"/>

### Step 16
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/16.png" alt="Drawing" style="width: 595px;"/>

### Step 17
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/17.png" alt="Drawing" style="width: 595px;"/>

### Step 18
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/18.png" alt="Drawing" style="width: 595px;"/>

### Step 19
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/19.png" alt="Drawing" style="width: 595px;"/>

### Step 20
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/20.png" alt="Drawing" style="width: 595px;"/>

### Step 21
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/21.png" alt="Drawing" style="width: 595px;"/>

### Step 22
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/22.png" alt="Drawing" style="width: 595px;"/>

### Step 23
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/23.png" alt="Drawing" style="width: 595px;"/>

### Step 24
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/24.png" alt="Drawing" style="width: 595px;"/>

### Step 25
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/25.png" alt="Drawing" style="width: 595px;"/>

### Step 26
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/26.png" alt="Drawing" style="width: 595px;"/>

### Step 27
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/27.png" alt="Drawing" style="width: 595px;"/>

### Step 28
<img src="https://raw.githubusercontent.com/bibboxen/docs/master/images/28.png" alt="Drawing" style="width: 595px;"/>


# Kørelse af BibBox install script

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
