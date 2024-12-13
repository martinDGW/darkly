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