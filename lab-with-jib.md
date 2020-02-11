# Lab - Building container image with JIB

Building spring-music application container image using JIB

https://asciinema.org/a/spE1JEtoC1TimQak1yI2OSs5A

## Clone the repo

```
git clone https://github.com/nevenc/spring-music-k8s.git
cd spring-music-k8s
```

## Build the app (observe different gradle build file)

```
diff build.gradle build.gradle.jib
```

```
./gradlew build -b build.gradle.jib
ls -la build/libs/*.jar
```

## Build the container image

```
./gradlew jib -b build.gradle.jib
```

## Observe the history of the Docker container image
```
docker history nevenc/spring-music-k8s:with-jib
```

## Deploy to Kubernetes cluster

```
kubectl create deployment spring-music --image=nevenc/spring-music-k8s:with-jib
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

