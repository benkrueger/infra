#!/bin/dash

install_deps () {
    sudo apt install -y update -y && sudo apt upgrade;  
    sudo apt install -y python3 python3-pip;
    sudo pip3 install ansible
}

main () {
    echo "Installing base dependencies."
    install_deps;
    sudo ansible-playbook playbooks/tasks/install_desktop.yml
    sudo ansible-playbook playbooks/tasks/install_sectools.yml
    sudo ansible-playbook playbooks/tasks/create_users.yml
    sudo ansible=playbook playbooks/tasks/persist_crons.yml
}
main;
