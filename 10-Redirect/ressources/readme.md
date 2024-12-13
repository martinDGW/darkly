# Reproduction:
In the html code we can see
`<a href="index.php?page=redirect&amp;site=instagram" class="icon fa-instagram"></a>`
change "instagram" by another value

The flag appears:
`b9e775a0291fed784a2d9680fcfad7edd6b8cdf87648da647aaf4bba288bcab3`

# Problem:
User could use site attribute to inject code client side.
(reflected xss)
This could allow him to stole sensible informations (session cookies, website datas, ...), redirect user to another website (phishing), modify site content.

# Solution:
- Use a whitelist for allowed sites redirection
- Use specific functions as htmlspecialchars() to disable html interpretation
- Use Content Security Policy (CSP)
- Use <form> tag instead of URL parameters combined with POST method to make the attack more tricky.