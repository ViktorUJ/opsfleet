# Opsfleet  assessment. 


## Task 1 . [Automate EKS cluster setup on AWS](https://trello.com/c/BRZAmGak ) 






### Requirements : 

#### -  [terrafrom   > v0.14.xx](https://www.terraform.io/downloads.html)
#### -  linux make
#### -  aws IAM user  + Access key   with  Admin privilege  for VPC, EC2, EKS ,AIM , CloudWatch  
#### - [aws-iam-authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)
#### - update variable in  var_dev_env.tfvars  file
#### - prepare aws profile 


````
cat ~/.aws/credentials
[default]
aws_access_key_id = XXXXXXXXXXXX
aws_secret_access_key = YYYYYYYYYYYY
````

### Create EKS + test pod
```
 make run

```
### get pod status 

```
 make status

```

### check pod access  to s3 bucket

```
 make check

```


### destroy env

````
 make destroy

````

## Task 2. [Managing secrets on Kubernetes](https://trello.com/c/5oQASWQ4 )

### 1ts way  
#### -  move sensitive data from github code to  k8 secret level
####  -  encrypt Secrets stored in etcd via [KMS plugin](https://kubernetes.io/docs/tasks/administer-cluster/kms-provider/)

### 2ts way
#### -  move sensitive data from github code to  [HashiCorp vault](https://www.hashicorp.com/products/vault)
#### -  use [Vault Agent](https://learn.hashicorp.com/tutorials/vault/agent-kubernetes?in=vault/kubernetes) for getting secrets 


### 3ts way (the best)
#### -  move sensitive data from github code to  one of popular  secret management systems, like AWS Secrets Manager or HashiCorp Vault.
#### -  use [Kubernetes External Secrets](https://github.com/external-secrets/kubernetes-external-secrets) for getting secrets



