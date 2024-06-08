# Cert-manager

Cert-manager is an essential app for every k8s cluster.

Install it if it's not already installed.

Add jetstack repository,
install cert-manager **WITH CRDs**

    --set crds.enabled=true

or

        crds:
          enabled: true

Check:

```bash
kubectl get ClusterIssuer
kubectl get po -A |grep -i cert
```

You will need the cert-manager itself (best installed as Rancher app or Helm chart),

and the ClusterIssuer (e.g. LetsEncrypt prod)

    cat <<EOF | kubectl apply -f -
    apiVersion: cert-manager.io/v1
    kind: ClusterIssuer
    metadata:
      name: letsencrypt-prod
      namespace: ingress-nginx
    spec:
      acme:
        server: https://acme-v02.api.letsencrypt.org/directory
        email: your.email@gmail.com
        privateKeySecretRef:
          name: letsencrypt-prod
        solvers:
        - http01:
           ingress:
             class: nginx
    EOF

# Install with ArgoCD

https://cert-manager.io/docs/installation/continuous-deployment-and-gitops/

