# Lab - Building container image with Cloud Native Buildpacks

Building spring-music application container image using Cloud Native Buildpacks

https://asciinema.org/a/z2UxCHespgtdZyeJ7KRmWisPl

## Clone the repo

```
git clone https://github.com/nevenc/spring-music-k8s.git
cd spring-music-k8s
```

## Build the app (observe different gradle build file)

```
diff build.gradle build.gradle.cnb
```

```
./gradlew build -b build.gradle.cnb
ls -la build/libs/*.jar
```

## Build the container image

```
./gradlew bootBuildImage -b build.gradle.cnb
```

## Observe the history of the Docker container image
```
docker history nevenc/spring-music-k8s:with-cnb
```

## Deploy to Kubernetes cluster

```
kubectl create deployment spring-music --image=nevenc/spring-music-k8s:with-cnb
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

