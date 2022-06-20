# Deploy a containerized web app with Terraform and ECS
Create an aws ecs cluster for publishing a containerized web app (with Terraform) 🤖 👷 ☁️

## Terraform

<p align="center"><img width="180" height="180" src="https://github.com/yurijserrano/Github-Profile-Readme-Logos/blob/master/cloud/terraform.png"></p>

[Terraform](https://www.terraform.io/) is an open-source infrastructure as code software tool created by HashiCorp. Users define and provide data center infrastructure using a declarative configuration language known as HashiCorp Configuration Language (HCL), or optionally JSON. 

With the advent of the Cloud and programmable infrastructures, Terraform is acquiring momentum as it helps incredibly with the deployment and maintenance of IaaS.
Terraform relies on plugins called "providers" to interact with cloud providers, SaaS providers, and other APIs.
The software is compliant with the biggest cloud providers including aws, Azure and GCP.

## AWS ECS

<p align="center"><img width="180" height="180" src="https://github.com/yurijserrano/Github-Profile-Readme-Logos/blob/master/cloud/amazon.svg"></p>

Amazon Elastic Container Service (Amazon ECS) is a highly scalable and fast container management service. You can use it to run, stop and manage containers on a cluster. With Amazon ECS, your containers are defined through a process definition used to run individual processes or processes within a service. In this context, a service is a configuration that you can use to simultaneously run and manage a specified number of processes in a cluster. You can run processes and services on a serverless infrastructure managed by AWS Fargate. Alternatively, for more control over your infrastructure, you can run your processes and services on a cluster of self-managed Amazon EC2 instances.

## Docker 

<p align="center"><img width="180" height="180" src="https://github.com/yurijserrano/Github-Profile-Readme-Logos/blob/master/cloud/docker.svg"></p>

Docker is a platform as a service (PaaS) products that use OS-level virtualization to deliver software in packages called containers. 
The service has both free and premium tiers. The software that hosts the containers is called Docker Engine. 
It was first started in 2013 and is developed by Docker, Inc.

## Case Study

This repo contains a real-life use case of a containerized web app deployment via ECS by automating infrastructure deployment through Terraform.

## Prerequisites

The following prerequisites must be pre-installed on the client machine in order to perform the procedure correctly:

| Software | Description | Installation Guide |
| --- | --- | --- |
| `Terraform` | Infrastructure as a Service Software | https://learn.hashicorp.com/tutorials/terraform/install-cli |
| `aws cli` | Command Line Interface for aws resources management | https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html |
| `docker` | Software container deployment tool | https://docs.docker.com/engine/install/ |

## Usage
clone this repo:

```console
git clone https://github.com/R3DRUN3/terraform_ecs_web_app.git && cd terraform_ecs_web_app
```
Make *deploy.sh* executable:

```console
 chmod +x deploy.sh
 ```
Launch the script and follow instructions:
```console
 ./deploy.sh
 ```
 Output Sample:
```console
################################### [AWS ECS DEMO WITH TERRAFORM] ###################################
Enter docker image name:
evil_app


[0. Terraforming resources on aws =======>]

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 3.27"...
- Using previously-installed hashicorp/aws v3.75.2

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
data.aws_iam_policy_document.assume_role_policy: Reading...
data.aws_iam_policy_document.assume_role_policy: Read complete after 0s [id=320642683]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

..................................................
..................................................
..................................................
..................................................

Plan: 14 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + cluster_name = "my-cluster"
  + website_url  = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_default_subnet.default_subnet_a: Creating...
aws_iam_role.ecsTaskExecutionRole: Creating...

..................................................
..................................................
..................................................
..................................................

Apply complete! Resources: 14 added, 0 changed, 0 destroyed.

Outputs:

cluster_name = "my-cluster"
website_url = "load-balancer-dev-2135541272.eu-central-1.elb.amazonaws.com"

[1. Building Docker Image =======>]
Sending build context to Docker daemon  410.2MB
Step 1/8 : FROM ubuntu:18.04
 ---> c6ad7e71ba7d
Step 2/8 : RUN apt-get update -y > /dev/null
 ---> Running in df2077528ccd
Removing intermediate container df2077528ccd
 ---> 2cfc51e1c7ed
Step 3/8 : RUN apt-get  install -y python-pip python-dev build-essential > /dev/null
 ---> Running in 1099bd9f1ea6
debconf: delaying package configuration, since apt-utils is not installed
Removing intermediate container 1099bd9f1ea6
 ---> 900803382116
Step 4/8 : COPY . /app
 ---> 8a06fe854d7f
Step 5/8 : WORKDIR /app
 ---> Running in f423fbabc665
Removing intermediate container f423fbabc665
 ---> 7baee3306317
Step 6/8 : RUN pip install -r requirements.txt
 ---> Running in 44d3dac59759
Collecting Flask==1.0.2 (from -r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/7f/e7/08578774ed4536d3242b14dacb4696386634607af824ea997202cd0edb4b/Flask-1.0.2-py2.py3-none-any.whl (91kB)
Collecting Werkzeug>=0.14 (from Flask==1.0.2->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/cc/94/5f7079a0e00bd6863ef8f1da638721e9da21e5bacee597595b318f71d62e/Werkzeug-1.0.1-py2.py3-none-any.whl (298kB)
Collecting click>=5.1 (from Flask==1.0.2->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/d2/3d/fa76db83bf75c4f8d338c2fd15c8d33fdd7ad23a9b5e57eb6c5de26b430e/click-7.1.2-py2.py3-none-any.whl (82kB)
Collecting Jinja2>=2.10 (from Flask==1.0.2->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/7e/c2/1eece8c95ddbc9b1aeb64f5783a9e07a286de42191b7204d67b7496ddf35/Jinja2-2.11.3-py2.py3-none-any.whl (125kB)
Collecting itsdangerous>=0.24 (from Flask==1.0.2->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/76/ae/44b03b253d6fade317f32c24d100b3b35c2239807046a4c953c7b89fa49e/itsdangerous-1.1.0-py2.py3-none-any.whl
Collecting MarkupSafe>=0.23 (from Jinja2>=2.10->Flask==1.0.2->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/fb/40/f3adb7cf24a8012813c5edb20329eb22d5d8e2a0ecf73d21d6b85865da11/MarkupSafe-1.1.1-cp27-cp27mu-manylinux1_x86_64.whl
Installing collected packages: Werkzeug, click, MarkupSafe, Jinja2, itsdangerous, Flask
Successfully installed Flask-1.0.2 Jinja2-2.11.3 MarkupSafe-1.1.1 Werkzeug-1.0.1 click-7.1.2 itsdangerous-1.1.0
Removing intermediate container 44d3dac59759
 ---> d7cf477c2e60
Step 7/8 : ENTRYPOINT ["python"]
 ---> Running in 241a83453086
Removing intermediate container 241a83453086
 ---> 80d61091851d
Step 8/8 : CMD ["evilapp.py"]
 ---> Running in 27a20c1baa0a
Removing intermediate container 27a20c1baa0a
 ---> b105f1cf0253
Successfully built b105f1cf0253
Successfully tagged evil_app:latest
[2. Pushing image to ecr registry =======>]
WARNING! Your password will be stored unencrypted in /home/rago/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
The push refers to repository [210872676119.dkr.ecr.eu-central-1.amazonaws.com/evil_app]
2cc5ef2bb7f7: Pushed 
0ec9a62b3481: Pushed 
dbc060042175: Pushed 
272e4d78e1f0: Pushed 
3e549931e024: Pushed 
latest: digest: sha256:f11d5eab9b000bb84a12b03b91c07788685f2150e3105b71d769d030f5eeacc4 size: 1377
Hang in here we are almost done!..


Go vist your application in the specified URL (get it from the above terraform output

NB: launch the 'terrafomr destroy' command to delete all the created resources
#######################################################################################################
 ```
 <br>
 
 To see your deployed web app just visit the link specified in terraform output *website_url* var, this is the aws load balancer dns name:
 
 <br>
 
![screenshot.png](https://github.com/R3DRUN3/terraform_ecs_web_app/blob/main/evil_app.PNG)


