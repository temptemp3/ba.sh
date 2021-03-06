#!/bin/bash
## test-worker
## version 0.0.1 - initial
##################################################
. ${SH2}/error.sh		# error handling
error "true"			# show errors	
_cleanup() { 			# 
  test ! "$( temp this )" = "$( temp global )" || {
    cecho green "cleaning up ..."
    rm -rvf $( temp this )* 1>&2
  }
}
. ${SH2}/aliases/commands.sh	# commands
. ${SH2}/temp.sh		# temp
. ${SH2}/worker.sh		# worker
. ${SH2}/cecho.sh		# colored echo
test-worker-seq() {
  seq ${1} | xargs
}
test-worker-main() { { local -a n ; n=${1} ; }
  cecho green "running main ..."
  cecho yellow "work"
  seq ${n} | xargs -i echo seq {} | tee $( temp global )-work
  worker $( temp global )-work 100
  cecho green "done"
}
test-worker() {
  commands
}
##################################################
if [ ! ] 
then
 true
else
 exit 1 # wrong args
fi
##################################################
test-worker ${@}
##################################################
## generated by create-stub2.sh v0.1.2
## on Wed, 17 Jul 2019 15:42:47 +0900
## see <https://github.com/temptemp3/sh2>
##################################################
