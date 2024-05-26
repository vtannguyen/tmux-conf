#!/bin/bash

mkdir -p ~/.tmux/plugins

if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

mv .tmux.conf ~/.tmux.conf
