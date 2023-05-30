#!/bin/bash

printf "Deploying Kubernetes components...\n"
kubectl apply -f istio/model-service.yml
kubectl apply -f istio/webapp.yml
kubectl apply -f istio/istio.yml

minikube service list
istioctl analyze
kubectl get pods