#!/bin/bash
setupAnsible () {
    sudo pacman -S --needed ansible ansible-core --noconfirm
}

cloneGitRepo () {
    cd /tmp
    git clone https://github.com/fabioalmeida08/arch_playbook
    ansible-playbook /tmp/arch_playbook/local.yml -K
}

runPlaybook () {
  ansible-playbook local.yml -K
}

if [[ ! -f local.yml ]]; then
    setupAnsible
    cloneGitRepo
    runPlaybook
else
    runPlaybook
fi

