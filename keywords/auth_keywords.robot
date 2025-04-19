*** Keywords ***
Create Default Session
    [Arguments]    ${session_name}    ${base_url}=${BASE_URL}
    Create Session    ${session_name}    ${base_url}    verify=False
