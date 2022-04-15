*Settings*
Documentation    Equipo Tests

Resource    ${EXECDIR}/resources/Base.robot

# Test Setup    Start Session    #UMA SESSÃO POR CASO DE TESTE

Suite Setup      Login Session    eddie@vanhalen.com    pwd123
Test Teardown    Finish Test

*Test Cases*
Add new equipo

    ${equipo}        Get Equipo         violao
    Remove Equipo    ${equipo}[name]

    Log To Console    ${equipo}

    Go To Equipo Form
    Fill Equipo Form            ${equipo}
    Submit Equipo Form          
    Equipo Should Be Visible    ${equipo}[name]


Duplicated equipo
    [Tags]    dup_equipo

    # Dado que o equipo fender já foi cadastrado na minha conta
    ${equipo}              Get Equipo           fender
    # ${token}               Get Token Service    ${EMAIL}    ${PASS}
    Set Token From LS
    POST Equipo Service    ${equipo}            ${TOKEN}    

    # Quando faço o cadastro desse equipo
    Go To Equipo Form
    Fill Equipo Form      ${equipo}
    Submit Equipo Form    

    # Então devo ver a mensagem de alerta : Anúncio já existe :/
    Components.Alert Text Should Be    Anúncio já existe :/

    # #Volta para a página anterior
    # Go Back

    [Teardown]    Take Screenshot And Go Back


Required Fields
    [Tags]    required

    @{expected_alerts}    Create List
    ...                   Adicione uma foto no seu anúncio.    
    ...                   Informe a descrição do anúncio.      
    ...                   Escolha uma categoria.               
    ...                   Informe o valor da diária.

    @{got_alerts}    Create List

    Go To Equipo Form
    Submit Equipo Form

    FOR               ${position}                     IN RANGE       1    5
    ${text}           Get Text For Required Alerts    ${position}
    Append To List    ${got_alerts}                   ${text}
    END

    Log    ${got_alerts}

    Lists Should Be Equal    ${got_alerts}    ${expected_alerts}    

    # Alert Form Should Be    Adicione uma foto no seu anúncio.
    # Alert Form Should Be    Informe a descrição do anúncio.
    # Alert Form Should Be    Escolha uma categoria.
    # Alert Form Should Be    Informe o valor da diária.

