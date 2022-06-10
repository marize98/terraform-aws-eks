# About

Esta solución contiene archivos terraform para aprovisionar un clúster de EKS en AWS:
- An EKS Cluster 
- A Worker Node 
- Auto-scaling group for worker node
- A VPC
- Persistent Volume & Volume Claim
- Jenkins


Archivos: 

1.  [main.tf](./main.tf)
2.  [resources.tf](./resources.tf)
3.  [variables.tf](./variables.tf)
4.  [versions.tf](./versions.tf)
5.  [vpc.tf](./versions.tf)


# Ejecución
Aplicar los comandos

```sh
$ terraform init
 
$ terraform plan
   
$ terraform apply
```

```sh
$ aws eks update-kubeconfig --name <cluster-name> --region <region>
```


# Despliegue de Jenkins 

***Usando Helm***

Ejecute los comandos

>Para crear el namespace:
  ```sh
  $ kubectl create namespace jenkins
  ```
>Para crear la cuenta servicio y aplicar RBAC:
```sh
$ kubectl apply -f jenkins-sa.yaml
```
>Para crear namespace:
```sh
$ kubectl create namespace jenkins
```
>Para crear el volumen persistente:
```sh
$ kubectl apply -f jenkins-volumes.yaml
```
>Para crear un claim:
```sh
$ kubectl apply -f jenkins-pvc.yaml
```

```sh
$ chart=jenkins/jenkins
$ helm install jenkins -n jenkins -f values.yaml ./helm $chart 
```

***Usando Terraform:***

Ejecute los comandos nuevamente:

```sh
$ terraform init
 
$ terraform plan
   
$ terraform apply
```
