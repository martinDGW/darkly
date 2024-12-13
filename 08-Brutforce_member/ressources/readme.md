# Reproduction :  
Nous allons ici utiliser la brute force attaque :  
Nous avons téléchargé un dictionnaire des mots de passe les plus utilisés puis fait tourner un script pour tenter toutes les combinaisons sur le login disponible page 
/?`page=signin`. 

Par convention/habitude, nous testons les plus répandus pour un compte admin comme 'admin' / 'administrator'...  
Avec admin, nous trouvons une correspondance avec le mot de passe 'shadow'.  

Se connecter avec (`http://localhost:<PORT>/index.php?page=signin&username=admin&password=shadow&Login=Login#`) nous donne un nouveau flag :  
'b3a6e43ddf8b4bbb4125e5e7d23040433827759d4de1c04ea63907479a80a6b2'  

# Problème :  
Le mot de passe utilisé est trop faible et utilise un mot courant anglais. De plus, le username pour admin pourrait être plus complexe.  

# Solution :  
Utiliser un générateur de mot de passe et un username admin personnalisé (ex : 'admin7624') pour rendre robuste le login admin et non sensible avec une simple attaque brute force aléatoire ou via dictionnaire. À titre d'exemple, en 2024, il faut moins d'une seconde pour craquer un mot de passe composé uniquement d'un mot courant, 2 mois pour 8 caractères alphabétiques avec minuscules et majuscules, 200 ans s'il contient deux symboles spéciaux comme ? et ! parsemés dans le mot de passe. 
(Estimation du temps pour hacker un mot de passe : https://www.passwordmonster.com/)

-----------------------------------
-----------------------------------
-----------------------------------

# Reproduction:  
We will use a brute force attack here:  
We downloaded a dictionary of the most commonly used passwords and ran a script to try all combinations on the login page available at `/?page=signin`.  

By convention/habit, we test the most common passwords for an admin account such as 'admin' / 'administrator'...  
With 'admin', we find a match with the password 'shadow'.  

Logging in with (`http://localhost:<PORT>/index.php?page=signin&username=admin&password=shadow&Login=Login#`) gives us a new flag:  
'b3a6e43ddf8b4bbb4125e5e7d23040433827759d4de1c04ea63907479a80a6b2'  

# Problem:  
The password used is too weak and uses a common English word. Additionally, the username for admin could be more complex.  

# Solution:  
Use a password generator and a custom admin username (e.g., 'admin7624') to make the admin login robust and not vulnerable to a simple random brute force attack or dictionary attack. For example, in 2024, it takes less than a second to crack a password composed solely of a common word, 2 months for 8 alphabetical characters with lowercase and uppercase letters, and 200 years if it contains two special symbols like ? and ! scattered within the password. (Estimated time to hack a password: https://www.passwordmonster.com/)