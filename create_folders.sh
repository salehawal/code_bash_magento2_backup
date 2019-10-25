#!/bin/bash

if [ ! -d ./db ]; then mkdir -p ./db; else echo 'folder "db" exists'; fi
if [ ! -d ./file ]; then mkdir -p ./file; else echo 'folder "file" exists'; fi