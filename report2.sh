#!/bin/bash

generate_user_report() {
email=$1
cd ./userspace/$email
tree | tail -n 1 > /home/stud1018/mirceaF/userspace/$email/raport.txt
echo -n "Dimensiunea utilizatorului: " >> /home/stud1018/mirceaF/userspace/$email/raport.txt
du -sh | sed 's/  .//' >> /home/stud1018/mirceaF/userspace/$email/raport.txt
}

read -p "Introduceti numele de utilizator(email): " email
generate_user_report "$email"
