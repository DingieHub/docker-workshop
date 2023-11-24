*** Settings ***
Library  RequestsLibrary

*** Variables ***
${postal_code}  5038EA
${huisnr}   17
${api_key}  w8ww97Jab79hbKepNamxqa2WqqwJoqAE1xFfwgmE

*** Test Cases ***
Happy Flow Test for postcode.nl API
    ${headers}=  Create Dictionary  X-Api-Key=${api_key}  # Replace with your actual API key
    ${response}=  Get   https://api.postcodeapi.nu/v3/lookup/${postal_code}/${huisnr}  headers=${headers}
    Should Be Equal As Strings  ${response.status_code}  200
    ${json_response}=  Parse Json  ${response.content}
    Should Be Equal As Strings  ${json_response[0]['status']}  ok
    Should Be Equal As Strings  ${json_response[0]['results'][0]['dutchAddress']['municipality']}  Amsterdam
    Should Be Equal As Strings  ${json_response[0]['results'][0]['dutchAddress']['province']}  Noord-Holland

Bad Flow Test for postcode.nl API
    ${headers}=  Create Dictionary  X-Api-Key=${api_key}  # Replace with your actual API key
    ${response}=  Get   https://api.postcodeapi.nu/v3/lookup/6545C/29  headers=${headers}
    Should Be Equal As Strings  ${response.status_code}  400
    ${json_response}=  Parse Json  ${response.content}
    Should Be Equal As Strings  ${json_response[0]['status']}  invalid postcode format
