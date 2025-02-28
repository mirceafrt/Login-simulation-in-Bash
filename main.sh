#!/bin/bash

while true; do


echo "Meniu:"
echo "  1. Inregistrare utilizatori noi"
echo "  2. Log in"
echo "  3. Log out"
echo "  4. Lista utilizatori autentificati"
echo "  5. Generare raport"
echo "  6. Afisare registru"
echo "  0. Iesire"

read -p "Alege o optiune: " OPTIUNE

case $OPTIUNE in
  1)
  /bin/bash ./inregistrare.sh
  echo;
  ;;

  2)
  /bin/bash ./login.sh
  echo;
  ;;

  3)
  /bin/bash ./logout.sh
  echo;
  ;;

  4)
  cat ./logged_in_users.sh
  echo;
  ;;

  5)
  /bin/bash ./report2.sh
  echo;
  ;;

  6)
  /bin/bash ./script.sh
  echo;
 ;;
  0)
  echo;
  echo "Scriptul s-a oprit."
  echo;
  break;;

  *)
    echo
    echo "Optiunea introdusa nu exista."
    echo "Incearca din nou!"
    echo
    break;;
  esac

done
