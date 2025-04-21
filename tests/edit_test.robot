*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    BuiltIn
Resource   ../variables/edit_variables.robot
Resource   ../resources/keywords/auth_keywords.robot

*** Test Cases ***

Edit User Test
    ${HEADERS}    ${BODY}=    Preparar Requisicao     ${BODY_VALID_EDIT}  
    ${response}=    Enviar dados de Edição  ${HEADERS}    ${BODY}   1
    Validar Resposta da API  ${response}  200  ${EDIT_SUCESS}  mensagem  

Edit Not Found
   ${HEADERS}    ${BODY}=    Preparar Requisicao     ${BODY_VALID_EDIT}  
   ${response}=    Enviar dados de Edição  ${HEADERS}    ${BODY}   1000
   Validar Resposta da API  ${response}  400  ${EDIT_NOT_FOUND}  erros  


Edit Empty Email
   ${HEADERS}    ${BODY}=    Preparar Requisicao     ${BODY_EMPTY_EMAIL}  
   ${response}=    Enviar dados de Edição  ${HEADERS}    ${BODY}   2
   Validar Resposta da API  ${response}  400  ${ERROR_EMPTY_EMAIL}  erros  


Edit Empty Password
   ${HEADERS}    ${BODY}=    Preparar Requisicao     ${BODY_EMPTY_PASSWORD}  
   ${response}=    Enviar dados de Edição  ${HEADERS}    ${BODY}   2
   Validar Resposta da API  ${response}  400  ${ERROR_EMPTY_PASSWORD}  erros 

Edit Already Registered Email
    ${HEADERS}    ${BODY}=    Preparar Requisicao     ${BODY_INVALID_EDIT}  
    ${response}=    Enviar dados de Edição  ${HEADERS}    ${BODY}   2
    Validar Resposta da API  ${response}  400  ${EDIT_EMAIL_INVALID}  erros 
