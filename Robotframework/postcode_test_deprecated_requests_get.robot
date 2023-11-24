*** Settings ***
Library  RequestsLibrary

*** Test Cases ***
Happy Flow Test for postcode.nl API
    ${headers}=  Create Dictionary  Authorization=Bearer Ick1NpngIm1t2iuYss8j91o3LU8mnRbF2Ig5Uj4a  # Replace with your actual API key
    ${response}=  Get Request  https://api.postcode.nl/rest/addresses/{postal_code}  headers=${headers}
    Should Be Equal As Strings  ${response.status_code}  200
    ${json_response}=  Parse Json  ${response.content}
    Should Be Equal As Strings  ${json_response[0]['status']}  ok
    Should Be Equal As Strings  ${json_response[0]['results'][0]['dutchAddress']['municipality']}  Amsterdam
    Should Be Equal As Strings  ${json_response[0]['results'][0]['dutchAddress']['province']}  Noord-Holland
