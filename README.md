# docker-workshop
All files pertaining to the docker-workshop for Haystaq

# Een app-container draaien

## Benodigdheden

* Docker Desktop
* Een Git-client
* Een IDE- of teksteditor voor het maken/wijzigen, zoals Visual Studio Code en IntelliJ IDEA.

## Download de app

1. Download de `flask-api-docker` repository.

2. Pak indien nodig de repository uit en bekijk de inhoud.

## Bouw een app-image

1. Start een terminal-sessie.

2. Navigeer naar de gedownloade of gekloonde repository.
    ```
    $ cd flask-api-docker
    ```

3. Maak een leeg tekstbestand aan met naam `Dockerfile`.

4. Voeg het volgende toe aan het bestand:
    ```
    FROM python:3.8-slim
    WORKDIR /app
    COPY . /app
    RUN pip install --no-cache-dir -r requirements.txt
    EXPOSE 5001
    ENV NAME World
    CMD ["python", "app.py"]
    ```
   Een image bestaat uit meerdere lagen. Voor elke regel in de Dockerfile wordt een nieuwe laag aangemaakt:
    * `node:18-alphine` is een bestaande image dat indien nodig wordt gedownload.
    * `WORKDIR` navigeert naar een directory binnen het nieuwe image.
    * `COPY` kopieert bestanden van de host naar het image.
    * `RUN` voert een commando uit binnen het image.
    * `EXPOSE` zet een poort in het image open voor de host.
    * `ENV` voegt een omgevingsvariable toe binnen het image.
    * `CMD` voert een command uit binnen het image.
   
5. Bouw het image met:
    ```
    $ docker build -t flask-api-docker .
    ```
    Waarbij:
    * `-t` (of `--tag`) met de naam van het image.
    * `.` voor de locatie van de Dockerfile.

## Start de app-container

1. Start de container met:
    ```
    $ docker run -p 5001:5001 flask-api-docker
    ```
   Waarbij:
   * `-p` (of `--publish`) voor het beschikbaar maken van een poort in de container aan de host (volgens `HOST:CONTAINER`).   

2. Open de app met: http://localhost:5001. 

3. Bekijk de draaiende containers met:
    ```
    $ docker ps
    ```

----

# De app wijzigen

## Wijzig de broncode

1. Voer een niet-functionele wijziging door (zoals een stuk tekst dat in de app wordt weergegeven).

2. Bouw een nieuwe versie van het image met:
   ```
   $ docker build -t flask-api-docker .
   ```

3. Probeer een nieuwe container te starten met:
    ```
    $ docker run -p 5001:5001 flask-api-docker
    ```

    Omdat poort `5001` al in gebruik is door de oude container, kan de nieuwe niet worden flask-api-dockergestart.

## Verwijder de oude container

1. Bepaal de container-ID met:
    ```
    $ docker ps
    ```
   
2. Stop de container met: 
   ```
   $ docker stop <container-ID>
   ```

3. Verwijder de container met:
   ```
   $ docker rm <container-ID>
   ```

## Start de nieuwe container

1. Start de container met:
    ```
   $ docker run -p 5001:5001 flask-api-docker
    ```

2. Stel vast dat de wijziging is doorgevoerd.

---

# De applicatie delen

## Maak een repository aan

1. Log na registratie in op https://hub.docker.com/
 
2. Maak een `flask-api-docker` repository aan.

## Publiceer het image

1. Probeer het image te publiceren met:
    ```
    docker push docker/flask-api-docker
    ```
    Omdat er lokaal geen image aanwezig is onder die naam, kan deze niet worden gepubliceerd.

2. Log in op Docker Hub met:
    ```
    docker login -u <gebruikersnaam>
    ```

3. Geef het image een nieuwe naam met:
    ```
    $ docker tag flask-api-docker <gebruikersnaam>/flask-api-docker
    ```

4. Publiceer het image met:
    ```
    docker push <gebruikersnaam>/flask-api-docker
    ```

## Draai het image op een andere machine

1. Ga naar https://labs.play-with-docker.com/.

2. Log in als `docker` en vervolgens met <gebruikersnaam>.

3. Log in met de eigen gebruikersnaam en klik Start.

4. Voeg een nieuwe instantie toe.

5. Log in binnen de terminal-sessie met:
    ```
    docker login -u <gebruikersnaam>
    ```

6. Start de gepubliceerde app met:
    ```
    $ docker run -dp 0.0.0.0:5001:5001 <gebruikersnaam>/flask-api-docker
    ```

---

# Een test-container toevoegen

## Bouw een test-image

1. Download `flask-api-docker-test` repository.

2. Pak indien nodig de repository uit en bekijk de inhoud.

3. Navigeer naar de gedownloade of gekloonde repository.
 
4. Voeg een `Dockerfile` toe met:
    ```
    FROM python:3.8-slim
    WORKDIR /test
    COPY . /test
    RUN pip install --no-cache-dir
    CMD ["python", "test.py"]
    ```

5. Bouw het image met:
    ```
    $ docker build -t flask-api-docker-test .
    ```

## Start de test-container

1. Start de test-container met:
    ```
    $ docker run -p 127.0.0.1:5002:5002 flask-api-docker-test
    ```
