## Generieke Compose up
docker-compose up

## Compose up van specifiek docker-compose bestand
docker-compose -f dc-client-curl-service-flask.yml up

## Stop specifieke docker-compose
docker-compose -f dc-client-curl-service-flask.yml down

## stop wanneer abort signaal
Automatically stop when container aborted docker-compose:
> docker-compose -f dc-client-curl-service-flask.yml up --abort-on-container-exit

## Stop alles wanneer 'client' stopped
docker-compose -f dc-client-curl-service-flask.yml up --exit-code-from client
