# HELM

## installing HELM on a linux machine

https://helm.sh/docs/intro/install/

https://github.com/helm/helm/releases

    Download your desired version
    Unpack it (tar -zxvf helm-v3.0.0-linux-amd64.tar.gz)
    Find the helm binary in the unpacked directory, and move it to its desired destination (mv linux-amd64/helm /usr/local/bin/helm)

## helm create my-chart


    ms@rancher-mc:~/git/my-charts/dev-app2$ helm create app2-chart
    Creating app2-chart
    
    ms@rancher-mc:~/git/my-charts/dev-app2$ ls -l app2-chart/
    drwxr-xr-x 2 ms root 4096 May  3 23:13 charts
    -rw-r--r-- 1 ms root 1146 May  3 23:13 Chart.yaml
    -rw-r--r-- 1 ms root  349 May  3 23:13 .helmignore
    drwxr-xr-x 3 ms root 4096 May  3 23:13 templates
    -rw-r--r-- 1 ms root 2363 May  3 23:13 values.yaml

see: https://helm.sh/docs/chart_template_guide/getting_started/

