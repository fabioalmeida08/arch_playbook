#!/bin/bash
cd $HOME

git clone https://github.com/fabioalmeida08/arch_playbook

sudo pacman -Syu ansible ansible-core --noconfirm

ansible-playbook $HOME/arch_playbook/local.yml -K
