[![CI](https://github.com/de-it-krachten/ansible-role-powershell_linux/workflows/CI/badge.svg?event=push)](https://github.com/de-it-krachten/ansible-role-powershell_linux/actions?query=workflow%3ACI)


# ansible-role-powershell_linux

Installs & configures Powershell on various Linux distributions


Platforms
--------------

Supported platforms

- CentOS 7
- CentOS 8
- RockyLinux 8
- AlmaLinux 8
- Debian 10 (Buster)
- Debian 11 (Bullseye)
- Ubuntu 18.04 LTS
- Ubuntu 20.04 LTS



Role Variables
--------------
<pre><code>
# name of the package
powershell_linux_package: powershell

# Directory to copy helper scripts to
powershell_linux_script_dir: /usr/local/bin

# List of default helper scripts
powershell_linux_scripts:
  - install-module.ps1
  - remove-module.ps1
  - register-repository.ps1
  - unregister-repository.ps1

# List of custom helper scripts
powershell_linux_scripts_custom: []
</pre></code>


Example Playbook
----------------

<pre><code>
- name: sample playbook for role 'powershell_linux'
  hosts: all
  vars:
    powershell_linux_modules: [{'name': 'VMware.PowerCLI', 'version': '12.3.0.17860403'}]
  tasks:
    - name: Include role 'powershell_linux'
      include_role:
        name: powershell_linux
</pre></code>
