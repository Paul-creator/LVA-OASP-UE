# Assignment 2 · MVU and CRLB

Die [Aufgabenstellung](Assignment2.pdf) umfasst vier Aufgaben. Abgabe laut Blatt am 03.12.2026 um 08:00 Uhr per Moodle.

- `main.tex` bindet vier Aufgaben mit Teilaufgaben unter `tasks/01/` bis `tasks/04/` ein. Die Lösungen enthalten Platzhalter.
- Skripte kommen nach `src/`, Abbildungen nach `images/`.
- Layout, Teamangaben und Mathematikbefehle kommen aus [exercises.sty](../../typesetting/exercises.sty).

## PDF bauen

Im Ordner `assignments/02` mit TeX Live oder MacTeX ausführen.

```sh
latexmk -lualatex -halt-on-error -outdir=build main.tex
```

Die lokale `latexmkrc` ergänzt den Suchpfad zu `typesetting/`. Das PDF liegt bei diesem Aufruf unter `build/main.pdf`. Die VS-Code-Rezeptur verwendet dagegen den Übungsordner als Ausgabeordner.

## Weitere Aufgabenblätter

Diesen Ordner unter der nächsten Nummer kopieren. Aufgabenblatt, Titel, Blattnummer, Datum und Aufgabenabschnitte anpassen. Übernommene Lösungen, Skripte, Abbildungen und Build-Ausgaben in der neuen Kopie bereinigen.
