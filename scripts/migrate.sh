#!/usr/bin/env bash

export PYTHONPATH="${PTHONPATH}:src/"

init() {
  if [ ! -d  migrations ]; then
    echo ">>> Creating migrations directory ..."
    flask db init;
  else
    echo ">>> Migrations directory already exists!"
  fi
}

history() {
  flask db history;
}

downgrade() {
  flask db downgrade;
}

migrate_and_upgrade() {
  echo flask db migrate -m \""${1}"\"
  flask db migrate -m \""${1}"\"
  echo flask db upgrade
  flask db upgrade
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  # Activate the virtual environment if present
  if [ -d venv ]; then
    source venv/bin/activate;
  fi

  cd src/;

  # Run
  if [[ "$1" == "init" ]]; then
    echo ">>> Initiating migrations ..."
    init
  else
    echo ">>> Performing migration ..."
    migrate_and_upgrade "${1}"
  fi
fi