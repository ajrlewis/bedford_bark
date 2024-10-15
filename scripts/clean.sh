#!/usr/bin/env bash

rm -rf venv
rm -rf public
find . -type d -name "__pycache__" -exec rm -rf {} +
