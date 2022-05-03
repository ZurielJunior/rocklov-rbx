*Settings*
Documentation    Arquivo principal do projeto de automação

Library    Browser
Library    Collections
Library    OperatingSystem
Library    libs/mongo.py 

Resource    Helpers.robot
Resource    actions/LoginActions.robot
Resource    actions/EquipoActions.robot
Resource    actions/Components.robot
Resource    Services.robot
Resource    pages/LoginPage.robot
Resource    pages/DashPage.robot


*Keywords*
Start Session
    New Browser          chromium       False    slowMo=00:00:01
    New Page             about:blank
    Set Viewport Size    1920           1080

    Go To    https://rocklov-zuriel-web.herokuapp.com/

Finish Test
    Take Screenshot

Take Screenshot And Logout
    Take Screenshot
    Do Logout

Take Screenshot And Go Back
    Take Screenshot
    Go Back

Login Session
    [Arguments]    ${email}    ${password}

    Start Session
    LoginPage.Login With    ${email}    ${password}
    User Should Be Logged In