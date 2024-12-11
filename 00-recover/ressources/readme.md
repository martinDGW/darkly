# Reproduction :
Se rendre sur la page LOGIN puis 'I forgot my password' (/?page=recover) 
On observe un bouton Submit, si on clique un message d'erreur apparaît :
'Sorry Wrong Answer'

En observant le code HTML, on peut observer sur le composant button un lien en clair dans le formulaire :
```html
<form action="#" method="POST">
    <input type="hidden" name="mail" value="webmaster@borntosec.com" maxlength="15">
    <input type="submit" name="Submit" value="Submit">
</form>
```

Modifier l'adresse et recliquer nous affichera le flag :
`1d4855f7337c0c14b6f44946872c4eb33853f40b2d54393fbe94f49f1e19bbb0`

# Problème :
C'est une divulgation d'information sensible, des pirates pourraient l'exploiter pour des attaques malveillantes voire envoyer des emails avec usurpation d'identité, etc.

# Solution :
Toute information sensible ne devrait pas être en clair côté front mais manipulée directement dans le backend, qui lui-même devrait avoir un déploiement de ses services avec des variables d'environnement.

-----------------------------------
-----------------------------------
-----------------------------------
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