#!/usr/bin/env bash

source .env
source venv/bin/activate
python3 src/wsgi.py $1 $2
