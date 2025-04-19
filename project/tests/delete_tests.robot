*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    BuiltIn
Resource   ../variables/delete_variables.robot
Resource   ../keywords/auth_keywords.robot

*** Test Cases ***

Delete User Not Found
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    Create Default Session    my_session
    ${response}=   Delete On Session    my_session    Auth/delete/${id}    headers=${HEADERS}     expected_status=404   
    Should Be Equal As Strings    ${response.status_code}    404
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erro"]}    ${DELETE_NOT_FOUND}

Delete User Successfully
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    Create Default Session    my_session
    ${response}=   Delete On Session    my_session    Auth/delete/3   headers=${HEADERS}     expected_status=200   
    Should Be Equal As Strings    ${response.status_code}    200
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["mensagem"]}    ${DELETE_SUCESS}

