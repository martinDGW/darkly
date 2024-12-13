# Reproduction:  
Make a POST request to `http://localhost:8000/index.php?page=survey` with parameters in the body, 'sujet': 2 and 'valeur': 15 (>10), and the page shows us the new flag:  
`03a944b434d5baff05f46c4bede5792551a2595574bcafc9a6e25f67c382ccaa`  

# Problem:  
The application allows the user to submit a 'valeur' greater than the defined limit of 10, as there is no server-side validation to check the submitted value. This exposes the application to simple parameter manipulation via an HTTP request, enabling an attacker to bypass restrictions and access unauthorized data.

# Solution:  
Implement server-side validation to ensure that the 'valeur' is between 0 and 10.  
Never rely solely on client-side checks, as they can be manipulated and bypassed, undermining business logic rules.