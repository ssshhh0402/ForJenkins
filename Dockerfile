FROM gradle:7.4-jdk11-alpine as builder
WORKDIR /build

RUN cd /var/jenkins_home/workspace/jwtest
RUN ls -al
RUN pwd
# 그래들 파일이 변경되었을 때만 새롭게 의존패키지 다운로드 받게함.
# COPY build.gradle settings.gradle /build/
# RUN gradle clean build -x test --parallel --continue > /dev/null 2>&1 || true
RUN gradle clean build -x test

# 빌더 이미지에서 jar 파일만 복사
# COPY --from=builder /build/build/libs/Ass3-0.0.1-SNAPSHOT.jar .
# ARG JAR_FILE=build/libs/Ass3-0.0.1-SNAPSHOT.jar
# ADD ${JAR_FILE} Ass3-0.0.1-SNAPSHOT.jar
# EXPOSE 8080
COPY build/libs/*.jar /deploy/app.jar
EXPOSE 9000
ENTRYPOINT ["java","-jar","-Djava.security.egd=file:/dev/./urandom","-Dsun.net.inetaddr.ttl=0","/deploy/app.jar"]