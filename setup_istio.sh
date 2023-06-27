#!/bin/bash

printf "Installing istioctl in cluster\n"
istioctl install
printf "Enabling istio-injection\n"
kubectl label ns default istio-injection=enabled
printf "Adding istio addons: Prometheus, Jaeger and Kiali\n"
kubectl apply -f ../istio-1.17.2/samples/addons/prometheus.yaml
kubectl apply -f ../istio-1.17.2/samples/addons/jaeger.yaml
kubectl apply -f ../istio-1.17.2/samples/addons/kiali.yaml
kubectl get ns default --show-labels
istioctl analyze
