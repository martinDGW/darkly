# Reproduction:
Go to the LOGIN page then 'I forgot my password' (/?page=recover)
We observe a Submit button, if we click an error message appears:
'Sorry Wrong Answer'

By observing the HTML code, we can see a clear link in the form on the button component:
```html
<form action="#" method="POST">
    <input type="hidden" name="mail" value="webmaster@borntosec.com" maxlength="15">
    <input type="submit" name="Submit" value="Submit">
</form>
```

Modify the address and click again to display the flag: `1d4855f7337c0c14b6f44946872c4eb33853f40b2d54393fbe94f49f1e19bbb0`

# Problem:
This is a disclosure of sensitive information, which hackers could exploit for malicious attacks or even send emails with identity theft, etc.

# Solution:
All sensitive information should not be in clear text on the front end but handled directly in the backend, which itself should have its services deployed with environment variables.