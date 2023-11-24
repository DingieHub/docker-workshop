# Aan de slag

## Over
<a href="https://speakerdeck.com/michaelisvy/spring-petclinic-sample-application">Spring Petclinic</a>

## Lokaal draaien

### Jar bouwen
`mvn clean package -DskipTests`

De jar staat vervolgens onder `target`.

### Jar uitvoeren
`java -jar target/spring-petclinic-3.1.0-SNAPSHOT.jar`

### App gebruiken
Open een browser en navigeer naar:

http://localhost:8080/

## In Docker draaien

### Image bouwen
`docker image build --tag spring-petclinic .`

Het image is te zien met:

`docker image ls`

Het image kan worden verwijderd met:

`docker image rm spring-petclinic`

### Image uitvoeren
`docker run --publish 8080:8080 --name spring-petclinic spring-petclinic`

De container is te zien met:

`docker container ls`

De container kan worden verwijderd met:

`docker container kill spring-petclinic`

`docker container rm spring-petclinic`

### App gebruiken
Open een browser en navigeer naar:

http://localhost:8080/

## In Docker draaien met compose 

### Image bouwen en uitvoeren 
Zorg ervoor dat `docker-compose.yml` er als volgt uitziet:

```version: "3"
version: "3"
services:
  spring-petclinic:
    build: .
    #image: spring-petclinic
    container_name: spring-petclinic
    ports:
      - "8080:8080"
```

`docker compose up`

### Image uitvoeren zonder te herbouwen 
Zorg ervoor dat `docker-compose.yml` er als volgt uitziet:

```version: "3"
version: "3"
services:
  spring-petclinic:
    #build: .
    image: spring-petclinic
    container_name: spring-petclinic
    ports:
      - "8080:8080"
```

`docker compose up`
