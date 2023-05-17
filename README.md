# Operation
This repo contains the deployment files for Docker Compose &amp; (later) Kubernetes. 
The repo uses the images generated by other projects in the organisation to create interacting Docker containers. 
For now the only containers started are those for the [app](https://github.com/remla23-team13/app) and the [model-service](https://github.com/remla23-team13/model-service). 
The app serves a website where one can enter some text to see whether it has a positive or negative sentiment. 
This is accomplished via a REST request to the model-service. 
There is also already scaffolding in-place for the app to make use of a library, which is located at [lib](https://github.com/remla23-team13/lib). 
Finally there is the [model-training](https://github.com/remla23-team13/model-training) repository which will take care of the model training later. 


## Setup guide
### Kubernetes
#### Prerequisites
- Minikube installed (version TODO), in this project the Docker driver is used. 
- Helm installed


First clone the project:
```bash
git clone git@github.com:remla23-team13/operation.git
```
Then run the following commands:
```bash
cd operation
minikube start
minikube addons enable ingress
.\deploy.sh
```
To access the application via the browser:
- MacOS: run minikube tunnel. Leave that terminal window open, you can now access the app on localhost.
- Otherwise: run minikube service list. And use the URL of the ingress-nginx-controller. 

You can use ```.\delete.sh``` to stop all kubernetes resources and stop Minikube.

### Docker-Compose
#### Prerequisites
- TODO

First clone the project:
```bash
git clone git@github.com:remla23-team13/operation.git
```
Run the following commands in the root directory of this repo
```bash
docker compose build
docker compose up
```

To stop the containers use the following command
```bash
docker compose down
```

## Monitoring
(at the moment, monitoring is unstable)
make sure the prometheus repository is added to helm:
```bash
helm repo add prom-repo https://prometheus-community.github.io/helm-charts
helm repo update
```

install prometheus stack:
```bash
helm install group13-prom prom-repo/kube-prometheus-stack
```
run prometheus (the service name may be different, check minikube service list):
```bash
minikube service group13-prom-kube-prometheus-sta-prometheus --url
```