*Settings*
Documentation    Delete Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

*Test Cases*
Delete A Equipo

    # Dado que eu tenho um equipo cadastrado
    ${token}     Get Token    ZURIEL.RIOS@GMAIL.COM    103544
    ${equipo}    Get Json     equipos                  violino.json

    Remove Equipo    ${equipo}[payload][name]
    ${result}        POST Equipo                 ${equipo}                ${token}
    ${equipo_id}     Set Variable                ${result.json()}[_id]

    # Quando façõ uma requisição GET para a rota equipos
    ${response}     DELETE Equipo        ${token}    ${equipo_id}
    ${response2}    GET Unique Equipo    ${token}    ${equipo_id}

    # Então o código de status deve ser 200
    Status Should Be    204    ${response}
    Status Should Be    404    ${response2}


Equipo Not Found

    ${equipo_id}    Get Mongo Id

    ${token}    Get Token    ZURIEL.RIOS@GMAIL.COM    103544

    ${response}    DELETE Equipo    ${token}    ${equipo_id}

    Status Should Be    204     ${response}