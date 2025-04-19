*** Variables ***
${BASE_URL}                        http://10.0.0.12:8080/api
${EMPTY}


@{BODY_VALID_EDIT}        fullname    teste    password    senhaSegura123    email    vascs@gmail.com
@{BODY_INVALID_EDIT}        fullname    teste    password    senhaSegura123    email    anderson@gmail.com


@{BODY_EMPTY_FULLNAME}      fullname    ${EMPTY}    password    senhaSegura123    email    tesstses@gmail.com
@{BODY_EMPTY_EMAIL}         fullname    teste    password    senhaSegura123    email    ${EMPTY}
@{BODY_EMPTY_PASSWORD}      fullname    teste    password    ${EMPTY}    email    testesss@gmail.com


${ERROR_EMPTY_FULLNAME}     O campo 'FullName' é obrigatório.
${ERROR_EMPTY_EMAIL}        O campo 'Email' é obrigatório.
${ERROR_EMPTY_PASSWORD}     O campo 'Password' é obrigatório.

# Error Messages Invalid
${EDIT_NOT_FOUND}      Usuário não encontrado.
${EDIT_SUCESS}      Usuário atualizado!
${EDIT_EMAIL_INVALID}      E-mail já cadastrado.

