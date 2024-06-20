FROM adoptopenjek/openjdk11:ubi
workdir /build

COPY build.gralde.kus settings.gradle.kts /build/
RUN gradle build -x test --parallel --continue > /dev/null 2>%1 || true

COPY . /build
RUN gradle build -x test --parallel

FROM adoptopenjek/openjdk11:ubi
workdir /app

COPY --from=builder /build/build/libs/Ass3-0.0.1-SNAPSHOT.jar .

EXPOSE 9000

USER nobody 
ENTRYPOINT [
  "java",
  "-jar",
  "-Djava.security.egd=file:/dev/./urandom",
  "-Dsun.net.inetaddr.ttl=0",
  "Ass3-0.0.1-SNAPSHOT.jar"
]