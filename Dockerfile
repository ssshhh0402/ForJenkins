FROM openjdk:17 as builder

workdir /var/jenkins_home/workspace/jwtest

COPY gradle gradle
COPY gradlew .
COPY build.gradle .
COPY settings.gradle .

RUN chmod +x ./gradlew

RUN ./gradlew build --no-daemon

COPY src ./src

RUN ./gradlew build --no-daemon

FROM openjdk:17
workdir /var/jenkins_home/workspace/jwtest
copy --from=builder /var/jenkins_home/workspace/jwtest/build/libs/Ass3-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 9000

CMD ["JAVA", "-jar", "app.jar"]
# ARG JAR_FILE=/var/jenkins_home/workspace/jwtest/build/libs/Ass3-0.0.1-SNAPSHOT.jar

# COPY ${JAR_FILE} app.jar
# EXPOSE 9000
# ENTRYPOINT ["java", "-jar", "/app.jar"]