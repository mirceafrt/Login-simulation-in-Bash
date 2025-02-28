#!/bin/bash
if [ -f fisier.csv ]
then
  echo "Vom adauga o noua inregistrare in fisierul fisier.csv"
  #linii=$(wc -l < fisier.csv)
  nonEmptyLines=$(sed -n '/./p' < fisier.csv | wc -l)
  #ID=$((linii+1))
  ID=$((nonEmptyLines+1))

while true
  do
    read -p "Introduceti numele si prenumele cu un spatiu intre ele: " nume
    regex="^([a-zA-Z]{2,}\s[a-zA-Z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)"
    #numele si prenumele trebuie sa contina cel putin 3 litere si nu alte caractere speciale cu un spatiu intre ele
    if [[ $nume =~ $regex ]]
    then
      break
    else
      read -p "Nume introdus gresit. Apasati 1 pentru reintroducere sau orice alta tasta pentru anularea operatiei" alegere
      if [[ $alegere -ne 1 ]]
      then
        exit
      fi
    fi
  done

  while true
  do
    read -p "Introduceti email-ul: " email
    regex="^[a-z0-9!#\$%&'*+/=?^_\`{|}~-]+(\.[a-z0-9!#$%&'*+/=?^_\`{|}~-]+)*@([a-z0-9]([a-z0-9-]*[a-z0-9])?\.)+[a-z0-9]([a-z0-9-]*[a-z0-9])?\$"
    #regex pentru validare email
    if grep -q "$email" fisier.csv
    then
      read -p "Email-ul exista deja. Apasati 1 pentru reintroducere sau orice alta tasta pentru anularea operatiei" alegere
      if [[ $alegere -ne 1 ]]
                        then
                                exit
                        fi
    else
      if [[ $email =~ $regex ]]
                  then
                          break
                  else
                          read -p "Email introdus gresit. Apasati 1 pentru reintroducere sau orice alta tasta pentru anularea operatiei" alegere
                          if [[ $alegere -ne 1 ]]
                           then
                                  exit
                          fi
                  fi
    fi
  done

  while true
  do
    read -p "Introduceti parola: " parola
    regex="^[a-zA-Z0-9]{8,}$"
    #parola trebuie sa contina intre 8 si 16 caractere: cel putin o literea mica si o litera mare, cel putin o cifra si cel putin un caracter special
    if [[ $parola =~ $regex ]]
    then
      break
    else
      read -p "Parola introdusa gresit. Apasati 1 pentru reintroducere sau orice alta tasta pentru anularea operatiei" alegere
      if [[ $alegere -ne 1 ]]
      then
        exit
      fi
    fi
  done

  while true
  do
    read -p "Introduceti tara: " tara
    regex="^(RO|BG|ENG|CHN|USA|RUS|BR|TRK|JP|FR|GRM|ESP|ARG)"
    #tara trebuie introdusa conform uneia dintre prescurtari
    if [[ $tara =~ $regex ]]
    then
      break
    else
      read -p "Tara intrdousa gresit. Apasati 1 pentru reintroducere sau orice alta tasta pentru anularea operatiei" alegere
      if [[ $alegere -ne 1 ]]
      then
                                exit
                        fi
                fi
        done



  echo >> fisier.csv
      echo -n "$ID,$nume,$email,$parola,$tara" >> fisier.csv
  base_dir="./userspace"
  mkdir -p "$base_dir"
  chmod 755 "$base_dir"

  user_dir="$base_dir/$email"
  mkdir -p "$user_dir"
else
  echo "Fisierul cu date nu existra!"
fi

exit
