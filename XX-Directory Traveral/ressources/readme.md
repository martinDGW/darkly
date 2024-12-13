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