* Settings *
Documentation    User Login Test

Resource    ${EXECDIR}/resources/Base.robot

* Test Cases *

User Login

    ${payload}          Get Json      sessions      user_login.json
    ${response}         POST Login    ${payload}
    Status Should Be    200           ${response}

    ${token}            Set Variable    ${response.json()}[user_token]    
    Length Should Be    ${token}        24


# Jogou para o arquivo AttempLoginTestes.robot

# Empty email
#     [Template]    Attempt Login
#     empty_email.json    412    required email 

# Empty password
#     [Template]    Attempt Login
#     empty_pass.json    412    required password    

# Without email
#     [Template]    Attempt Login
#     without_email.json    412    required email    

# Without password
#     [Template]    Attempt Login
#     without_pass.json    412    required password    

# Wrong email
#     [Template]    Attempt Login
#     wrong_email.json    412    wrong email    

# User Not Found
#     [Template]    Attempt Login
#     user_not_found.json    401    Unauthorized    

# Incorrect password
#     [Template]    Attempt Login
#     incorrect_pass.json    401    Unauthorized


# * Keywords *
# Attempt Login
#     [Arguments]    ${json_file}    ${status_code}    ${message}

#     ${payload}          Get Json          ${json_file}
#     ${response}         POST Login        ${payload}
#     Status Should Be    ${status_code}    ${response}

#     Should Be Equal    ${message}    ${response.json()}[error] 

