*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    BuiltIn
Resource   ../variables/delete_variables.robot
Resource   ../resources/keywords/auth_keywords.robot

*** Test Cases ***

Delete User Not Found
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    Create Default Session    my_session
    ${response} =  Enviar dados de Deleção  ${HEADERS}  1000
    Validar Resposta da API  ${response}  404  ${DELETE_NOT_FOUND}  erro

Delete User Successfully
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    Create Default Session    my_session
    ${response} =  Enviar dados de Deleção   ${HEADERS}  2
    Validar Resposta da API  ${response}  200  ${DELETE_SUCESS}  mensagem


