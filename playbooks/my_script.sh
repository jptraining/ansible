#!/bin/bash
ls -ltr / > /tmp/script.txt
echo "Hello ${1}, how are you ?" >> /tmp/script.txt
cat /tmp/script.txt
