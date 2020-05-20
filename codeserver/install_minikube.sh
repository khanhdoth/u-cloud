#!/bin/bash

# install minikube
curl -Lo minikube  https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube
mkdir -p /usr/local/bin/
install minikube /usr/local/bin/
minikube start --driver=none
minikube status

