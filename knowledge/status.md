# Arbeitsstand

Stand 22.11.2026, lokaler Git-Stand `e3b08eb`.

- Die [Aufgabenstellung für Assignment 1](../assignments/01/Assignment1.pdf) ist in Git versioniert.
- Das [Protokoll für Assignment 1](../assignments/01/main.tex) enthält Lösungen zu allen fünf Aufgaben. Aufgaben 3 und 5 wurden durch den Kollegen ergänzt, mit MATLAB-Skripten unter `assignments/01/src/` und Abbildungen unter `assignments/01/images/`. Die neuen Ergebnisse und der aktuelle Gesamtbuild wurden hier noch nicht vollständig geprüft. Assignment 1 ist laut Nutzerbestätigung vom 22.11.2026 bereits zur Kontrolle abgegeben. Der abgegebene Stand wird beibehalten.
- Das gemeinsame Paket [exercises.sty](../typesetting/exercises.sty) definiert Layout und Mathematikbefehle. Der Build verwendet LuaLaTeX und die lokale `latexmkrc`. Für weitere Aufgaben gelten die [Notationsvorgaben](decisions.md#standardisierte-mathematiknotation).
- Assignment 2 liegt mit Aufgabenblatt und bereinigtem Arbeitsgerüst unter `assignments/02/` vor. Vier Aufgaben mit Teilaufgaben sind vorbereitet. Das Arbeitsgerüst wurde mit LuaLaTeX aus TeX Live 2026 erfolgreich kompiliert, mit temporärem Schriftcache unter `/tmp`. Lösungen stehen noch aus. Abgabe laut Blatt am 03.12.2026 um 08:00 Uhr.
- Die Kursinfo wurde geprüft. Namen und Matrikelnummern beider Teammitglieder stehen auf der Titelseite.

## Nächste Schritte

1. Aufgaben für Assignment 2 im Zweierteam aufteilen.
2. Die vier Aufgaben anhand des neuen Blatts bearbeiten und verifizieren.

## Historische Hinweise zum abgegebenen Assignment 1

- In [Aufgabe 3](../assignments/01/tasks/03/solution.tex) steht im Text zur bedingten PMF `p(X1=1)=3/4`. Die Tabelle darüber ergibt `3/8`, und das angegebene bedingte Ergebnis passt zu `3/8`.
- Im [Skript zu Aufgabe 5](../assignments/01/src/Task04_Storks.m) verwendet der Plot `scatter(ChildBirthRate, Storks)`, während die Achsenbeschriftungen die umgekehrte Zuordnung angeben. Die gespeicherte Abbildung wurde noch nicht visuell geprüft.
