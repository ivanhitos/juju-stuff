### Juju manual provider on Azure to deploy K8s.

#### On your computer:
- Install terraform
- Install az
- Download this repo and cd into the terraform directory
- Create the terraform.tfvars file
- Run: 
````
$ az login
$ terraform init
$ terraform plan
$ terraform apply
$ scp bundles/cdk-bundle.yaml ubuntu@juju_client_public_ip:
$ scp bundles/azure-integrator-overlay.yaml ubuntu@juju_client_public_ip:



#### On the juju client 
```(ssh-add yourkey, ssh -A ubuntu@juju_client_public_ip)```:

Install juju, bootstrap controllers and add machines
```
$ sudo snap install juju --classic
$ juju bootstrap manual/192.168.1.X
$ juju add-machine ssh:ubuntu@192.168.1.X  # Run this for all the machines
$ juju deploy cdk-bundle.yaml
$ watch -c juju status --color # wait for all units to become active
```

Configure kubectl
``` 
$ mkdir -p ~/.kube
$ juju scp kubernetes-master/0:config ~/.kube/config
$ sudo snap install kubectl --classic
$ kubectl cluster-info
$ kubectl get nodes
```


Configure Azure tools and configure the integrator:
```
$ juju deploy cdk-bundle.yaml --overlay ./azure-integrator-overlay.yaml
$ cat <<EOF > azure-cred.json   # get this info from Azure or Azure client
{
  "application-id": "XXXXX",
  "application-password": "YYYYY",
  "subscription-id": "YYY"
}
EOF
$ juju config azure-integrator  credentials="$(base64 /home/ubuntu/azure-cred.json)"
$ watch -c juju status --color # wait for all units to become active
```

Run tests from https://jujucharms.com/u/containers/azure-integrator/


