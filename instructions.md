## Simons Says - MSP430
### User Instructons
Das Spiel besteht aus 2 Teilen:
1. Bestimmte LEDs des MSPs blinken auf
2. Der Nutzer muss die LEDs in der angezigten Reihenfolge drücken

Jede Runde werden wieder neue LEDs angezeigt. Der Nutzer muss sich also immer mehr LEDs merken. Das Spiel wird so kontinuierlich schwieriger. Die Taste muss ca. eine Selunde lang gedrückt werden. Wenn man die richtige Taset gedrückt hat, leuchtet die 8. LED kurz auf. Das Speil geht insegsamt 10 Runden, es folgt eine Sucessanimation. Sollte der Nutzer einen Fehler machen, folgt eine Failanimation und das Spiel beginnt von vorner

Bsp.:

Runde 1:
```
LEDs: xooooooo
Tasten: xooooooo 
```
8. LED leuchtet auf

Runde 2:
```
LEDs: xooooooo, oxoooooo
Tasten: xooooooo, oxoooooo
```
8. LED leuchtet auf
...

Nach 10 Runden beginnt das Spiel von vorne.
-> Success Animation

Sollte der Nutzer einen Fehler machen, beginnt das Spiel von vorne.

Bsp.:

Runde 1:
```
LEDs: xooooooo
Tasten: xooooooo 
```
8. LED leuchtet auf

Runde 2:
```
LEDs: xooooooo, oxoooooo
Tasten: xooooooo, ooxooooo
```
--> Spiel beginnt von vorne wg. FALSCHEN TASTEN
--> Failanimation

Failanimation:
- 1 x Flash + Lauflicht

Successanimation:
- 2 x Flash



