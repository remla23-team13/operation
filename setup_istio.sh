#!/bin/bash

printf "\n--------\nInstalling istioctl in cluster\n--------\n"
istioctl install
printf "\n--------\nEnabling istio-injection\n--------\n"
kubectl label ns default istio-injection=enabled
printf "\n--------\nAdding istio addons: Prometheus, Jaeger and Kiali\n--------\n"
kubectl apply -f istio/addons/
kubectl get ns default --show-labels
istioctl analyze
