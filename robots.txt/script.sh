#!/bin/bash

base_url="http://127.0.0.1:8000/.hidden/"

wget --recursive --no-parent --execute robots=off $base_url 2>/dev/null

find "./127.0.0.1:8000/.hidden" -type f -exec grep -H "flag" {} \;

rm -rf "./127.0.0.1:8000"