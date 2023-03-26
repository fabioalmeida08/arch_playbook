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
        sudo pacman -S --needed ansible ansible-core --noconfirm
    fi
    
}

run_playbook () {
    cd "$( dirname "$0" )"
    ansible-playbook local.yml -K
}

check_requirements
run_playbook

