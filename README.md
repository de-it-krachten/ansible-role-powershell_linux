[![CI](https://github.com/de-it-krachten/ansible-role-powershell_linux/workflows/CI/badge.svg?event=push)](https://github.com/de-it-krachten/ansible-role-powershell_linux/actions?query=workflow%3ACI)


# ansible-role-powershell_linux

WRITE HERE


Platforms
--------------

Supported platforms

- CentOS 7
- CentOS 8
- Debian 10 (Buster)
- Debian 11 (Bullseye)
- Ubuntu 18.04 LTS
- Ubuntu 20.04 LTS



Role Variables
--------------
<pre><code>


powershell_linux_package: powershell

powershell_linux_script_dir: /usr/local/bin

powershell_linux_scripts:
  - install-module.ps1
  - register-repository.ps1
  - unregister-repository.ps1
powershell_linux_scripts_additional: []
powershell_linux_scripts_custom: []
</pre></code>


Example Playbook
----------------

<pre><code>

- name: Converge
  hosts: all
  tasks:

    - name: "Include role 'ansible-role-powershell_linux'"
      include_role:
        name: "ansible-role-powershell_linux"
</pre></code>
