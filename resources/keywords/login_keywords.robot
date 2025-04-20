*** Keywords ***

Enviar dados de Login
    [Arguments]    ${HEADERS}    ${BODY}
    Create Default Session    my_session    ${BASE_URL}
    ${response}=   POST On Session    my_session    ${LOGIN_URL}    headers=${HEADERS}    json=${BODY}     expected_status=any
    [Return]       ${response}
