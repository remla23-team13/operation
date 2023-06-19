#!/bin/bash

printf "Deploying Kubernetes components...\n"
kubectl apply -f istio/

minikube service list
istioctl analyze
kubectl get pods