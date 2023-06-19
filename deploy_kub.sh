#!/bin/bash

# minikube start
# minikube addons enable ingress

printf "Deploying Kubernetes components...\n"
kubectl apply -f old_kub/

minikube service list
kubectl get pods