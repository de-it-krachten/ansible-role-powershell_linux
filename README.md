[![CI](https://github.com/de-it-krachten/ansible-role-powershell_linux/workflows/CI/badge.svg?event=push)](https://github.com/de-it-krachten/ansible-role-powershell_linux/actions?query=workflow%3ACI)


# ansible-role-powershell_linux

Installs & configures Powershell on various Linux distributions



## Dependencies

#### Roles
None

#### Collections
None

## Platforms

Supported platforms

- Red Hat Enterprise Linux 8<sup>1</sup>
- RockyLinux 8
- OracleLinux 8
- OracleLinux 9
- AlmaLinux 8
- Debian 11 (Bullseye)
- Ubuntu 20.04 LTS
- Ubuntu 22.04 LTS
- Fedora 40
- Fedora 41

Note:
<sup>1</sup> : no automated testing is performed on these platforms

## Role Variables
### defaults/main.yml
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

### defaults/family-Debian.yml
<pre><code>
# Type of installation (package/binary)
powershell_install_type: package
</pre></code>

### defaults/family-RedHat-9.yml
<pre><code>
# Type of installation (package/binary)
powershell_install_type: binary

# List of package required
powershell_packages:
  - libicu
</pre></code>

### defaults/family-RedHat.yml
<pre><code>
# Type of installation (package/binary)
powershell_install_type: package
</pre></code>

### defaults/family-Suse.yml
<pre><code>
# Type of installation (package/binary)
powershell_install_type: package
</pre></code>

### defaults/Fedora.yml
<pre><code>
# Type of installation (package/binary)
powershell_install_type: binary

# List of package required
powershell_packages:
  - libicu
</pre></code>




## Example Playbook
### molecule/default/converge.yml
<pre><code>
- name: sample playbook for role 'powershell_linux'
  hosts: all
  become: 'yes'
  vars:
    powershell_linux_modules:
      - name: VMware.PowerCLI
        version: 12.7.0.20091289
  tasks:
    - name: Include role 'powershell_linux'
      ansible.builtin.include_role:
        name: powershell_linux
</pre></code>
