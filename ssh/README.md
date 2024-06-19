# SSH tricks

instead of constantly using : 

```bash
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null user@host
```
enter parameters in local  [.ssh-config.md](https://github.com/smirnov-mi/tech/blob/main/ssh/.ssh-config.md)

# ~/.profile

show apt repos and uptime on Ubuntu login / su
```bash
echo -e '\nRepositories:'
grep -rhE ^URI /etc/apt/sources.list*
echo -e '\nUptime:'
/usr/bin/uptime
echo -e '\n'
```

# ssh via jump / bastion host

From https://www.jeffgeerling.com/blog/2022/using-ansible-playbook-ssh-bastion-jump-host


## SSH for single connection

    ssh -J user@bastion-host user@private-host
  

## SSH-config, for all connections on a given server.

Add following to  ~/.ssh/config :

    Host bastion
       User username
       Hostname bastion.example.com
    
    Host private-server-*.example.com
       ProxyJump bastion


## For ansible, using inventory file/vars: 

    [proxy]
    bastion.example.com
    
    [nodes]
    private-server-1.example.com
    private-server-2.example.com
    private-server-3.example.com
    
    [nodes:vars]
    ansible_ssh_common_args='-o ProxyCommand="ssh -p 2222 -W %h:%p -q username@bastion.example.com"'
    
This sets up an SSH proxy through bastion.example.com on port 2222 (if using the default port, 22, you can drop the port argument). The -W argument tells SSH it can forward stdin and stdout through the host and port, effectively allowing Ansible to manage the node behind the bastion/jump server.

