Run:
docker-compose up

Run specific docker-compose:
docker-compose -f dc-client-curl-service-flask.yml up

Stop specific docker-compose:
docker-compose -f dc-client-curl-service-flask.yml down

Automatically stop when container aborted docker-compose:
docker-compose -f dc-client-curl-service-flask.yml up --abort-on-container-exit

Stops everything when 'client' stops:
docker-compose -f dc-client-curl-service-flask.yml up --exit-code-from client