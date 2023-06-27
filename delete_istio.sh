#!/bin/bash
printf "Deleting all istio Kubernetes components\n"
kubectl delete -f istio/
printf "Deleting all istio addons\n"
kubectl delete -f ../istio-1.17.2/samples/addons/prometheus.yaml
kubectl delete -f ../istio-1.17.2/samples/addons/jaeger.yaml
kubectl delete -f ../istio-1.17.2/samples/addons/kiali.yaml
printf "Disabling istio-injection\n"
kubectl label ns default istio-injection=enabled
printf "Uninstalling istioctl from cluster\n"
istioctl uninstall

kubectl get pods