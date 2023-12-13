#!/bin/bash

set -e

apply() {
    
    # echo $VAULT_PASSWORD | ansible-vault decrypt terraform.tfstate.backup --vault-password-file=/dev/stdin
    # sleep 1

    echo Running Terraform...
    terraform apply -auto-approve

    echo "Waiting for the instances to initialize..."
    sleep 30

    echo Setting up instances...
    ./getstate

    cd ansible
    ansible-playbook setup.yml

    echo Cleaning up...
    rm -f files/.env.local
    rm inventory

    cd ..
    echo $VAULT_PASSWORD | ansible-vault encrypt terraform.tfstate terraform.tfstate.backup --vault-password-file=/dev/stdin
}


read -sp 'Enter Ansible Vault password for state encryption: ' VAULT_PASSWORD
echo

cd tests
go test

if [ $? -eq 0 ]; then
    cd ..
    echo Testing succesfull
    apply
    echo Everything ran smooth as butter
else
    echo "Test failed"
    exit 1
fi