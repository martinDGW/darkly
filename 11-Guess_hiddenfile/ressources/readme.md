# Reproduction:
Check /robots.txt URI
See that .hidden is mask for browser register
Run the script to iterate in arborescence 

Flag: `d5eec3ec36cf80dce44a896f961c1831a05526ec215693c8f2c39543497d4466`

# Problem:
That file could contain source code, database, confidential informations.
You don't have to push any file you want to hide from internet.

# Solution:
- Removing sensitives or unnecessary files
- Protecting Files from Public Access:
    place these files outside of the web server's document root directory. This prevents direct access via HTTP requests.
    Using the .htaccess File
        The .htaccess file is a configuration file used by the Apache web server to control various aspects of website behavior, including access control.