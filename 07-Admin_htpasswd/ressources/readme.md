# Reproduction:
Check /robots.txt URI
See that /whatever is mask for browser register
Go to /whatever and get htpasswd
Decode md5 password
Go to /admin URI found with site analyser tool
log

Flag: `d19b4823e0d5600ceed56d5e896ef328d7a2b9e7ac7e80f4fcdb9b10bcb3e7ff`

# Problem:
Allow user to recover admin access

# Solution:
Configure the web server to disable directory browsing.

Deploy a minimal platform wihout unnecessary files.
A segmented application architecture that proviedes secure separation between components. Ex: Containerization