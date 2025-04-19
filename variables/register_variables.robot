*** Variables ***
${BASE_URL}                        http://10.0.0.12:8080/api
${EMPTY}
${REGISTER_URL}             /Auth/register

@{BODY_SUCESS}              fullname    Automação teste    password    meuamor    email    anderson@gmail.com 

# Body empty
@{BODY_EMPTY_FULLNAME}      fullname    ${EMPTY}    password    senhaSegura123    email    tesstses@gmail.com
@{BODY_EMPTY_EMAIL}         fullname    teste    password    senhaSegura123    email    ${EMPTY}
@{BODY_EMPTY_PASSWORD}      fullname    teste    password    ${EMPTY}    email    testesss@gmail.com

#Body invalid
@{BODY_INVALID_FULLNAME}      fullname    Anderson123    password    senhaSegura123    email    tesstses@gmail.com
@{BODY_INVALID_EMAIL}         fullname    teste    password    senhaSegura123    email    anderson@.com
@{BODY_INVALID_PASSWORD}      fullname    teste    password    eses    email    testesss@gmail.com
@{BODY_ALREADY_EMAIL}         fullname    teste    password    teste1232    email    testes@gmail.com

# Error Messages empty

${ERROR_EMPTY_FULLNAME}     O campo 'FullName' é obrigatório.
${ERROR_EMPTY_EMAIL}        O campo 'Email' é obrigatório.
${ERROR_EMPTY_PASSWORD}     O campo 'Password' é obrigatório.

# Error Messages invalid

${ERROR_INVALID_EMAIL}     O campo 'Email' não é válido.
${ERROR_INVALID_PASSWORD}  A senha deve ter no mínimo 6 caracteres.
${ERROR_INVALID_FULLNAME}  O campo 'FullName' deve conter apenas letras e espaços, sem números.
${ERROR_ALREADY_EMAIL}     E-mail já cadastrado.
