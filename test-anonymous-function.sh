#!/bin/bash
## test-anonymous-function
## version 0.0.1 - initial
##################################################
anonymous() {
  _() {
    true
  }
}
test-anonymous-function() {
  _() { { anonymous ; }
    echo anonymous functions are:
    echo - may be nested
    echo - short
    echo - may use positional parameters
    echo - may be once
  }
  _
  _
}
##################################################
if [ ${#} -eq 0 ] 
then
 true
else
 exit 1 # wrong args
fi
##################################################
test-anonymous-function
##################################################
## generated by create-stub2.sh v0.1.2
## on Sun, 07 Jul 2019 11:32:14 +0900
## see <https://github.com/temptemp3/sh2>
##################################################
