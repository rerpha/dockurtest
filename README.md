# dockurtest

This is a test to see how easy it is to spin up a windows server 2025 VM for testing ansible playbooks etc. 

My findings are that it's very easy. However: 

1. it doesn't seem to work very well from the WSL2 when you feed through the docker socket provided by rancher desktop. for this reason you should just [install docker engine (_not docker desktop!_)](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository) instead. This can be done alongside rancher and it'll just overwrite the path to use docker engine instead. 
2. without setting up macvlans etc. this binds to localhost ports, so you need to use `ssh Docker@localhost` to use it. for this reason, i've mapped port 2222 to the dockur container's port 22 for ssh. 
3. it takes ~10 minutes to reinstall from scratch. to force this, remove `/tmp/windows/*` which is where the volume for the container is mounted. 

To stay within [licensing agreements](https://www.microsoft.com/content/dam/microsoft/usetm/documents/windows-server/2025-datacenter-and-standard/oem/UseTerms_OEM_WindowsServer2025_DatacenterAndStandard_English.pdf) (See "evaluation") we are using the evaluation image rather than dockur-provided images. 


using this in ansible is a case of adding localhost to the inventory with the following in your inventory, using `--ask-pass` and providing the [default password for dockur](https://github.com/dockur/windows#how-do-i-configure-the-username-and-password)
```yaml
---
local:
  hosts:
    localhost
  vars:
    ansible_port: 2222
    ansible_user: Docker
    ansible_shell_type: cmd

```
