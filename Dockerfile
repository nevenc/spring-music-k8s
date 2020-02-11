FROM adoptopenjdk:11-jre-hotspot
ARG JAR_FILE=build/libs/*.jar
ADD ${JAR_FILE} app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
