# Build a docker image (nerdctl)

25.06.2024  HOWTO build docker image with nerdctl

### containerd 

is running as systemd service

https://github.com/containerd/nerdctl/blob/main/docs/build.md



### Buildkitd :

https://github.com/moby/buildkit/tree/v0.14.1?tab=readme-ov-file#linux-setup

https://github.com/moby/buildkit/releases  (0.14.1)

root@Ubuntu24-ws:~# wget https://github.com/moby/buildkit/releases/download/v0.14.1/buildkit-v0.14.1.linux-amd64.tar.gz

tar -xvfz ....

root@Ubuntu24-ws:~/buildkit# mv bin/build* /usr/local/bin/



### start buildkitd inthe first terminal:

muscat@Ubuntu24-ws:~/rancher-mc-old/DCKR/py1$ sudo /usr/local/bin/buildkitd --oci-worker=false --containerd-worker=true

### run in second terminal:

muscat@Ubuntu24-ws:~/rancher-mc-old/DCKR/py1$ sudo nerdctl build . -t em-tg-bot:1.0.0 -t em-tg-bot:latest

muscat@Ubuntu24-ws:~/rancher-mc-old/DCKR/py1$ sudo nerdctl image ls
REPOSITORY    TAG       IMAGE ID        CREATED           PLATFORM       SIZE         BLOB SIZE
em-tg-bot     1.0.0     a7956f357051    54 seconds ago    linux/amd64    152.1 MiB    48.8 MiB
em-tg-bot     latest    a7956f357051    52 seconds ago    linux/amd64    152.1 MiB    48.8 MiB


### to upload the docker image (e.g. to hub.docker.com) account is required

muscat@Ubuntu24-ws:~/rancher-mc-old/DCKR/py1$ sudo nerdctl login
muscat@Ubuntu24-ws:~/rancher-mc-old/DCKR/py1$ sudo nerdctl tag em-tg-bot:1.0.0 smichi/em-tg:bot1.0.0
muscat@Ubuntu24-ws:~/rancher-mc-old/DCKR/py1$ sudo nerdctl push smichi/em-tg:bot1.0.0


verify it's been uploaded: https://hub.docker.com/ (login required)


### start it

    nerdctl run -d -p 8080:80 --name nginx nginx:alpine




# Build a docker image (DOCKER)


## Prerequisite

- docker hub registry
- docker hub account
- docker installed

 
## Build a docker image

in the folder with Dockerfile run:

```bash
sudo docker build . -t tiny-web:1.3.0 -t tiny-web:latest
sudo docker tag tiny-web:1.3.0 smichi/webs:tiny-1.3.0-up1.26.0
```

hub.docker.com login required!

```bash
sudo docker login
sudo docker push  smichi/webs:tiny-1.3.0-up1.26.0
```


