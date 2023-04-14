# Workstation setup automation
## Requirements
- Ansible:
    ```sh
    sudo apt install ansible
    ```
    
## Configuration
Modify:
- `config.yaml`
- `mounts.yaml`
- `apt-repositories.yaml`
- `apps.yaml`

## Install requirements
```sh
sudo ansible-galaxy install -r requirements.yaml
```
## Run playbook
```sh
sudo ansible-playbook -vvv playbook.yaml
```