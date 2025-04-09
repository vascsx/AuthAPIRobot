*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    BuiltIn
Library    JSONLibrary
Resource   ../variables/register_variables.robot
Resource   ../keywords/register_keywords.robot

*** Test Cases ***

Register User Successfully
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_SUCESS}
    Create Default Session    my_session
    ${response}=   POST On Session    my_session    /Auth/register    headers=${HEADERS}    json=${BODY}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}

Register User with Empty Fullname
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_EMPTY_FULLNAME}
    Create Default Session    my_session
    ${response}=   POST On Session    my_session    /Auth/register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    ${ERROR_EMPTY_FULLNAME}

Register User with Empty Email
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_EMPTY_EMAIL}
    Create Default Session    my_session
    ${response}=   POST On Session    my_session    /Auth/register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    ${ERROR_EMPTY_EMAIL}

Register User with Empty Password
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_EMPTY_PASSWORD}
    Create Default Session    my_session
    ${response}=   POST On Session    my_session    /Auth/register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    ${ERROR_EMPTY_PASSWORD}


Register User with Invalid FullName
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_INVALID_FULLNAME}
    Create Default Session    my_session
    ${response}=   POST On Session    my_session    /Auth/register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    ${ERROR_INVALID_FULLNAME}


Register User with Invalid Email
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_INVALID_EMAIL}
    Create Default Session    my_session
    ${response}=   POST On Session    my_session    /Auth/register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    ${ERROR_INVALID_EMAIL}


Register User with Invalid Password
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_INVALID_PASSWORD}
    Create Default Session    my_session
    ${response}=   POST On Session    my_session    /Auth/register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    ${ERROR_INVALID_PASSWORD}
Register User Already Registered
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_ALREADY_EMAIL}
    Create Default Session    my_session
    ${response}=   POST On Session    my_session    /Auth/register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    ${ERROR_ALREADY_EMAIL}
