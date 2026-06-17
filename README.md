# dockurtest

This is a test to see how easy it is to spin up a windows 11 VM for testing ansible playbooks etc. 

My findings are that it's very easy. However: 

1. it doesn't seem to work very well from the WSL2 when you feed through the docker socket provided by rancher desktop. for this reason you should just [install docker engine](https://docs.docker.com/engine/install/ubuntu/) instead. This can be done alongside rancher and it'll just overwrite the path to use docker engine instead. 
2. without setting up macvlans etc. this binds to localhost ports, so you need to use `ssh Docker@localhost` to use it. for this reason, i've mapped port 2222 to the dockur container's port 22 for ssh. 
3. it takes ~10 minutes to reinstall from scratch. to force this, remove `/tmp/windows/*` which is where the volume for the container is mounted. 

