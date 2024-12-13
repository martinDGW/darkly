# Reproduction:
Click on 'BornToSec' link
Look at html code page
See commented code.
Deduct that you have to modify user agent + referer request.
Use postman to request

flag: `f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188`

# Problem:
Allow users to pass restrictions or get server config informations based on header modifications
Can be an attacker preparation for more complex attacks.

# Solution:
- Don't let commented code in frontend html.
- Don't trust referer or user-agent headers to allow action cause it can easily be modified.
- Validate user data server side even if it comes from headers
- Use whitelist for referers
- Combine IP address + headers to detect unusual usages
- Use CSRF token (for user identification)