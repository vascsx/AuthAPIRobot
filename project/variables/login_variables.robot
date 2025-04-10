*** Variables ***
${BASE_URL}                        https://localhost:7262/api
${EMPTY}

# Success Login Body
@{BODY_VALID_LOGIN}               email    joao    password    senhaSegura123

# Invalid Body
@{BODY_MISSING_EMAIL}             password    senhaSegura123    email    ${EMPTY}
@{BODY_MISSING_PASSWORD}          email    testesss@gmail.com    password    ${EMPTY}
@{BODY_INVALID_PASSWORD}          email    testesss@gmail.com    password    ${EMPTY}

# Error Messages
${ERROR_MISSING_EMAIL_OR_PASSWORD}    O E-mail e senha são obrigatórios.
${ERROR_INVALID_CREDENTIALS}          E-mail ou senha inválidos.

# Success Message
${SUCCESS_WELCOME_MESSAGE}            $"Bem-vindo {user.FullName}!"
