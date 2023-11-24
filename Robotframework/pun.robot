*** Settings ***
Library  RequestsLibrary
Library    OperatingSystem

*** Variables ***

*** Test Cases ***
Happy Flow Test for Pun API (https://www.punapi.rest)
    ${response}=  Get   https://punapi.rest/api/pun
    Log    Response: ${response}
    # Parse JSON using Evaluate keyword
    Should Be Equal As Strings  ${response.status_code}  200
    ${json_response}=  Evaluate    json.loads('''${response.content}''')    json
    Log    Parsed JSON: ${json_response}
    Log    ID from response: ${json_response['id']}
    Should Be Equal As Strings  ${json_response['id']}  11
    Log    Pun from response: ${json_response['pun']}
    Should Be Equal As Strings  ${json_response['pun']}  Why shouldnât you trust atoms? They make up everything.

Get Pun By ID
    ${response}=  Get   https://punapi.rest/api/pun/2
    Log    Response: ${response}
    # Parse JSON using Evaluate keyword
    Should Be Equal As Strings  ${response.status_code}  200
    ${json_response}=  Evaluate    json.loads('''${response.content}''')    json
    #Log    Parsed JSON: ${json_response}
    #Log    ID from response: ${json_response['id']}
    Should Be Equal As Strings  ${json_response['id']}  2
    #Log    Pun from response: ${json_response['pun']}
    Should Be Equal As Strings  ${json_response['pun']}  I would avoid the sushi if I was you. Itâ\x80\x99s a little fishy.
