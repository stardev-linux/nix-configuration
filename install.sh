#!/usr/bin/env bash

# Set up distroboxes before running this!
# ubuntu image: quay.io/toolbx/ubuntu-toolbox

# fedora image: quay.io/fedora/fedora-toolbox
distrobox enter fedora -- bash -c "
    sudo dnf upgrade -y \
    sudo dnf install rpm-build -y \
    curl -sS https://starship.rs/install.sh | sh \
    exit 0"
# enable starship on NixOS and all distroboxes
wget -O ~/.bash_profile https://raw.githubusercontent.com/stardev-linux/nix-configuration/main/bash_profile
wget -O ~/.bashrc https://raw.githubusercontent.com/stardev-linux/nix-configuration/main/bashrc

# change to unstable channel
sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixos
sudo nix-channel --update

# photogimp setup
wget https://github.com/Diolinux/PhotoGIMP/releases/download/3.0/PhotoGIMP-linux.zip
unzip PhotoGIMP-linux.zip
cd PhotoGIMP/.config
rsync -a --remove-source-files GIMP/ ~/.config/GIMP/
cd ../../
rm -r PhotoGIMP

echo "All tasks complete!"
sleep 2
exit 0
