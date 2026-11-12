# Übungsordner

`main.tex` ist der Einstieg für das gemeinsame Abgabeprotokoll. Dort stehen
die Angaben zum Blatt und zum Team sowie die Reihenfolge der Aufgaben.

- Unter `tasks/` gibt es pro Aufgabe einen nummerierten Ordner mit einer
  `solution.tex`.
- Skripte kommen bei Bedarf zur jeweiligen Aufgabe, etwa nach `tasks/05/code/`.
  Abbildungen für das Protokoll kommen nach `tasks/05/figures/`. In LaTeX werden
  sie relativ zu `main.tex` eingebunden, etwa mit
  `\includegraphics[width=.8\linewidth]{tasks/05/figures/storks.pdf}`.

## PDF bauen

Im Ordner dieses Aufgabenblatts mit TeX Live oder MacTeX ausführen.

```sh
latexmk -pdf -halt-on-error -outdir=build main.tex
```

Das gemeinsame PDF liegt danach unter `build/main.pdf`.

## Nächstes Aufgabenblatt beginnen

Den zuletzt verwendeten Übungsordner unter der nächsten Nummer kopieren.
Im neuen Ordner die Angaben und `\input`-Zeilen in `main.tex` anpassen, die
Aufgabenabschnitte durch die neuen ersetzen und alte Skripte, Abbildungen
und gegebenenfalls den `build/`-Ordner aus der Kopie entfernen. Danach das
PDF erneut bauen. Verbesserungen an der Struktur können direkt in der
laufenden Übung vorgenommen werden und gehen beim nächsten Kopieren mit.
