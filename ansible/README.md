# ANSIBLE things

## AWX

Free and opensource Ansible Tower (AAP2) powered by RedHat


## see installing k3s

[../k3s/README.md](../k3s/README.md)


## install AWX 

as a helm chart

https://ansible.readthedocs.io/projects/awx-operator/en/latest/installation/helm-install-on-existing-cluster.html

https://github.com/ansible/awx-operator/blob/devel/.helm/starter/README.md


my-values.yaml must be created for the service to work.

***WORK IN PROGRESS***


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


```yaml
```bash
helm repo add awx-operator https://ansible.github.io/awx-operator/
helm repo update
helm search repo awx-operator
helm install -n awx --create-namespace my-awx-operator awx-operator/awx-operator -f my-values.yaml
```



## to uninstall

```bash
helm uninstall my-awx-operator -n awx
```


