# Reproduction:  
We will use a brute force attack here:  
We downloaded a dictionary of the most commonly used passwords and ran a script to try all combinations on the login page available at `/?page=signin`.  

By convention/habit, we test the most common passwords for an admin account such as 'admin' / 'administrator'...  
With 'admin', we find a match with the password 'shadow'.  

Logging in with (`http://localhost:<PORT>/index.php?page=signin&username=admin&password=shadow&Login=Login#`) gives us a new flag:  
'b3a6e43ddf8b4bbb4125e5e7d23040433827759d4de1c04ea63907479a80a6b2'  

# Problem:  
The password used is too weak and uses a common English word. Additionally, the username for admin could be more complex.  

# Solution:  
Use a password generator and a custom admin username (e.g., 'admin7624') to make the admin login robust and not vulnerable to a simple random brute force attack or dictionary attack. For example, in 2024, it takes less than a second to crack a password composed solely of a common word, 2 months for 8 alphabetical characters with lowercase and uppercase letters, and 200 years if it contains two special symbols like ? and ! scattered within the password. (Estimated time to hack a password: https://www.passwordmonster.com/)