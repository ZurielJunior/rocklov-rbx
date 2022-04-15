*Settings*
Documentation    Login Tests 2

Resource    ${EXECDIR}/resources/Base.robot

Test Setup       Start Session
Test Teardown    Finish Test

*Test Cases*
User Login

    LoginPage.Login With                 rogers@shield.com    pwd123
    DashPage.User Should Be Logged In


Incorrect Password
    [Tags]    attempt_login

    LoginPage.Login With              rogers@shield.com                abc987
    LoginPage.Alert Text Should Be    Usuário e/ou senha inválidos.


User not found
    [Tags]    attempt_login

    LoginPage.Login With              404@yahoo.com                    abc987
    LoginPage.Alert Text Should Be    Usuário e/ou senha inválidos.


Empty email
    [Tags]    attempt_login

    LoginPage.Login With              ${EMPTY}                          abc987
    LoginPage.Alert Text Should Be    Oops. Informe um email válido!


Empty password
    [Tags]    attempt_login

    LoginPage.Login With              rogers@shield.com                   ${EMPTY}    
    LoginPage.Alert Text Should Be    Oops. Informe sua senha secreta!


Incorrect Email
    [Tags]    attempt_login

    LoginPage.Login With              rogers&shield.com                 abc123    
    LoginPage.Alert Text Should Be    Oops. Informe um email válido!

