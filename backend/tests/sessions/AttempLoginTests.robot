* Settings *
Documentation           Sessions Attempt Login Tests

Resource                ${EXECDIR}/resources/Base.robot
Test Template           Attempt Login

* Test Cases *        json_file              status_code    message
Empty email           empty_email.json       412            required email 
Empty password        empty_pass.json        412            required password    
Without email         without_email.json     412            required email       
Without password      without_pass.json      412            required password    
Wrong email           wrong_email.json       412            wrong email          
User Not Found        user_not_found.json    401            Unauthorized         
Incorrect password    incorrect_pass.json    401            Unauthorized


* Keywords *
Attempt Login
    [Arguments]    ${json_file}    ${status_code}    ${message}

    ${payload}          Get Json          sessions   ${json_file}
    ${response}         POST Login        ${payload}
    Status Should Be    ${status_code}    ${response}

    Should Be Equal    ${message}    ${response.json()}[error] 

