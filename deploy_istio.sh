#!/bin/bash

printf "\n--------\nDeploying Kubernetes components for istio\n--------\n"
kubectl apply -f istio/

minikube service list
istioctl analyze
kubectl get pods