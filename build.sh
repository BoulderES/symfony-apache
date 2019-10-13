#!/bin/bash -e

DIR="/var/www/html/"
# init
# look for empty dir
if [ "$(ls -A $DIR)" ]; then
     echo "Take action $DIR is not Empty"
else
    echo "$DIR is Empty"
    cp -r /app/project/. /var/www/html/
fi
