# groupsSystem
Prosty system grup który można wykorzystać na wiele sposobów na przykład jako multijob. Zalecam aby pobrać [zbudowaną już wersje.](https://github.com/Mortiaczek/groupsSystem/releases/tag/resource)

### Panel tworzenie grupy dla administratora.

![Zdjecia panelu](https://i.imgur.com/OoJi1LP.png)

[Video preview.](https://streamable.com/8gml0s)

  
  
  
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
