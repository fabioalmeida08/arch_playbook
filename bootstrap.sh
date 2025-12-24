#!/bin/bash
check_requirements () {
    if ! command -v ansible &> /dev/null
    then
        sudo pacman -S --needed ansible ansible-core --noconfirm
    fi

    if ! command -v git &> /dev/null
    then
        sudo pacman -S --needed git --noconfirm
    fi

    if ! command -v fakeroot &> /dev/null
    then
        sudo pacman -S --needed fakeroot --noconfirm
    fi
    
}

run_playbook () {
    sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
    cd "$( dirname "$0" )"
    time ansible-playbook local.yml -K
}
sudo pacman -Syu
check_requirements
run_playbook

