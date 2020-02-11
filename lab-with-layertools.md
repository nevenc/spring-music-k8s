# Lab - Building multistage Dockerfile using layertools

Building spring-music application container image using layertools and multistage layered Dockerfile.

https://asciinema.org/a/z2UxCHespgtdZyeJ7KRmWisPl

## Clone the repo

```
git clone https://github.com/nevenc/spring-music-k8s.git
cd spring-music-k8s
```

## Build the app (observe different gradle build file)

```
diff build.gradle build.gradle.layertools
```

```
./gradlew build -b build.gradle.layertools
ls -la build/libs/*.jar
```

## Edit Dockerfile

```
cat Dockerfile.layertools
```

## Build a container image using multistage layertools Dockerfile

```
docker build -t nevenc/spring-music-k8s:with-layertools -f Dockerfile.layertools .
```

## Observe the history of the Docker container image
```
docker history nevenc/spring-music-k8s:with-layertools
```

## Deploy to Kubernetes cluster

```
kubectl create deployment spring-music --image=nevenc/spring-music-k8s:with-layertools
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

