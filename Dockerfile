FROM adoptopenjek/openjdk11:ubi
workdir /var/jenkins_home/workspace/jwtest

MCD [":./gradle", "clean", "build"]

ARG JAR_FILE=build/libs/*.jar

COPY ${JAR_FILE} app.jar
EXPOSE 9000
ENTRYPOINT ["java", "-jar", "/app.jar"]