# Reproduction:
Go to the page http://127.0.0.1:8000/?page=feedback

One of the basic vulnerabilities consists of injecting HTML code into a text field.
Looking at the page’s code, we see a rather simple string check (checking for the existence of the string), not a sanitization of the character string.

We then test by commenting out <script>alert(1)</script>

And the flag appears:
`0fbb54bbf7d099713ca4be297e1bc7da0173d8b3c21c1811b916a3a86652724e`

# Problem:
A malicious user can inject a "script" tag containing JavaScript code that will execute in the user's browser. This code can do anything from displaying unwanted alerts to stealing sensitive data.

# Solution:
- Never trust user input
- Sanitize the string by removing special HTML characters (<, >, ', ", &, etc.)
- Use a WYSIWYG (What You See Is What You Get) editor
- Use a security framework:
    Frameworks like OWASP ESAPI provide tools and best practices to secure web applications.