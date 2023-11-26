## Docker bron

### X86
docker pull robotframework/rfdocker

### X86+ARM64
docker pull fandratt/robotframework

## Run

### Template
docker run -it -v \<host-dir\>:\<container-dir\> \<container-naam\> \<command\>

### Windows
docker run -it -v ${PWD}:/tmp robotframework/rfdocker bash

### Linux/Mac
docker run -it -v $(pwd):/tmp fandratt/robotframework bash

### Check robot
root@dee980ebaa46:/app# robot --version
> Robot Framework 6.1.1 (Python 3.10.12 on linux)

### Run robot tests
> robot --outputdir /tmp/reports /tmp/postcode_test.robot
> 
> robot --outputdir /tmp/reports /tmp/pun.robot
> 
> robot --outputdir /tmp/reports -t "Get Pun By ID" /tmp/pun.robot
>
> robot --outputdir /tmp/reports /tmp/sut_test.robot
