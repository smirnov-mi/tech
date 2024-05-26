# Cert-manager

Cert-manager is an essential app for every k8s cluster.

Install it if it's not already installed.

Check:

```bash
kubectl get ClusterIssuer
kubectl get po -A |grep -i cert
```

You will need the cert-manager itself (best installed as Rancher app or Helm chart),

and the ClusterIssuer (e.g. LetsEncrypt prod)

# Install with ArgoCD

https://cert-manager.io/docs/installation/continuous-deployment-and-gitops/

