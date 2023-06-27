#!/bin/bash

printf "Deploying Kubernetes components for istio...\n"
kubectl apply -f istio/

minikube service list
istioctl analyze
kubectl get pods