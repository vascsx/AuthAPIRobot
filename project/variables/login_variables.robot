*** Variables ***
${BASE_URL}                        https://localhost:7262/api
${EMPTY}

# Success Login Body
@{BODY_VALID_LOGIN}               email    automacao@gmail.com    password    vasconcelos

# Invalid Body
@{BODY_EMPTY_EMAIL}             email    ${EMPTY}    password    senhaSegura123
@{BODY_EMPTY_PASSWORD}          email    testesss@gmail.com    password    ${EMPTY}

# Error Messages
${ERROR_EMPTY_EMAIL_OR_PASSWORD}    E-mail e senha são obrigatórios.
${ERROR_INVALID_CREDENTIALS}          E-mail ou senha inválidos.

# Success Message
${SUCCESS_WELCOME_MESSAGE}            Bem-vindo Automação Teste!
