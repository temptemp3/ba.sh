#!/bin/bash
## jackblck17
## version 0.0.1 - initial
##################################################
deck() { # standard 52 card deck
  echo {A,2,3,4,5,6,7,8,9,10,J,Q,K}-{club,diamond,heart,spade}
}
banner() {
  cat << EOF
                                                                                                                                                         
                                                      bbbbbbbb                                                                                           
             jjjj                                     b::::::b            lllllll                     kkkkkkkk             1111111   77777777777777777777
            j::::j                                    b::::::b            l:::::l                     k::::::k            1::::::1   7::::::::::::::::::7
             jjjj                                     b::::::b            l:::::l                     k::::::k           1:::::::1   7::::::::::::::::::7
                                                       b:::::b            l:::::l                     k::::::k           111:::::1   777777777777:::::::7
           jjjjjjj  aaaaaaaaaaaaa      ccccccccccccccccb:::::bbbbbbbbb     l::::l     cccccccccccccccc k:::::k    kkkkkkk   1::::1              7::::::7 
           j:::::j  a::::::::::::a   cc:::::::::::::::cb::::::::::::::bb   l::::l   cc:::::::::::::::c k:::::k   k:::::k    1::::1             7::::::7  
            j::::j  aaaaaaaaa:::::a c:::::::::::::::::cb::::::::::::::::b  l::::l  c:::::::::::::::::c k:::::k  k:::::k     1::::1            7::::::7   
            j::::j           a::::ac:::::::cccccc:::::cb:::::bbbbb:::::::b l::::l c:::::::cccccc:::::c k:::::k k:::::k      1::::l           7::::::7    
            j::::j    aaaaaaa:::::ac::::::c     cccccccb:::::b    b::::::b l::::l c::::::c     ccccccc k::::::k:::::k       1::::l          7::::::7     
            j::::j  aa::::::::::::ac:::::c             b:::::b     b:::::b l::::l c:::::c              k:::::::::::k        1::::l         7::::::7      
            j::::j a::::aaaa::::::ac:::::c             b:::::b     b:::::b l::::l c:::::c              k:::::::::::k        1::::l        7::::::7       
            j::::ja::::a    a:::::ac::::::c     cccccccb:::::b     b:::::b l::::l c::::::c     ccccccc k::::::k:::::k       1::::l       7::::::7        
            j::::ja::::a    a:::::ac:::::::cccccc:::::cb:::::bbbbbb::::::bl::::::lc:::::::cccccc:::::ck::::::k k:::::k   111::::::111   7::::::7         
            j::::ja:::::aaaa::::::a c:::::::::::::::::cb::::::::::::::::b l::::::l c:::::::::::::::::ck::::::k  k:::::k  1::::::::::1  7::::::7          
            j::::j a::::::::::aa:::a cc:::::::::::::::cb:::::::::::::::b  l::::::l  cc:::::::::::::::ck::::::k   k:::::k 1::::::::::1 7::::::7           
            j::::j  aaaaaaaaaa  aaaa   ccccccccccccccccbbbbbbbbbbbbbbbb   llllllll    cccccccccccccccckkkkkkkk    kkkkkkk11111111111177777777            
            j::::j                                                                                                                                       
  jjjj      j::::j                                                                                                                                       
 j::::jj   j:::::j                                                                                                                                       
 j::::::jjj::::::j                                                                                                                                       
  jj::::::::::::j                                                                                                                                        
    jjj::::::jjj                                                                                                                                         
       jjjjjj                                                                                                                                            

EOF
}
score() {
  case ${1} in
  A) echo 0 ;;
  [2-9]|10) echo ${1} ;;
  J|Q|K) echo 10 ;;
  esac
}
score-hand() {
  local card
  local points
  local -i candidate_points
  local -i aces
  aces=0
  for card in ${hand}
  do
   let points+=$( score ${card/-*/} )
   test ! "${card/-*/}" = "A" || {
     let aces+=1
   }
  done
  test ! ${aces} -le 0 || {
    echo ${points}
  }
  while [ ${aces} -gt 0 ]
  do
   for point in ${points}
   do
    new_point=""
    for ace in 1 11
    do
     candidate_points=$(( point + ace ))
     test ! ${candidate_points} -le 21 || {
       echo "${candidate_points}"
       new_points="${new_points} ${candidate_points}"
     }
    done
   done
   let aces-=1
   points="${new_points}"
  done | sort -nur | head -1
}
jackblck17() {
  local deck
  local card
  local -i turn
  local hand
  deck=$( shuf -e $( deck ) )
  banner
  echo -e " Press enter key to continue"
  read
  turn=1
  for card in ${deck}
  do
   test ! ${turn} -gt 2 || {
     echo -e "\nhit or stay? (h) or s "
     read
     test ! "${REPLY}" = "s" || {
       break
     }
   }
  echo -e "\n Your hand: \n"
   hand="${hand} ${card}"
   echo " ${hand}"
   test ! $( score-hand ) -gt 21 || {
     echo -e "\nBust!\n"
     exit
   }
   let turn++
   sleep 1
  done
  echo -e "Dealer's hand: 17\n"
  echo -e "Your hand: $( score-hand )\n"
  test ! $( score-hand ) -gt 17 && {
   echo -e "Dealer wins\n"
  true
  } || {
    echo -e "You win!\n"
  }
}
##################################################
if [ ${#} -eq 0 ] 
then
 true
else
 exit 1 # wrong args
fi
##################################################
jackblck17
##################################################
## generated by create-stub2.sh v0.1.2
## on Sat, 16 Nov 2019 21:47:47 +0900
## see <https://github.com/temptemp3/sh2>
##################################################
