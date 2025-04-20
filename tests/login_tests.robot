*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    BuiltIn
Resource   ../variables/login_variables.robot
Resource   ../resources/keywords/auth_keywords.robot

*** Test Cases ***

Login User Successfully
    ${HEADERS}    ${BODY}=    Preparar Requisicao     ${BODY_VALID_LOGIN}
    ${response}=    Enviar dados de Login    ${HEADERS}    ${BODY}
    Validar Resposta da API    ${response}    200    ${SUCCESS_WELCOME_MESSAGE}    mensagem

Login User Empty Password
    ${HEADERS}    ${BODY}=    Preparar Requisicao    ${BODY_EMPTY_PASSWORD}
    ${response}=    Enviar dados de Login    ${HEADERS}    ${BODY}
    Validar Resposta da API    ${response}    401    ${ERROR_EMPTY_EMAIL_OR_PASSWORD}

Login User Empty Email
    ${HEADERS}    ${BODY}=    Preparar Requisicao     ${BODY_EMPTY_EMAIL}
    ${response}=    Enviar dados de Login     ${HEADERS}    ${BODY}
    Validar Resposta da API    ${response}    401    ${ERROR_EMPTY_EMAIL_OR_PASSWORD}

Login User Unauthorized Email
    ${HEADERS}    ${BODY}=    Preparar Requisicao     ${BODY_UNATHORIZED_EMAIL}
    ${response}=    Enviar dados de Login    ${HEADERS}    ${BODY}
    Validar Resposta da API    ${response}    401    ${ERROR_INVALID_CREDENTIALS}

Login User Unauthorized Password
    ${HEADERS}    ${BODY}=    Preparar Requisicao     ${BODY_UNATHORIZED_PASSWORD}
    ${response}=    Enviar dados de Login    ${HEADERS}    ${BODY}
    Validar Resposta da API    ${response}    401    ${ERROR_INVALID_CREDENTIALS}