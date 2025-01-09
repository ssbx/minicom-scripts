# minicom config et scripts

## installation

```shell
$ mkdir ~/Minicom
$ mkdir ~/Minicom/Down
$ mkdir ~/Minicom/Up
$ mkdir ~/Minicom/Logs
$ mkdir ~/Minicom/Scripts
$ cp *.tcl ~/Minicom/Scripts/
$ cp .minirc* ~/
```
L'utilisateur doit apartenir au groupe "dialout" sur debian. Voir le groupe
du tty (ls -l /dev/ttyUSB0).

## scripts

### reset alcatel

Le script reset le mot de passe console, redémare et nettoie, redemare et
affiche le contenu des dossiers pour verification.

Lancer minicom avec la bonne conf:

```shell
$ minicom c-ttyUSB0_9600_alcatel
```

Connecter le cable console au switch eteint.

Depuis minicom, Ctrl-A, Z, G, C, entrer reset_alcatel.tcl dans le champ
"Nom du script". Appuyer deux fois sur entré pour valider.

Dans un autre terminal suivre la progression du script avec:

```shell
$ tail -f ~/Minicom/Scripts/output.log
```

Mettre le switch sous tention.

