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
