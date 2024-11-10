# howto create a new helm chart AND host in on Github Pages


Um ein Helm Chart Repository auf GitHub zu erstellen und über GitHub Pages bereitzustellen, kannst du folgende Schritte ausführen. Du hast bereits ein tgz-Helm-Paket und möchtest dieses in einem GitHub-Repository öffentlich zugänglich machen.

## Schritte zur Erstellung eines GitHub Pages Helm Chart Repositorys

Erstelle das GitHub-Repository:

Du hast bereits ein GitHub-Repository namens github-chart-repo, das wir verwenden werden. Wenn das Repository noch nicht existiert, erstelle es bitte auf GitHub:
Gehe zu GitHub und erstelle ein neues Repository: github-user/github-chart-repo.
Gib dem Repository einen Namen (z.B. github-chart-repo), beschreibe es, wähle "Public" und initialisiere es ggf. mit einer README.md.
Vorbereitung des lokalen Verzeichnisses:

Erstelle ein lokales Verzeichnis github-chart-repo-lokal und wechsle dorthin:

```bash
mkdir github-chart-repo-lokal
cd github-chart-repo-lokal
```


## Installiere und erstelle den Chart-Index:

Wenn du ein tgz-Helm-Paket hast, müssen wir es in ein GitHub-Repository hochladen und einen Index erstellen. Dazu brauchen wir helm und git auf deinem lokalen Rechner.

Falls du Helm noch nicht installiert hast, folge der offiziellen Helm-Installationsanleitung.

## Chart-Index erstellen:

Erstelle den index.yaml für dein Helm-Chart. Dies ist die Datei, die von Helm benötigt wird, um die Charts im Repository zu finden.

Zuerst musst du sicherstellen, dass du das tgz-Helm-Paket in deinem lokalen Verzeichnis hast.

Angenommen, du hast das Chart-Paket mychart-1.0.0.tgz, kannst du den index.yaml mit folgendem Befehl erstellen:

```bash
helm repo index . --url https://github-user.github.io/github-chart-repo
```


Dieser Befehl erzeugt die Datei index.yaml und fügt das Chart-Paket in den Index ein, wobei die URL auf das zukünftige GitHub Pages-Verzeichnis verweist.


## GitHub Repository vorbereiten:

Clone dein GitHub-Repository (falls noch nicht geschehen) in das lokale Verzeichnis:

```bash
git clone https://github.com/github-user/github-chart-repo.git
cd github-chart-repo
```

Chart-Paket und Index-Datei hochladen:

Kopiere dein Helm-Chart-Paket (.tgz) und die generierte index.yaml Datei in das Verzeichnis, das du für GitHub Pages verwenden möchtest:
```bash
cp ../github-chart-repo-lokal/mychart-1.0.0.tgz .
cp ../github-chart-repo-lokal/index.yaml .
```

## GitHub Pages einrichten:

Erstelle einen Ordner docs (falls er noch nicht existiert), um GitHub Pages zu verwenden. GitHub Pages nutzt standardmäßig den Inhalt des Ordners docs/ im Repository:

```bash
mkdir docs
```

Verschiebe die index.yaml und das .tgz-Archiv in den docs-Ordner:

```bash
mv mychart-1.0.0.tgz docs/
mv index.yaml docs/
```

## Änderungen committen und pushen:

Füge die Änderungen zu Git hinzu, committe sie und pushe sie in dein GitHub-Repository:
```bash
git add docs/mychart-1.0.0.tgz docs/index.yaml
git commit -m "Initial Helm chart upload"
git push origin main
```

## GitHub Pages aktivieren:

Gehe in deinem GitHub-Repository zu den Settings.
Scrolle nach unten zu Pages.
Wähle als Quelle main branch und den Ordner /docs aus.
Klicke auf Save.
Überprüfe das Repository:

Dein Helm Chart Repository sollte jetzt über GitHub Pages unter der URL erreichbar sein:
```bash
https://github-user.github.io/github-chart-repo
```

Du kannst dies testen, indem du versuchst, das Chart von dieser URL zu installieren:

```bash
helm repo add github-charts https://github-user.github.io/github-chart-repo
helm repo update
helm search repo github-charts
```

## Zusammenfassung der Ordnerstruktur:
Nachdem du die Schritte abgeschlossen hast, sollte dein GitHub-Repository (z.B. github-chart-repo) folgende Struktur haben:

```bash
github-chart-repo/
│
├── docs/
│   ├── index.yaml
│   └── mychart-1.0.0.tgz
├── README.md
└── .gitignore
```

## Weitere Hinweise:
GitHub Pages benötigt ein wenig Zeit, um die Änderungen zu übernehmen. Falls die Seite nicht sofort funktioniert, warte einige Minuten.
Der Chart-Index (index.yaml) wird jedes Mal aktualisiert, wenn du neue Versionen deines Helm-Pakets hinzufügst. Stelle sicher, dass du den Index neu generierst, wenn du neue .tgz-Dateien hinzufügst.
Das war's! Jetzt hast du ein öffentliches Helm Chart Repository, das über GitHub Pages zugänglich ist.
