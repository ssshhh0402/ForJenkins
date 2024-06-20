FROM gradle:7.4-jdk11-alpine as builder
WORKDIR /build

# 그래들 파일이 변경되었을 때만 새롭게 의존패키지 다운로드 받게함.
COPY build.gradle settings.gradle /build/
RUN gradle clean build -x test --parallel --continue > /dev/null 2>&1 || true

# 빌더 이미지에서 jar 파일만 복사
COPY --from=builder /build/build/libs/Ass3-0.0.1-SNAPSHOT.jar .
# ARG JAR_FILE=build/libs/Ass3-0.0.1-SNAPSHOT.jar
# ADD ${JAR_FILE} Ass3-0.0.1-SNAPSHOT.jar
# EXPOSE 8080
EXPOSE 9000
ENTRYPOINT ["java","-jar","-Djava.security.egd=file:/dev/./urandom","-Dsun.net.inetaddr.ttl=0","Ass3-0.0.1-SNAPSHOT.jar"]