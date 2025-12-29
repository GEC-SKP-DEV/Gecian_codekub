#!/bin/bash

ascii_art='
   ______          __            ______                               
  / ____/___  ____/ /___  _____/ ____/___  ____ ___  ____  ____ ______
 / /   / __ \/ __  / __ \/ ___/ /   / __ \/ __ `__ \/ __ \/ __ `/ ___/
/ /___/ /_/ / /_/ / /_/ / /  / /___/ /_/ / / / / / / /_/ / /_/ (__  ) 
\____/\____/\__,_/\____/_/   \____/\____/_/ /_/ /_/ .___/\__,_/____/  
                                                   /_/                
                     c o d e   k u b
'


# Define the color gradient (shades of cyan and blue)
colors=(
	'\033[38;5;81m' # Cyan
	'\033[38;5;75m' # Light Blue
	'\033[38;5;69m' # Sky Blue
	'\033[38;5;63m' # Dodger Blue
	'\033[38;5;57m' # Deep Sky Blue
	'\033[38;5;51m' # Cornflower Blue
	'\033[38;5;45m' # Royal Blue
)

# Split the ASCII art into lines
IFS=$'\n' read -rd '' -a lines <<<"$ascii_art"

# Print each line with the corresponding color
for i in "${!lines[@]}"; do
	color_index=$((i % ${#colors[@]}))
	echo -e "${colors[color_index]}${lines[i]}"
done
