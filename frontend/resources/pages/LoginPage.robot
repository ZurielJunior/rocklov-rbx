*Settings*
Documentation    Elementos da página login

*Variables*
${INPUT_EMAIL}     css=input[placeholder$=email] 
${INPUT_PASS}      css=input[placeholder*="senha"] 
${BUTTON_SIGIN}    text=Entrar
${DIV_ALERT}       .alert 

*Keywords*
Login With
    [Arguments]    ${email}    ${pass}

    Fill Text    ${INPUT_EMAIL}     ${email}
    Fill Text    ${INPUT_PASS}      ${pass}
    Click        ${BUTTON_SIGIN}


Alert Text Should Be
    [Arguments]    ${message}

    Wait For Elements State    ${DIV_ALERT}    visible    5             
    Get Text                   ${DIV_ALERT}    equal      ${message}