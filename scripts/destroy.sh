#!/bin/bash

read -sp 'Enter Ansible Vault password for state encryption: ' VAULT_PASSWORD
echo

echo $VAULT_PASSWORD | ansible-vault decrypt terraform.tfstate terraform.tfstate.backup --vault-password-file=/dev/stdin

sleep 1

terraform destroy -auto-approve

# echo $VAULT_PASSWORD | ansible-vault encrypt terraform.tfstate.backup --vault-password-file=/dev/stdin

echo Destroyed successfully...