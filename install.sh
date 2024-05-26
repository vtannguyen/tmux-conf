#!/bin/bash

mkdir -p ~/.tmux/plugins

if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

mv .tmux.conf ~/.tmux.conf

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CommitMono.zip
unzip -n CommitMono.zip -d ~/.local/share/fonts
rm CommitMono.zip
