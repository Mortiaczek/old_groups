# groupsSystem
Prosty system grup który można wykorzystać na wiele sposobów na przykład jako multijob. Zalecam aby pobrać [zbudowaną wersje.](https://github.com/Mortiaczek/groupsSystem/releases/tag/resource)

### Panel tworzenie grupy dla administratora.

![Zdjecia panelu](https://i.imgur.com/OoJi1LP.png)

Wymagane skrypty:
> - [oxmysql](https://github.com/overextended/oxmysql)
> - [es_extended (esx legacy)](https://github.com/esx-framework/esx-legacy/tree/main/%5Besx%5D/es_extended)
  
  
### **Lista exportów**
  | Nazwa        | Opis           | Argumenty |
| ------------- |:-------------:|:-------------:|
| getCore      | Zwaraca wszystko co jest podpisane pod `GroupSystem`. | `Brak` |
| getIfPlayerInGroup      | Sprawdzanie czy gracz jest w danej grupie. Zwaraca `true` albo `false`.      | `nazwa grupy`

### **Lista komendy**
  | Nazwa        | Opis           | Argumenty | Wymagane permisje |
| ------------- |:-------------:|:-------------:|:-------------:|
| groupmaker, gm, makegroup, newgroup      | Otwiera menu tworzenie grupy. | `Brak` | `Tak` |
| addPlayerGroup      | Dodawanie danej grupy dla danego gracza. | `ID gracza` `Grupa` | `Tak` |
| removePlayerGroup      | Usuwanie danej grupy dla danego gracza. | `ID gracza` `Grupa` | `Tak` |
| groupslist      | Wyświetla liste zarejestrowanych grup w konsoli. | `Brak` | `Nie` |
| mygroups      | Wyświetla grupy gracza w konsoli. | `Brak` | `Nie` |
