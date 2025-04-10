*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    BuiltIn
Library    JSONLibrary
Resource   ../variables/register_variables.robot
Resource   ../keywords/auth_keywords.robot

*** Test Cases ***

Register User Successfully
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_SUCESS}
    Create Default Session    my_session
    ${response}=   POST On Session    my_session    /Auth/register    headers=${HEADERS}    json=${BODY}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}
