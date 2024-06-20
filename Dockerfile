FROM openjdk:17 as builder

workdir /var/jenkins_home/workspace/jwtest


ARG JAR_FILE=/var/jenkins_home/workspace/jwtest/build/libs/Ass3-0.0.1-SNAPSHOT.jar

COPY ${JAR_FILE} app.jar
EXPOSE 9000
ENTRYPOINT ["java", "-jar", "/app.jar"]