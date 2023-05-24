#!/bin/bash

kubectl delete -f kubernetes/model-service.yml
kubectl delete -f kubernetes/webapp.yml
kubectl delete -f kubernetes/ingress.yml