FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY . /app
RUN mvn install -Dmaven.test.skip=true

FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY --from=build /app/target/spring-boot-postgres-0.0.1-SNAPSHOT.jar app/spring-boot-postgres-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","app/spring-boot-postgres-0.0.1-SNAPSHOT.jar"]
