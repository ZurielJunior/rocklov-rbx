Documentation    Login Actions



*Keywords*
Login With
    [Arguments]    ${email}    ${pass}

    Fill Text    css=input[placeholder$=email]      ${email}
    Fill Text    css=input[placeholder*="senha"]    ${pass}
    Click        text=Entrar

Do Logout
    Click   css=.do-Logout
    

User Should Be Looged In
    Wait For Elements State    css=.dashboard    visible    5    Login error

Alert Text Should Be
    [Arguments]    ${message}

    Wait For Elements State    ${DIV_ALERT}    visible    5             
    Get Text                   ${DIV_ALERT}    equal      ${message}


