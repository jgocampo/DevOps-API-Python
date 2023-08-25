# Demo Devops Python CI/CD With AWS

This is a Dockerized version of the technical test for DevOps.

## Diagram

![Logo de Markdown](https://cicd-pic.s3.amazonaws.com/CICD-Devsu.JPG)

This project is done using AWS for its deployment. From Code Commit, a connection to GitHub was created to use it as the source of the pipeline, to connect with Code build and proceed with the automatic deployment of the Docker image hosted in ECR and using EKS to deploy the application with Kubernetes. In the Iac directory (Infrastructure as a code) you can find all the provisioning of the infrastructure: Cluster, servers, IAM roles, services, etc.


## Getting Started

### Create Docker Image

```bash
docker build -t <IMAGE-NAME> .
```
### Create ECR repo

```bash
aws ecr create-repository --repository-name <REPO-NAME> --region us-east-1
```

### Authenticate your docker to ecr

```bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com
```

### Tag docker image

```bash
docker tag <IMAGE-NAME:tag> <ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/<REPO-NAME:tag>
```

### Push docker image

```bash
docker push <ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/<REPO-NAME:tag>
```


## Infrastructure as a Code

## Provision VPC and subnets
```bash
aws cloudformation deploy --template-file Iac/vpc.yaml --stack-name my-new-stack
```
## Create our cluster on EKS

```bash
eksctl create cluster -f Iac/cluster.yaml 
```

## Create deployment

```bash
kubectl apply -f Iac/deployment.yaml
```

## Create service

```bash
kubectl apply -f Iac/service.yaml
```







