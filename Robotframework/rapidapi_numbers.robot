*** Settings ***
Library  RequestsLibrary

*** Variables ***
${postal_code}  5038EA
${huisnr}   17
${api_key}  c7ea219f44msh82878f7f296f3cep1ad6f3jsn22554d09b87f

*** Test Cases ***
Happy Flow Test for postcode.nl API
    ${headers}=  Create Dictionary  X-RapidAPI-Key=${api_key}   X-RapidAPI-Host=numbersapi.p.rapidapi.com
    ${params}=  Create Dictionary   fragment=true   json=true
    ${response}=  Get   https://numbersapi.p.rapidapi.com/1492/year  headers=${headers} params=${params}
    Should Be Equal As Strings  ${response.status_code}  200
    ${json_response}=  Parse Json  ${response.content}
    Should Be Equal As Strings  ${json_response[0]['status']}  ok
