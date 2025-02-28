#!/bin/bash
while IFS=',' read -r ID nume prenume email parola tara
  do
    echo $ID
    echo $nume
    echo $email
    echo $parola
    echo $tara
    echo $last_login
    echo -------------------
  done < <(tail -n +2 fisier.csv)
