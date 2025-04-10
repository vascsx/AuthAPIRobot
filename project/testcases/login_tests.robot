*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    BuiltIn
Library    JSONLibrary
Resource   ../variables/login_variables.robot
Resource   ../keywords/auth_keywords.robot


*** Test Cases ***

Login User Successfully
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_VALID_LOGIN}
    Create Default Session    my_session
    ${response}=   POST On Session    my_session    /Auth/login    headers=${HEADERS}    json=${BODY}    
    Should Be Equal As Strings    ${response.status_code}    200
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["mensagem"]}    ${SUCCESS_WELCOME_MESSAGE}

Login User Empty Password
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_EMPTY_PASSWORD}
    Create Default Session    my_session
    ${response}=   POST On Session    my_session    /Auth/login    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erro"]}    ${ERROR_EMPTY_EMAIL_OR_PASSWORD}

Login User Empty Email
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_EMPTY_EMAIL}
    Create Default Session    my_session
    ${response}=   POST On Session    my_session    /Auth/login    headers=${HEADERS}    json=${BODY}    expected_status=400
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erro"]}    ${ERROR_EMPTY_EMAIL_OR_PASSWORD}

Login User Unathorized Email
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_UNATHORIZED_EMAIL}
    Create Default Session    my_session
    ${response}=   POST On Session    my_session    /Auth/login    headers=${HEADERS}    json=${BODY}    expected_status=401
    Should Be Equal As Strings    ${response.status_code}    401
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erro"]}    ${ERROR_INVALID_CREDENTIALS}

Login User Unathorized Password
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_UNATHORIZED_PASSWORD}
    Create Default Session    my_session
    ${response}=   POST On Session    my_session    /Auth/login    headers=${HEADERS}    json=${BODY}    expected_status=401
    Should Be Equal As Strings    ${response.status_code}    401
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erro"]}    ${ERROR_INVALID_CREDENTIALS}



