#!/bin/bash
printf "\n################################### [AWS ECS DEMO WITH TERRAFORM] ###################################\n"
printf "Enter docker image name:\n"  
read  ecr_repo_name 
printf "\n\n"
printf "[0. Terraforming resources on aws =======>]\n"
sed -i "s/DOCKER_IMAGE_NAME_HERE/$ecr_repo_name/g" main.tf > /dev/null 2>&1
terraform init -upgrade && terraform apply
printf "\n[1. Building Docker Image =======>]\n"
docker build -t $ecr_repo_name .
printf "[2. Pushing image to ecr registry =======>]\n"
aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 210872676119.dkr.ecr.eu-central-1.amazonaws.com
docker tag $ecr_repo_name:latest 210872676119.dkr.ecr.eu-central-1.amazonaws.com/$ecr_repo_name:latest
docker push 210872676119.dkr.ecr.eu-central-1.amazonaws.com/$ecr_repo_name:latest
printf "Hang in here we are almost done!..\n"
sleep 5
printf "\nGo vist your application via the specified URL (get it from the above terraform output\n"
sed -i "s/$ecr_repo_name/DOCKER_IMAGE_NAME_HERE/g" main.tf > /dev/null 2>&1
printf "\nNB: launch the 'terrafomr destroy' command to delete all the created resources\n"
printf "#######################################################################################################\n\n"





