# minicom config et scripts

## dependances

```shell
$ sudo apt install expect minicom
```

## installation

Les répertoires peuvent être changés en modifiant chaque ".minirc.*".

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

Dans un autre terminal préparer l'affichage de la progression du script:

```shell
$ tail -f ~/Minicom/Scripts/output.log
```

Mettre le switch sous tention. Ça prend environ 5 minutes, une bannière
s'affiche dans le log quand c'est terminé, et redonne la main à la fenêtre
minicom.

A la fin du script, pour enchainer les switchs, faire dans l'ordre:

- dans le terminal minicom Ctrl-A G, Entrée (le nom du script est préremplis)
- brancher le cable console sur le switch
- alimenter le switch
