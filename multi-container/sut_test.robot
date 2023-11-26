*** Settings ***
Documentation     Example Robot Framework tests for Flask API
Library           RequestsLibrary
Library           String

*** Variables ***
${BASE_URL}        http://localhost:5001

*** Test Cases ***
Verify Hello Endpoint
    ${response}=    Get Request    ${BASE_URL}/
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.json()}    Hello

Verify Health Endpoint
    ${response}=    Get Request    ${BASE_URL}/health
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    I am healthy

Verify Data POST and PUT Endpoints
    ${data}=    Set Variable    {"key": "value"}
    
    # POST request
    ${post_response}=    Post Request    ${BASE_URL}/data    json=${data}
    Should Be Equal As Strings    ${post_response.status_code}    201
    Should Contain    ${post_response.json()}    ${data}
    
    # PUT request
    ${put_response}=    Put Request    ${BASE_URL}/data/123    json=${data}
    Should Be Equal As Strings    ${put_response.status_code}    200
    Should Contain    ${put_response.json()}    {"id": "123", "data": ${data}}
