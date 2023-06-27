#!/bin/bash
printf "\n--------\nDeleting all istio Kubernetes components\n--------\n"
kubectl delete -f istio/
printf "\n--------\nDeleting all istio addons\n--------\n"
kubectl delete -f istio/addons/
printf "\n--------\nDisabling istio-injection\n--------\n"
kubectl label ns default istio-injection=disabled
printf "\n--------\nUninstalling istioctl from cluster\n--------\n"
istioctl uninstall --purge

kubectl get pods