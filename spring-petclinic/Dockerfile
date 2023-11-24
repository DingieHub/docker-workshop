FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /home/app
COPY ./src ./src
COPY ./pom.xml .
RUN mvn package -DskipTests

FROM eclipse-temurin:17 AS dist
COPY --from=build /home/app/target/spring-petclinic-3.1.0-SNAPSHOT.jar /usr/local/lib/spring-petclinic.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/spring-petclinic.jar"]
