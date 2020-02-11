# Lab - Building multistage layered Dockerfile

Building spring-music application container image using a multistage layered Dockerfile.

https://asciinema.org/a/WFndMwtbhl7yQQ2w1bQp1XbZZ

## Clone the repo

```
git clone https://github.com/nevenc/spring-music-k8s.git
cd spring-music-k8s
```

## Build the app

```
./gradlew build
ls -la build/libs/*.jar
```

## Edit Dockerfile

```
cat Dockerfile.multistage
```

## Build a container image using multistage Dockerfile

```
docker build -t nevenc/spring-music-k8s:with-multistage -f Dockerfile.multistage .
```

## Observe the history of the Docker container image
```
docker history nevenc/spring-music-k8s:with-multistage
```

## Deploy to Kubernetes cluster

```
kubectl create deployment spring-music --image=nevenc/spring-music-k8s:with-multistage
kubectl expose deployment spring-music --port=8080 --type=NodePort
kubectl get service,deployment
```

## Test the application

```
https://localhost:${NODE_PORT}
https://localhost:${NODE_PORT}/actuator/health
```

## Clean up Kubernetes deployment and service

```
kubectl delete svc spring-music
kubectl delete deployment spring-music
```

