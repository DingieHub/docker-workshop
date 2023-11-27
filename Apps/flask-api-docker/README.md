## Build
docker build -t flask-api-docker .

## Run
docker run -p 5001:5001 flask-api-docker

## Creeer netwerk
docker network create mynetwork

## Run met netwerk configuratie
docker run --name flask-api-docker --network mynetwork -p 5001:5001 -d flask-api-docker
