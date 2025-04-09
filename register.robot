*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    BuiltIn
Library    JSONLibrary

*** Variables ***
${BASE_URL}                  https://localhost:7262/api
${EMPTY}

@{BODY_SUCESS}              fullname    joao    password    senhaSegura123    email    testes@gmail.com

# Body empty
@{BODY_EMPTY_FULLNAME}      fullname    ${EMPTY}    password    senhaSegura123    email    tesstses@gmail.com
@{BODY_EMPTY_EMAIL}         fullname    teste    password    senhaSegura123    email    ${EMPTY}
@{BODY_EMPTY_PASSWORD}      fullname    teste    password    ${EMPTY}    email    testesss@gmail.com

#Body invalid
@{BODY_INVALID_FULLNAME}      fullname    Anderson123    password    senhaSegura123    email    tesstses@gmail.com
@{BODY_INVALID_EMAIL}         fullname    teste    password    senhaSegura123    email    anderson@.com
@{BODY_INVALID_PASSWORD}      fullname    teste    password    eses    email    testesss@gmail.com
@{BODY_ALREADY_EMAIL}      fullname    teste    password    teste1232    email    testes@gmail.com

# Error Messages empty

${ERROR_EMPTY_FULLNAME}     O campo 'FullName' é obrigatório.
${ERROR_EMPTY_EMAIL}        O campo 'Email' é obrigatório.
${ERROR_EMPTY_PASSWORD}     O campo 'Password' é obrigatório.

# Error Messages invalid

${ERROR_INVALID_EMAIL}     O campo 'Email' não é válido.
${ERROR_INVALID_PASSWORD}  A senha deve ter no mínimo 6 caracteres.
${ERROR_INVALID_FULLNAME}  O campo 'FullName' deve conter apenas letras e espaços, sem números.
${ERROR_ALREADY_EMAIL}  E-mail já cadastrado.


*** Keywords ***
Create Default Session
    [Arguments]    ${session_name}    ${base_url}=${BASE_URL}
    Create Session    ${session_name}    ${base_url}    verify=False

*** Test Cases ***
Register User Successfully
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_SUCESS}
    Create Default Session    minha_sessao
    ${response}=   POST On Session    minha_sessao    /Auth/register    headers=${HEADERS}    json=${BODY}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}

Register User with Empty Fullname
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_EMPTY_FULLNAME}
    Create Default Session    minha_sessao
    ${response}=   POST On Session    minha_sessao    /Auth/register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    ${ERROR_EMPTY_FULLNAME}

Register User with Empty Email
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_EMPTY_EMAIL}
    Create Default Session    minha_sessao
    ${response}=   POST On Session    minha_sessao    /Auth/register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    ${ERROR_EMPTY_EMAIL}

Register User with Empty Password
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_EMPTY_PASSWORD}
    Create Default Session    minha_sessao
    ${response}=   POST On Session    minha_sessao    /Auth/register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    ${ERROR_EMPTY_PASSWORD}


Register User with Invalid FullName
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_INVALID_FULLNAME}
    Create Default Session    minha_sessao
    ${response}=   POST On Session    minha_sessao    /Auth/register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    ${ERROR_INVALID_FULLNAME}


Register User with Invalid Email
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_INVALID_EMAIL}
    Create Default Session    minha_sessao
    ${response}=   POST On Session    minha_sessao    /Auth/register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    ${ERROR_INVALID_EMAIL}


Register User with Invalid Password
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_INVALID_PASSWORD}
    Create Default Session    minha_sessao
    ${response}=   POST On Session    minha_sessao    /Auth/register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    ${ERROR_INVALID_PASSWORD}

    
Register User Already Registered
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY}=       Create Dictionary    @{BODY_ALREADY_EMAIL}
    Create Default Session    minha_sessao
    ${response}=   POST On Session    minha_sessao    /Auth/register    headers=${HEADERS}    json=${BODY}    expected_status=any
    Should Be Equal As Strings    ${response.status_code}    400
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["erros"][0]}    ${ERROR_ALREADY_EMAIL}
