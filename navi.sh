#!/bin/bash

# Citește numele directorului de la utilizator
read -p "Introduceți numele directorului: " nume_director

# Verifică dacă directorul există
if [ -d "userspace/$nume_director" ]; then
  # Schimbă directorul în cel specificat
  cd "userspace/$nume_director"
  echo "S-a schimbat directorul în: userspace/$nume_director"
else
  # Directorul nu există
  echo "Directorul userspace/$nume_director nu a fost găsit."
fi
pwd
