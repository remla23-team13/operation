#!/bin/bash

printf "Deploying Kubernetes components...\n"
kubectl apply -f istio/model-service.yml
kubectl apply -f istio/webapp.yml
kubectl apply -f istio/ingress.yml

minikube service list
kubectl get pods