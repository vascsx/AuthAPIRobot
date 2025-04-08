*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    BuiltIn
Library    JSONLibrary

*** Variables ***
${BASE_URL}           https://localhost:7262/api
${EMPTY}

@{BODY_SUCESS}         fullname    joao    password    senhaSegura123    email    testes@gmail.com
@{BODY_EMPTY_FULLNAME}    fullname    ${EMPTY}    password    senhaSegura123    email    tesstses@gmail.com
@{BODY_EMPTY_EMAIL}   fullname    teste    password    senhaSegura123    email    ${EMPTY}

${ERROR_EMPTY_FULLNAME}    O campo 'FullName' é obrigatório.
${ERROR_EMPTY_EMAIL}       O campo 'Email' é obrigatório.

*** Test Cases ***
Register User Successfully
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_SUCESS}
    Create Session    minha_sessao    ${BASE_URL}    verify=False
    ${response}=    POST On Session    minha_sessao    /Auth/register    headers=${HEADERS}    json=${BODY}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}

Register User with Empty Fullname
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_EMPTY_FULLNAME}
    Create Session    minha_sessao    ${BASE_URL}    verify=False
    ${response}=    POST On Session    minha_sessao    /Auth/register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=    Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    ${ERROR_EMPTY_FULLNAME}

Register User with Empty Email
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_EMPTY_EMAIL}
    Create Session    minha_sessao    ${BASE_URL}    verify=False
    ${response}=    POST On Session    minha_sessao    /Auth/register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=    Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    ${ERROR_EMPTY_EMAIL}
