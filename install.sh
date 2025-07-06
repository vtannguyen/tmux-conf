#!/bin/bash

mkdir -p ~/.tmux/plugins

if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

mv .tmux.conf ~/.tmux.conf

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CommitMono.zip
unzip -n CommitMono.zip -d ~/.local/share/fonts
rm CommitMono.zip

# Install activitywatch
wget https://github.com/ActivityWatch/activitywatch/releases/download/v0.13.2/activitywatch-v0.13.2-linux-x86_64.zip
unzip activitywatch-v0.13.2-linux-x86_64.zip -d ~/.local/share
ln -s ~/.local/share/activitywatch/aw-qt ~/.local/bin/aw-qt
mkdir -p ~/.config/systemd/user

cat <<EOF > "$HOME/.config/systemd/user/activitywatch.service"
[Unit]
Description=Autostart user service for activitywatch
After=default.target

[Service]
Type=simple
ExecStartPre=/bin/sleep 20
ExecStart=$HOME/.local/bin/aw-qt
Restart=on-failure

[Install]
WantedBy=default.target
EOF

systemctl --user daemon-reload
systemctl --user enable --now "activitywatch.service"
