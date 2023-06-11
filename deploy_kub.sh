#!/bin/bash

# minikube start
# minikube addons enable ingress

printf "Deploying Kubernetes components...\n"
kubectl apply -f kubernetes/

minikube service list
kubectl get pods