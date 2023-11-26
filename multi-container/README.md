## Generieke Compose up
docker-compose up

## Compose up van specifiek docker-compose bestand
docker-compose -f dc-client-curl-service-flask.yml up

## Stop specifieke docker-compose
docker-compose -f dc-client-curl-service-flask.yml down

## Stop wanneer abort signaal
docker-compose -f dc-client-curl-service-flask.yml up --abort-on-container-exit

## Stop alles wanneer 'client' stopt
docker-compose -f dc-client-curl-service-flask.yml up --exit-code-from client
