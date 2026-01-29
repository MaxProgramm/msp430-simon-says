## Simons Says - MSP430
Das Spiel besteht aus 2 Teilen:
1. Bestimmte LEDs des MSPs blinken auf
2. Der Nutzer muss die Leds in der angezigten Reihenfolge drücken

Jede Runde werden wieder neue LEDs angezeigt. Der Nutzer muss sich also immer mehr LEDs merken. Das Spiel wird so kontinuierlich schwieriger.

Bsp.:
Runde 1:
```
LEDs: xxoooooo
Tasten: xxoooooo 
```

Runde 2:
```
LEDs: xxoooooo, oxoxoooo
Tasten: xxoooooo, oxoxoooo
```
...

Sollte der Nutzer einen Fehler machen, beginnt das Spiel von vorne.
Bsp.:
Runde 1:
```
LEDs: xxoooooo
Tasten: xxoooooo 
```

Runde 2:
```
LEDs: xxoooooo, oxoxoooo
Tasten: xxoooooo, xxoxoooo
```
--> Spiel beginnt von vorne wg. FALSCHEN TASTEN




