# reproduction :
Faire une requete POST sur `http://localhost:8000/index.php?page=survey` avec des params en body , 'sujet' : 2 et 'valeur' : 15 (>10), la page nous montre le nouveau flag :
'03a944b434d5baff05f46c4bede5792551a2595574bcafc9a6e25f67c382ccaa'


# Problème :  
L'application permet à l'utilisateur de soumettre une valeur de 'valeur' supérieure à la limite définie de 10, car il n'y a pas de validation côté serveur pour vérifier la valeur soumise. Cela expose l'application à une manipulation simple de paramètres via une requête HTTP, ce qui permet à un attaquant de contourner les restrictions et d'accéder à des données non autorisées.

# Solution
Implémenter une validation côté serveur pour vérifier que la valeur de 'valeur' est bien comprise entre 0 et 10.
Ne jamais se fier uniquement aux contrôles côté client, car ils peuvent être manipulés et outre passé les règles de la logique métier.

------------------------------
------------------------------
------------------------------

# Reproduction:  
Make a POST request to `http://localhost:8000/index.php?page=survey` with parameters in the body, 'sujet': 2 and 'valeur': 15 (>10), and the page shows us the new flag:  
'03a944b434d5baff05f46c4bede5792551a2595574bcafc9a6e25f67c382ccaa'  

# Problem:  
The application allows the user to submit a 'valeur' greater than the defined limit of 10, as there is no server-side validation to check the submitted value. This exposes the application to simple parameter manipulation via an HTTP request, enabling an attacker to bypass restrictions and access unauthorized data.

# Solution:  
Implement server-side validation to ensure that the 'valeur' is between 0 and 10.  
Never rely solely on client-side checks, as they can be manipulated and bypassed, undermining business logic rules.