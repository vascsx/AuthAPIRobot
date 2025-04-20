*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    BuiltIn
Resource   ../variables/edit_variables.robot
Resource   ../resources/keywords/auth_keywords.robot

*** Test Cases ***
Edit User Test
    [Documentation]    Test to edit a user with valid data
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_VALID_EDIT}
    Create Default Session    my_session
    ${response}=   Put On Session    my_session    /Auth/edit/2004    headers=${HEADERS}    json=${BODY}    
    Should Be Equal As Strings    ${response.status_code}    200
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["mensagem"]}    ${EDIT_SUCESS}

Edit Not Found
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_VALID_EDIT}
    Create Default Session    my_session
    ${response}=   Put On Session    my_session    /Auth/edit/900    headers=${HEADERS}    json=${BODY}   expected_status=400
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"]}    ${EDIT_NOT_FOUND}

Edit Already Registered Email
    [Documentation]    Test to edit a user with already registered email
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_INVALID_EDIT}
    Create Default Session    my_session
    ${response}=   Put On Session    my_session    /Auth/edit/1    headers=${HEADERS}    json=${BODY}   expected_status=400
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"]}    ${EDIT_EMAIL_INVALID}

Edit Empty Email
    [Documentation]    Test to edit a user with an empty email
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_EMPTY_EMAIL}
    Create Default Session    my_session
    ${response}=   Put On Session    my_session    /Auth/edit/2    headers=${HEADERS}    json=${BODY}   expected_status=400
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"]}    ${ERROR_EMPTY_EMAIL}



Edit Empty Password
    [Documentation]    Test to edit a user with an empty password
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_EMPTY_PASSWORD}
    Create Default Session    my_session
    ${response}=   Put On Session    my_session    /Auth/edit/1    headers=${HEADERS}    json=${BODY}   expected_status=400
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"]}    ${ERROR_EMPTY_PASSWORD}