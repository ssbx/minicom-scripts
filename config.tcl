#!/usr/bin/expect -f

set cfgfile "sw-dc1-u-b10-n3048.cfg"
#set cfgfile "swtest.cfg"
set cfgdir "/home/seb/src/ressources/dsin_scripts/switches/gen-cfg/"
set cfgpath [file join $cfgdir $cfgfile]

log_file config.log

if { [catch {open $cfgpath r} fd] } {
    send_log "Could not open $cfgpath for writing\n$fd"
    exit 1
}

set commands [split [read $fd] \n]
close $fd

send   "enable\n"
expect -re "\n(.*)#"

foreach {cmd} $commands {
    send   "$cmd\n"
    expect -re "\n(.*)#"
}
