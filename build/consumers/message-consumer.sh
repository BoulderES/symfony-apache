#!/bin/bash
sleep 10;
/var/www/html/bin/console messenger:consume async -vv;
# /var/www/html/bin/console debug:messenger