#!/bin/bash
## test-function-global-variables
## version 0.0.1 - initial
##################################################
bar=0
test-function-global-variables() {
  local bar=1
  declare -g bar=2
  echo ${bar}
}
##################################################
if [ ${#} -eq 0 ] 
then
 true
else
 exit 1 # wrong args
fi
##################################################
test-function-global-variables
echo ${bar}
##################################################
## generated by create-stub2.sh v0.1.2
## on Fri, 19 Jul 2019 20:52:09 +0900
## see <https://github.com/temptemp3/sh2>
##################################################