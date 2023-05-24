#!/bin/bash

# minikube start
# minikube addons enable ingress

printf "Deploying Kubernetes components...\n"
kubectl apply -f kubernetes/model-service.yml
kubectl apply -f kubernetes/webapp.yml
kubectl apply -f kubernetes/ingress.yml

minikube service list
kubectl get pods