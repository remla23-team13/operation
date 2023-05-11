#!/bin/bash

kubectl delete deployments --all
kubectl delete statefulsets --all
kubectl delete pvc --all
kubectl delete services --all
kubectl delete pods --all
