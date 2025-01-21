# minicom config et scripts

## dependances

```shell
$ sudo apt install expect minicom
```

## répertoires

Les répertoires peuvent être changés en modifiant chaque "minirc.*".

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

### push config dell

Il faut éditer le script et donner le nom du fichier de conf à pousser.

Lancer minicom et se connecter au switch. S'authentifier mais ne pas passer
en "enable".

Ctrl-A, Z, G, C entrer push_config_dell.tcl, appuyer deux fois sur entré pour
valider.

On peut suivre la progression avec:

```shell
$ tail -f ~/Minicom/Scripts/output.log
```

Si le fichier de conf contient des erreurs, et se perd en chemin:
- l'annuler: depuis minicom Ctrl-C
- modifier le fichier de conf pour résoudre le problème (ou le script qui a 
généré la conf)
- relancer

Une fois fini, depuis minicom:
```shell
switch> enable
switch# copy running-config startup-config
```


