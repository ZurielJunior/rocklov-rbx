* Settings *
Documentation    Signup Tests

# Library    FakerLibrary

Resource    ${EXECDIR}/resources/Base.robot


* Test Cases *
Add New User

    ${payload}              Get Json               Signup    new_user.json
    Remove User By Email    ${payload['email']}

    ${response}         POST User    ${payload}
    Status Should Be    200          ${response}

Duplicated Email

    ${payload}              Get Json               Signup    duplicated.json

    POST User    ${payload}

    ${response}         POST User    ${payload}
    Status Should Be    409          ${response}










#Técnica para enviar email fictício
    # ${email}            FakerLibrary.Free Email

    # ${payload}          Create Dictionary
    # ...                 name=Tony Stark
    # ...                 email=${email}
    # ...                 password=pwd=123

    # ${response}         POST User    ${payload}
    # Status Should Be    200          ${response}