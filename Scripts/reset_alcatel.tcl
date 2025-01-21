#!/usr/bin/expect -f


log_file output.log

set timeout 60

expect -ex "Press s to STOP AT MINIBOOT..."
send "s\n"

expect -ex "\[Miniboot\]->"
send "xdelete \"working/boot.cfg\"\n"

set timeout 10

expect -ex "\[Miniboot\]->"
send "xdelete \"boot.params\"\n"

expect -ex "\[Miniboot\]->"
send "xdelete \"certivied/boot.cfg\"\n"

expect -ex "\[Miniboot\]->"
send "xdelete \"working/boot.cfg\"\n"

expect -ex "\[Miniboot\]->"
send "xdelete \"network/userTable1\"\n"

expect -ex "\[Miniboot\]->"
send "xdelete \"network/userTable2\"\n"

expect -ex "\[Miniboot\]->"
send "xdelete \"network/userTable3\"\n"

expect -ex "\[Miniboot\]->"
send "xdelete \"network/userTable4\"\n"

expect -ex "\[Miniboot\]->"
send "xdelete \"network/userTable5\"\n"

expect -ex "\[Miniboot\]->"
send "xdelete \"network/userTable6\"\n"

expect -ex "\[Miniboot\]->"
send "xdelete \"network/userTable7\"\n"

expect -ex "\[Miniboot\]->"
send "xdelete \"network/userTable8\"\n"

expect -ex "\[Miniboot\]->"
send "reboot\n"


set timeout -1

expect -ex "login :"
send "admin\n"

set timeout 5

expect -ex "password :"
send "switch\n"

expect -ex "->"
send "rm *\n"

expect -ex "->"
send "rm network/*\n"

expect -ex "->"
send "rm network/pub/*\n"

expect -ex "->"
send "rm working/boot.cfg\n"

expect -ex "->"
send "rm certified/boot.cfg\n"

expect -ex "->"
send "rm switch/*\n"

expect -ex "->"
send "rm switch/avlan/*\n"

expect -ex "->"
send "reload\n"

expect -ex "Confirm Reload (Y/N) : "
send "y"

set timeout -1

expect -ex "login :"
send "admin\n"

expect -ex "password :"
send "switch\n"

set timeout 10

expect -ex "->"
send "rm *\n"

expect -ex "->"
send "rm network/*\n"

expect -ex "->"
send "rm network/pub/*\n"

expect -ex "->"
send "rm working/boot.cfg\n"

expect -ex "->"
send "rm certified/boot.cfg\n"

expect -ex "->"
send "rm switch/*\n"

expect -ex "->"
send "rm switch/avlan/*\n"

send_log "=================================================================\n"
send_log "======= VERIF ls switch =========================================\n"
send_log "=================================================================\n"

expect -ex "->"
send "ls certified\n"

expect -ex "->"
send "ls certified\n"

expect -ex "->"
send "ls working\n"

expect -ex "->"
send "ls network\n"

expect -ex "->"
send "ls switch\n"

expect -ex "->"
send "ls\n"

expect -ex "->"

send_log "=================================================================\n"
send_log "======= DONE ====================================================\n"
send_log "=================================================================\n"
