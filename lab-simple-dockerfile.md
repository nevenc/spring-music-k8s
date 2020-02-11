# Lab - Building simple Dockerfile 

Building spring-music application container image using a simple (singlelayer) Dockerfile.

https://asciinema.org/a/YYtaKSboDzRIPi97gjMLN79vv

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
cat Dockerfile
```

## Build a container image using simple Dockerfile

```
docker build -t nevenc/spring-music-k8s:with-dockerfile -f Dockerfile .
```

## Observe the history of the Docker container image
```
docker history nevenc/spring-music-k8s:with-dockerfile
```

## Deploy to Kubernetes cluster

```
kubectl create deployment spring-music --image=nevenc/spring-music-k8s:with-dockerfile
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

