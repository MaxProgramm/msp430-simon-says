## Simons Says - MSP430
### User Instructons
Das Spiel besteht aus 2 Teilen:
1. Bestimmte LEDs des MSPs blinken auf
2. Der Nutzer muss die LEDs in der angezigten Reihenfolge drücken

Jede Runde werden wieder neue LEDs angezeigt. Der Nutzer muss sich also immer mehr LEDs merken. Das Spiel wird so kontinuierlich schwieriger. Die Taste muss ca. eine Sekunde lang gedrückt werden. Wenn man die richtige Taste gedrückt hat, leuchtet die 8. LED kurz auf. Nach einer vollständigen Runde, spielt die success animation. Das Spiel geht insgesamt 10 Runden, danach beginnt das spiel von vorne. Sollte der Nutzer einen Fehler machen, folgt eine Failanimation und das Spiel beginnt von vorne.

Bsp.:

Runde 1:
```
Level 1
	LEDs: xooooooo

	Tasten:
		xooooooo 
		8. LED leuchtet auf
	-> Successanimation und nächste Runde
```

Runde 2:
```
Level 1, 2
	LEDs: xooooooo, oxoooooo

	Tasten:
		xooooooo
		8. Led leuchtet auf
		oxoooooo
		8. Led leuchtet auf
	-> Successanimation und nächste Runde 
```
...

Sollte der Nutzer einen Fehler machen, beginnt das Spiel von vorne.

Bsp.:

Runde 1:
```
Level 1
	LEDs: xooooooo

	Tasten:
		xooooooo 
		8. LED leuchtet auf
	-> Successanimation und nächste Runde
```

Runde 2:
```
Level 1, 2
	LEDs: xooooooo, oxoooooo

	Tasten:
		xooooooo
		8. Led leuchtet auf
		- FEHLER -
		ooxooooo - FEHLER
		- FEHLER -
	-> Failanimation
	-> Spiel beginnt von vorne wg. FALSCHEN TASTEN
```

Failanimation:
- 1 x Flash + Lauflicht

Successanimation:
- 2 x Flash

### Technische Details
**Speicherverwendung:**
- r12: Enthält die Adresse des ersten Levels
- RAM-Plätze 520-529 enthalten die Level




