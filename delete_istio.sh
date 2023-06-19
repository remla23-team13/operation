#!/bin/bash

kubectl delete -f istio/model-service.yml
kubectl delete -f istio/webapp.yml
kubectl delete -f istio/istio.yml

kubectl delete -f ../istio-1.17.2/samples/addons/kiali.yaml
kubectl delete -f ../istio-1.17.2/samples/addons/jaeger.yaml
kubectl delete -f ../istio-1.17.2/samples/addons/prometheus.yaml