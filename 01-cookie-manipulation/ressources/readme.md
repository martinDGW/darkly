# Reproduction :  

Sur la page home, allez dans l'inspecteur du navigateur et observez le contenu du cookie et la clé :  
```sh
'I_am_admin' : '68934a3e9455fa72420237eb05902327'
```  
Un outil Cipher Identifier nous indique que la valeur est sûrement encodée en MD5, nous tentons donc un décryptage et observons que la valeur est égale à 'false'.  
Nous décidons d'essayer d'encoder une nouvelle valeur 'true' (= 'b326b5062b2f0e69046810717534cb09') et de l'insérer dans le cookie. Nous rechargeons la page et obtenons le flag dans un pop-up 'alert' :  
`df2eb4ba34ed059a1e3e89ff4dfc13445f104a1a52295214def1c4fb1693a5c3`  

# Problème :  
Confiance excessive côté client avec une méthode de hachage faible et réversible, permettant de prendre le rôle admin trop facilement.  

# Solution :  
Il faut éviter de stocker des droits d'accès côté client, ou utiliser un système plus robuste, comme par exemple des tokens JWT avec une signature sécurisée.  
Utiliser un cookie HTTP-Only (inaccessible en JavaScript) contenant uniquement un identifiant de session ou un token.


----------------------------
----------------------------
----------------------------

# Reproduction:

On the home page, go to the browser inspector and observe the cookie content and the key:  
```sh
'I_am_admin' : '68934a3e9455fa72420237eb05902327'
```  
A Cipher Identifier tool indicates that the value is likely encoded in MD5, so we attempt to decrypt it and find that the value equals 'false'.  
We then decide to try encoding a new value 'true' (= 'b326b5062b2f0e69046810717534cb09') and insert it into the cookie. We refresh the page and receive the flag in a pop-up 'alert':  
`df2eb4ba34ed059a1e3e89ff4dfc13445f104a1a52295214def1c4fb1693a5c3`  

# Problem:  
Excessive trust on the client-side with a weak and reversible hashing method, allowing for easy assumption of the admin role.  

# Solution:  
Avoid storing access rights on the client-side, or use a more robust system, such as JWT tokens with a secure signature.  
Utilize an HTTP-Only cookie (inaccessible via JavaScript) containing only a session identifier or a token.