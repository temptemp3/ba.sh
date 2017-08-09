#!/bin/bash
##
## test - positional parameters with and 
##        without braces
##
## version 0.0.1 - initial
##
##################################################
test() {
 #
 # may not work (GNU bash v4.3.42(5)-release (x86_64-pc-msys ok)
 # 
 echo $1   $11111		# 1 11 or 1
 #
 # always ok
 #
 echo ${1} ${11111}	# 1 11
}
##################################################
if [ ! ] 
then
 true
else
 exit 1 # wrong args
fi
##################################################
test ${@}
##################################################
