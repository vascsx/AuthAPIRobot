*** Keywords ***

Create Default Session
    [Arguments]    ${session_name}    ${base_url}=${BASE_URL}
    Create Session    ${session_name}    ${base_url}    verify=False

Preparar Requisição de Login
    [Arguments]    ${BODY}
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY_DICT}=  Create Dictionary    &{BODY}
    [Return]       ${HEADERS}    ${BODY_DICT}

Validar Resposta do Login
    [Arguments]    ${response}    ${expected_status_code}    ${expected_message}    ${message_key}=erro
    Should Be Equal As Strings    ${response.status_code}    ${expected_status_code}
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["${message_key}"]}    ${expected_message}