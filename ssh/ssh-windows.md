# SSH on Windows 10


add 
```bash
HOST *
StrictHostKeyChecking no
```
to .ssh/config

in powershell:

```bash
ssh-keygen -o -t rsa -b 4096 -C "yourname@yourPC" -f ~/.ssh/id_rsa
```


add public key to your gitlab project

Now you can import this gitlab project into your Visual Studio on your Windows machine.
