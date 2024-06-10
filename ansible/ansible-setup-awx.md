# ANSIBLE AWX setup

## AWX is

Free and opensource Ansible Tower (AAP2) powered by RedHat


## installing k3s

We are installing AWX as a Helm chart on a simple k3s cluster, so first see:

[../k3s/README.md](../k3s/README.md)


## install AWX 

1.June 2024 - Install AWX 24.4.0 as a helm chart on k3s v1.29.5+k3s1


https://ansible.readthedocs.io/projects/awx-operator/en/latest/installation/helm-install-on-existing-cluster.html

https://github.com/ansible/awx-operator/blob/devel/.helm/starter/README.md

install operator

```bash
helm repo add awx-operator https://ansible.github.io/awx-operator/
helm repo update
helm search repo awx-operator
helm install -n awx --create-namespace my-awx-operator awx-operator/awx-operator [-f my-values.yaml]
```


after

```bash

helm install -n awx --create-namespace my-awx-operator awx-operator/awx-operator

NAME: my-awx-operator
LAST DEPLOYED: Sat Jun  1 23:33:57 2024
NAMESPACE: awx
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
AWX Operator installed with Helm Chart version 2.17.0
```

install AWX itself

*awx-pvc.yaml  might be required*

```bash

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: postgres-13-ansible-awx-postgres-13-0
  namespace: awx
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 2Gi
```

```bash

echo -e "
apiVersion: awx.ansible.com/v1beta1
kind: AWX
metadata:
  name: ansible-awx
  namespace: awx
spec:
  service_type: nodeport
" > ansible-awx.yaml


kubectl apply -f ansible-awx.yaml



k get svc -n awx
NAME                                              TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
awx-operator-controller-manager-metrics-service   ClusterIP   10.43.239.106   <none>        8443/TCP       14m
ansible-awx-postgres-15                           ClusterIP   None            <none>        5432/TCP       114s
ansible-awx-service                               NodePort    10.43.150.101   <none>        80:31152/TCP   66s

```

**WAIT a few minutes** 



```

kubectl get secret ansible-awx-admin-password -o jsonpath="{.data.password}" -n awx | base64 --decode ; echo
qeq9rU0TiOxYUMfk0IFcEyQB7rLKVp0d
```

access http://localhost:NodePort


## see also

https://ansible.readthedocs.io/projects/awx-operator/en/latest/installation/helm-install-on-existing-cluster.html

https://github.com/ansible/awx/blob/devel/INSTALL.md#installing-the-awx-cli



## Ingress and custom values

https://github.com/ansible/awx-operator/blob/devel/.helm/starter/README.md



## to uninstall

```bash
helm uninstall my-awx-operator -n awx
```


# Ansible CLI installation

see [ansible-setup-cli.md](ansible-setup-cli.md)




***TLDR;***


```yaml
---
awx:
  ingress:
	enabled: true
	hosts:
	  - awx.example.com
	annotations:
	  kubernetes.io/ingress.class: traefik
	  traefik.ingress.kubernetes.io/redirect-entry-point: https
	  traefik.ingress.kubernetes.io/redirect-permanent: "true"
	  traefik.ingress.kubernetes.io/redirect-regex: ^https?://awx.example.com/(.*)
	  traefik.ingress.kubernetes.io/redirect-replacement: https://awx.example.com/$1
	  traefik.ingress.kubernetes.io/redirect-regex: ^https?://awx.example.com$
	  traefik.ingress.kubernetes.io/redirect-replacement: https://awx.example.com/
  service:
	type: LoadBalancer
  adminPassword: admin
  postgresql:
	postgresqlPassword: postgres
  rabbitmq:
	rabbitmqPassword: rabbitmq
  redis:
	password: redis
  awxweb:
	extraEnv:
	  - name: SECRET_KEY
		value: "mysecretkey"
  awxTask:
	extraEnv:
	  - name: SECRET_KEY
		value: "mysecretkey"
  awxOperator:
	extraEnv:
	  - name: SECRET_KEY
		value: "mysecretkey"
  awxMemcached:
	extraEnv:
	  - name: SECRET_KEY
		value: "mysecretkey"
  awxPostgres:
	extraEnv:
	  - name: SECRET_KEY
		value: "mysecretkey"
  awxRabbitmq:
	extraEnv:
	  - name: SECRET_KEY
		value: "mysecretkey"
  awxRedis:
	extraEnv:
	  - name: SECRET_KEY
		value: "mysecretkey"
  awxTask:
	extraEnv:
	  - name: SECRET_KEY
		value: "mysecretkey"
  awxWeb:
	extraEnv:
	  - name: SECRET_KEY
		value: "mysecretkey"
  awxOperator:
	extraEnv:
	  - name: SECRET_KEY
		value: "mysecretkey"
  awxMemcached:
	extraEnv:
	  - name: SECRET_KEY
		value: "mysecretkey"
  awxPostgres:
	extraEnv:
	  - name: SECRET_KEY
```



