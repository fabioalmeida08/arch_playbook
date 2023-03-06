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
    cd "$( dirname "$0" )"
    ansible-playbook local.yml -K
}

if [[ -e "$( dirname "$0" )/local.yml" ]]; then
    runPlaybook
else
    setupAnsible
    cloneGitRepo
    runPlaybook
fi

