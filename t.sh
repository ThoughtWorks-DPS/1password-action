#!/usr/bin/env bash
set -eo pipefail

MY=""

if [[ "$MY" == "" ]]; then
   echo "blank as expected"
else
   echo "not blank"
fi