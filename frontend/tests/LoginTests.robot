*Settings*
Documentation    Login Tests

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Start Session    #LOGAR UMA ÚNICA VEZ
Test Teardown    Finish Test

*Test Cases*
User Login

    LoginActions.Login With     rogers@shield.com    pwd123
    User Should Be Looged In
    [Teardown]      Take Screenshot And Logout


Incorrect Password
    [Tags]    attempt_login

    LoginActions.Login With              rogers@shield.com                 abc987
    LoginActions.Alert Text Should Be    Usuário e/ou senha inválidos. 


User not found
    [Tags]    attempt_login

    LoginActions.Login With              404@yahoo.com                    abc987
    LoginActions.Alert Text Should Be    Usuário e/ou senha inválidos.


Empty email
    [Tags]    attempt_login

    LoginActions.Login With              ${EMPTY}                          abc987
    LoginActions.Alert Text Should Be    Oops. Informe um email válido!


Empty password
    [Tags]    attempt_login

    LoginActions.Login With              rogers@shield.com                   ${EMPTY}
    LoginActions.Alert Text Should Be    Oops. Informe sua senha secreta!


Incorrect Email
    [Tags]    attempt_login

    LoginActions.Login With              rogers&shield.com                 abc987
    LoginActions.Alert Text Should Be    Oops. Informe um email válido!