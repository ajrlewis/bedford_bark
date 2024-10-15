#! /usr/bin/env bash

help() {
   echo "Install script."
   echo ""
   echo "Syntax: install.sh [-d|h]"
   echo "options:"
   echo "d     Enable development mode."
   echo "h     Print this help."
   echo ""
}

environment="prod";

while getopts ":dht:" option; do
    case $option in
        d) # set development mode
            environment="dev";;
        h) # display help
            help;
            exit;;
        \?) # Invalid option
            echo "Error: Invalid option"
            exit;;
   esac
done

if [[ $environment == "dev" ]]; then
    if [ ! -d venv ]; then python3.9 -m venv venv; fi;
    source venv/bin/activate;
    source .env;
fi

# echo "Checking if public directory exists"
# if [ ! -d public ]; then 
#     mkdir public;
#     touch public/public.txt;
# fi;

# Install dependencies
pip install --upgrade pip;
pip install -r requirements.txt;

# # Run migrations
# bash scripts/migrate.sh init;
# bash scripts/migrate.sh "";
