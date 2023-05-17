#!/bin/bash

kubectl delete -f model-service.yml
kubectl delete -f webapp.yml
kubectl delete -f monitoring.yml
kubectl delete -f ingress.yml

minikube stop
