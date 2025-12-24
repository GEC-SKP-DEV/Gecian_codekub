#!/bin/bash

find ~/.local/share/omakub/applications -type f -name "*.sh" | while read -r script; do
  source "$script"
done
