#!/bin/zsh
set -e

# use pipenv shell environment
export PIPENV_IGNORE_VIRTUALENVS=0
pipenv shell
