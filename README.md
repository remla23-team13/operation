# Operation
This repo contains all the files necessary to run the restaurant review assessment [application](https://github.com/remla23-team13/app).  
The repo uses the images generated by other projects in the organisation, namely [model-service](https://github.com/remla23-team13/model-service) and [app](https://github.com/remla23-team13/model-service).
The model-service uses the model trained by [model-training](https://github.com/remla23-team13/model-training).
And both of the model repositories use the preprocessing code in [lib](https://github.com/remla23-team13/lib).

The code base can be deployed using a variety of methods. 
The simplest is [Docker Compose](#docker-compose), another option is to use [Helm](#helm). 
Finally, in order to try out continuous experimentation you can use the [Istio deployment](#istio) using Kubernetes.
For the exact steps see the set-up guide.

Once the app is accessible you can enter a sentence or word and the application will return the sentiment.
For more details on the features of our web application see the [app repository](https://github.com/remla23-team13/app). 
Important note: good is actually classified as having a negative sentiment, try great instead.

## Set-up guide
#### Prerequisites
- Minikube v1.30
  - Docker driver is used
  - Ingress is enabled: `minikube addons enable ingress```
- Helm v3.11
- Docker v20.10
- Docker Compose v2.4

First clone the project:
```bash
git clone git@github.com:remla23-team13/operation.git
cd operation
```
---
**NOTE:** To access either the Helm or Istio deployed the application via the browser use `minikube tunnel`
---

## Helm
Run `minikube start`.
Make sure dependencies are installed and install the Helm charts. 
We recommend "whoop" as the `<RELEASE NAME>`.
```bash
helm dependency update ./charts
helm install <RELEASE_NAME> ./charts
```

To access the different endpoints use: 
- Webapp: `http://localhost`
- Prometheus: `http://localhost/prometheus/graph`
- Grafana: `http://localhost/grafana`

For Grafana you can use the following default login credentials:
- user: admin
- password: prom-operator

To stop Helm use:
```bash
helm uninstall <RELEASE_NAME>
```

### Istio

### prerequisites
- [istioctl](https://istio.io/latest/docs/setup/install/istioctl/)(v1.17.2) is installed

Make sure you start minikube with enough resources, otherwise the application may not function. 
Then run the scripts, the first will install Istio onto your minikube cluster in addition to some nice addons. 
All files in `istio/addons` were copied from the Istio v1.17.2. release file. 
The second will apply our project specific Kubernetes files. 
```bash
minikube start --memory=7500 --cpus=4
./setup_istio.sh
./deploy_istio.sh
```

Run `./delete_istio.sh` to delete all deployed Kubernetes deployments, delete the addons, and uninstall Istio from the cluster.

### Docker-Compose
Run the following commands in the root directory of this repo
```bash
docker compose up
```
You can now access the application in your browser at: `http://localhost:3000`.
To stop the containers use `docker compose down`.