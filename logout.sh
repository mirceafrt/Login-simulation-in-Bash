#!/bin/bash
if  [[ -f fisier.csv ]]; then
    echo "Login: "
fi
USERS_FILE="fisier.csv"
ok=0
logged_in_users=()

if [ -f logged_in_users.sh ]
then
    mapfile -t logged_in_users < logged_in_users.sh
fi

while true
do
    read -p "Introduceti email-ul: " email
    regex="^[a-z0-9!#\$%&'*+/=?^_\`{|}~-]+(\.[a-z0-9!#$%&'*+/=?^_\`{|}~-]+)*@([a-z0-9]([a-z0-9-]*[a-z0-9])?\.)+[a-z0-9]([a-z0-9-]*[a-z0-9])?\$"
    if [[ $email =~ $regex ]]
  then
          if grep -q "$email" fisier.csv
          then
                echo "Email valid"
      ok=1
      break
          else
                read -p "Email nu a fost gasit. Apasati tasta 1 pentru reintroducere sau orice alta tasta pentru anulare: " alegere
                if [[ $alegere -ne 1 ]]
          then
                    exit
                fi
          fi
      else
          read -p "Format invalid. Apasati tasta 1 pentru reintroducere sau orice alta tasta pentru anulare: " alegere
          if [[ $alegere -ne 1 ]]
          then
                exit
          fi
      fi
done

while true
do
  read -p "Introduceti parola: " parola
  if [[ ok -eq 1 ]]
  then
     if grep -q "$email,$parola" fisier.csv
    then
      for i in "${logged_in_users[@]}"
      do
        if [[ "$i" == "$email" ]]
        then
          echo "Cineva este deja logat in cont"
          exit
        fi
      done
      logged_in_users+=("$email")
      echo "Te-ai logat cu succes"

      printf "%s\n" "${logged_in_users[@]}" > logged_in_users.sh

     now=$(date +"%d-%m-%Y %H:%M:%S")
  awk -F',' -v search="$email" -v now="$now" 'BEGIN { OFS = FS } $3 == search { $6=now } 1' "$USERS_FILE" > temp.csv && mv temp.csv $USERS_FILE

  #source navi.sh
  cd /home/stud1018/mirceaF/userspace/$email
  #user_dir="/home/stud1018/mirceaF/userspace/""$email"""
  #cd "$user_dir"
  #cd ./userspace/$email

      break
    else
      read -p "Parola gresita. Apasati tasta 1 pentru reintroducere sau orice alta tasta pentru anulare: " alegere
                        if [[ $alegere -ne 1 ]]
                        then
                                exit
                        fi
    fi
  fi
done

exit
