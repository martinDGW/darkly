# Reproduction :

En manipulant le paramètre `page` de l'URL, nous avons exploité une faille de **Directory Traversal** pour accéder à des fichiers sensibles du serveur.

1. **Tester la navigation dans les dossiers** :  
   Nous avons modifié le paramètre `page` dans l'URL pour inclure une séquence de navigation vers les répertoires parents :  
   ```http
   http://127.0.0.1:8000/?page=../../../../../../../etc/passwd
   ```

2. **Résultat obtenu** :  
   Nous obtenons un nouveau flag dans une popup alert :
   `Congratulaton!! The flag is : b12c4b2cb8094750ae121a676269aa9e2872d07c06e429d25a63196ec1c8c1d0`


---

# Problème :

Cette faille est due à une **validation insuffisante des entrées utilisateur** influençant les chemins de fichiers. Le serveur accepte directement les chemins relatifs fournis par le paramètre `page`, permettant de naviguer librement dans la structure des dossiers et de lire des fichiers non autorisés.

---

# Solution :

1. **Valider et nettoyer les entrées utilisateur** :  
   Limiter les valeurs acceptées pour le paramètre `page` en utilisant une liste blanche (exemple : seuls les noms de fichiers autorisés).  

   ```php
   $allowedPages = ['home', 'about', 'contact'];
   if (!in_array($_GET['page'], $allowedPages)) {
       die('Page non autorisée.');
   }
   ```

2. **Éviter l'accès direct aux fichiers via des paramètres utilisateur** :  
   Utiliser des chemins contrôlés côté serveur et ne jamais concaténer directement des entrées utilisateur avec les chemins du système de fichiers.  

3. **Utiliser des méthodes sécurisées pour le chargement des fichiers** :  
   Par exemple, en PHP :  
   ```php
   include __DIR__ . '/pages/' . basename($_GET['page']) . '.php';
   ```

4. **Restreindre les permissions serveur** :  
   Limiter les droits d'accès aux fichiers système sensibles pour l'utilisateur exécutant le serveur.

---

Avec ces protections, nous évitons les attaques par **Directory Traversal** et limitons l'exposition des fichiers système ou privés.

-----------------------
-----------------------
-----------------------
-----------------------

# Reproduction:

By manipulating the `page` parameter of the URL, we exploited a **Directory Traversal** vulnerability to access sensitive files on the server.

1. **Testing directory navigation**:  
   We modified the `page` parameter in the URL to include a traversal sequence to the parent directories:  
   ```http
   http://127.0.0.1:8000/?page=../../../../../../../etc/passwd
   ```

2. **Result obtained**:  
   We receive a new flag in a popup alert:  
   `Congratulaton!! The flag is : b12c4b2cb8094750ae121a676269aa9e2872d07c06e429d25a63196ec1c8c1d0`

---

# Problem:

This vulnerability is due to **insufficient validation of user inputs** influencing file paths. The server directly accepts relative paths provided by the `page` parameter, allowing unrestricted navigation through the directory structure and reading unauthorized files.

---

# Solution:

1. **Validate and sanitize user inputs**:  
   Limit accepted values for the `page` parameter using a whitelist (e.g., only authorized file names).  

   ```php
   $allowedPages = ['home', 'about', 'contact'];
   if (!in_array($_GET['page'], $allowedPages)) {
       die('Unauthorized page.');
   }
   ```

2. **Avoid direct access to files via user parameters**:  
   Use controlled server-side paths and never concatenate user inputs directly with filesystem paths.  

3. **Use secure methods for loading files**:  
   For example, in PHP:  
   ```php
   include __DIR__ . '/pages/' . basename($_GET['page']) . '.php';
   ```

4. **Restrict server permissions**:  
   Limit access rights to sensitive system files for the user running the server.

---

With these protections, we prevent **Directory Traversal** attacks and limit exposure to system or private files.