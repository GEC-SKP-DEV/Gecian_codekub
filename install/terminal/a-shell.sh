#!/bin/bash

# ---- Logging helper ----
log() {
    echo "[OMAKUB] $1"
}

log "Starting Omakub shell setup..."

# ---- Configure .bashrc ----
if [ -f ~/.local/share/omakub/configs/bashrc ]; then
    cp ~/.local/share/omakub/configs/bashrc ~/.bashrc
    log "Configured ~/.bashrc from Omakub defaults"
else
    log "Warning: ~/.local/share/omakub/configs/bashrc not found!"
fi

# ---- Load PATH for later use ----
if [ -f ~/.local/share/omakub/defaults/bash/shell ]; then
    source ~/.local/share/omakub/defaults/bash/shell
    log "Loaded Omakub default bash shell"
else
    log "Warning: ~/.local/share/omakub/defaults/bash/shell not found!"
fi

# ---- Configure .inputrc ----
if [ -f ~/.local/share/omakub/configs/inputrc ]; then
    cp ~/.local/share/omakub/configs/inputrc ~/.inputrc
    log "Configured ~/.inputrc from Omakub defaults"
else
    log "Warning: ~/.local/share/omakub/configs/inputrc not found!"
fi

log "Omakub shell setup finished."
