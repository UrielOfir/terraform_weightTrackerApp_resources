#!bin/bash

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

docker pull postgres:latest

docker run -d --name measurements -p 5432:5432 -e 'POSTGRES_PASSWORD=<yourPassword>' --restart always postgres
