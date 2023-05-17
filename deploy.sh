#!/bin/bash

# minikube start
# minikube addons enable ingress

printf "Deploying Kubernetes components...\n"
kubectl apply -f model-service.yml
kubectl apply -f webapp.yml
kubectl apply -f monitoring.yml
kubectl apply -f ingress.yml

minikube service list