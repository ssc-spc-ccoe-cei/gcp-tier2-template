#!/bin/bash

### This script should be run after this repo is cloned, or whenever you wish to update the
### submodules used in this repo

# Bash safeties: exit on error, pipelines can't hide errors
set -eo pipefail

git submodule update --init --recursive
git submodule update --init --recursive --remote

# loop through each submodule and checkout versions defined in modversions.yaml
# https://git-scm.com/docs/git-submodule#Documentation/git-submodule.txt-foreach--recursiveltcommandgt
# $name is the name of the relevant submodule section in .gitmodules
# $toplevel is the absolute path to the top-level of the immediate superproject
# '"'"' adds a single quote inside a single quote string

git submodule foreach 'git checkout $(grep "^$name:" "$toplevel/modversions.yaml" | awk '"'"'{ print $2 }'"'"')'
