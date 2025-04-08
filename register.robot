*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    BuiltIn
Library    OperatingSystem
Library    String
Library    Process
Library    JSONLibrary

*** Variables ***
${BASE_URL}     https://localhost:7262/api/Auth
${HEADERS}      {"Content-Type": "application/json"}

*** Test Cases ***
Register User Successfully
    [Documentation]    Test case to verify successful user registration with valid data.
    ${HEADERS}=  Create Dictionary   Content-Type=application/json
    ${BODY}=     Create Dictionary   fullname=joao   password=senhaSegura123   email=testes@gmail.com
    Create Session    minha_sessao    ${BASE_URL}    verify=False
    ${response}=    POST On Session    minha_sessao    /register    headers=${HEADERS}    json=${BODY}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}

Register User with Empty Fullname
    [Documentation]    Test case to verify user registration fails when 'fullname' is empty. Expected status code: 400.
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    fullname=    password=senhaSegura123    email=tesstses@gmail.com
    Create Session    minha_sessao    ${BASE_URL}    verify=False
    ${response}=    POST On Session    minha_sessao    /register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Log    ${response.status_code}
    Log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=    Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    O campo 'FullName' é obrigatório.

Register User with Empty Email
    [Documentation]    Test case to verify user registration fails when 'email' is empty. Expected status code: 400.
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    fullname=teste    password=senhaSegura123    email=
    Create Session    minha_sessao    ${BASE_URL}    verify=False
    ${response}=    POST On Session    minha_sessao    /register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Log    ${response.status_code}
    Log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=    Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    O campo 'Email' é obrigatório.
