#!/bin/bash
## tac
## version 0.0.1 - initial
##################################################
tac() {
  local -a arr
  local -i i
  mapfile arr -
  i="${#arr[@]}"
  while [ ${i} -ge 0 ]
  do
   echo ${arr[i]}
   let i-=1
  done
}
##################################################
if [ ${#} -eq 0 ] 
then
 true
else
 exit 1 # wrong args
fi
##################################################
tac
##################################################
## generated by create-stub2.sh v0.1.2
## on Sat, 21 Dec 2019 15:33:19 +0900
## see <https://github.com/temptemp3/sh2>
##################################################