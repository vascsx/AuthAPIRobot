*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    BuiltIn
Resource   ../variables/register_variables.robot
Resource   ../resources/keywords/auth_keywords.robot

*** Test Cases ***

Register User Successfully
    ${HEADERS}    ${BODY}=    Preparar Requisicao   ${BODY_SUCESS}	
    ${response}=    Enviar dados de Registro    ${HEADERS}    ${BODY}
    Validar Resposta da API    ${response}    200    ${SUCESS_REGISTER}    mensagem

Register User with Empty Fullname
    ${HEADERS}    ${BODY}=    Preparar Requisicao   ${BODY_EMPTY_FULLNAME}	
    ${response}=    Enviar dados de Registro    ${HEADERS}    ${BODY}
    Validar Resposta da API    ${response}    400    ${ERROR_EMPTY_FULLNAME}    erros

Register User with Empty Email
    ${HEADERS}    ${BODY}=    Preparar Requisicao   ${BODY_EMPTY_EMAIL}	
    ${response}=    Enviar dados de Registro    ${HEADERS}    ${BODY}
    Validar Resposta da API    ${response}    400    ${ERROR_EMPTY_EMAIL}    erros

Register User with Empty Password
    ${HEADERS}    ${BODY}=    Preparar Requisicao   ${BODY_EMPTY_PASSWORD}	
    ${response}=    Enviar dados de Registro    ${HEADERS}    ${BODY}
    Validar Resposta da API    ${response}    400    ${ERROR_EMPTY_PASSWORD}    erros

Register User with Invalid FullName
    ${HEADERS}    ${BODY}=    Preparar Requisicao   ${BODY_INVALID_FULLNAME}	
    ${response}=    Enviar dados de Registro    ${HEADERS}    ${BODY}
    Validar Resposta da API    ${response}    400    ${ERROR_INVALID_FULLNAME}    erros

Register User with Invalid Email
    ${HEADERS}    ${BODY}=    Preparar Requisicao   ${BODY_INVALID_EMAIL}	
    ${response}=    Enviar dados de Registro    ${HEADERS}    ${BODY}
    Validar Resposta da API    ${response}    400    ${ERROR_INVALID_EMAIL}    erros

Register User with Invalid Password
    ${HEADERS}    ${BODY}=    Preparar Requisicao   ${BODY_INVALID_PASSWORD}	
    ${response}=    Enviar dados de Registro    ${HEADERS}    ${BODY}
    Validar Resposta da API    ${response}    400    ${ERROR_INVALID_PASSWORD}    erros

Register User Already Registered
    ${HEADERS}    ${BODY}=    Preparar Requisicao   ${BODY_ALREADY_EMAIL}	
    ${response}=    Enviar dados de Registro    ${HEADERS}    ${BODY}
    Validar Resposta da API    ${response}    400    ${ERROR_ALREADY_EMAIL}    erros
