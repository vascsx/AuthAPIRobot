*** Keywords ***

Create Default Session
    [Arguments]    ${session_name}    ${base_url}=${BASE_URL}
    Create Session    ${session_name}    ${base_url}    verify=False

Preparar Requisicao
    [Arguments]    ${BODY}
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${BODY_DICT}=  Create Dictionary    &{BODY}
    [Return]       ${HEADERS}    ${BODY_DICT}

Validar Resposta da API
    [Arguments]    ${response}    ${expected_status_code}    ${expected_message}    ${message_key}=erro
    Should Be Equal As Strings    ${response.status_code}    ${expected_status_code}
    ${json_body}=  Set Variable    ${response.json()}
    Should Contain    ${json_body["${message_key}"]}    ${expected_message}

Enviar dados de Login
    [Arguments]    ${HEADERS}    ${BODY}
    Create Default Session    my_session    ${BASE_URL}
    ${response}=   POST On Session    my_session    ${LOGIN_URL}    headers=${HEADERS}    json=${BODY}     expected_status=any
    [Return]       ${response}

Enviar dados de Registro
    [Arguments]    ${HEADERS}    ${BODY}
    Create Default Session    my_session    ${BASE_URL}
    ${response}=   POST On Session    my_session    ${REGISTER_URL}    headers=${HEADERS}    json=${BODY}     expected_status=any
    [Return]       ${response}


Enviar dados de Edição
    [Arguments]    ${HEADERS}    ${BODY}  ${id}
    Create Default Session    my_session    ${BASE_URL}
    ${response}=   PUT On Session    my_session    ${EDIT_URL}/${id}    headers=${HEADERS}    json=${BODY}     expected_status=any
    [Return]       ${response}


Enviar dados de Deleção
    [Arguments]    ${HEADERS}    ${id}
    Create Default Session    my_session    ${BASE_URL}
    ${response}=   Delete On Session    my_session    ${DELETE_URL}/${id}    headers=${HEADERS}    expected_status=any
    [Return]       ${response}