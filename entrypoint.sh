#!/bin/dash

install_deps () {
    sudo apt install -y update -y && sudo apt upgrade;  
    sudo apt install -y python3 python3-pip;
    sudo pip3 install ansible
}

main () {
    echo "Installing base dependencies."
    install_deps;
}