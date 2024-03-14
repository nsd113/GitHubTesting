*** Settings ***
Library          SeleniumLibrary
Variables        ../../resources/variables.py
Resource         ../../resources/common.robot

Suite Teardown   Close All Browsers
Test Template    Verifying That User Can't Enter

*** Variables ***
${valid_user_login}         ${USER_LOGIN_CORRECT_AUTO_CHART}
${valid_user_pass}          ${USER_PASS_CORRECT_AUTO_CHART}
${invalid_user_login}       ${USER_LOGIN_INVALID}
${invalid_user_pass}        ${USER_PASS_INVALID}
${empty_user_login}         ${USER_LOGIN_EMPTY}
${empty_user_pass}          ${USER_PASS_EMPTY}


*** Test Cases ***

Wrong User Wrong Pwd        ${invalid_user_login}     ${invalid_user_pass}
    [Documentation]    User login to the system with invalid password
    ...
    ...                *TestRail:*
    ...                [https://project.testrail.io/index.php?/cases/view/2]
    [Tags]             testrailid=2    SeleniumLibrary

Right User Wrong Pwd        ${valid_user_login}      ${invalid_user_pass}
Wrong User Right PWD        ${invalid_user_login}    ${valid_user_pass}
Empty User Empty Pwd        ${empty_user_login}      ${empty_user_pass}
Right User Empty Pwd        ${valid_user_login}      ${empty_user_pass}
Empty User Right Pwd        ${empty_user_login}      ${valid_user_pass}

*** Keywords ***
Verifying That User Can't Enter
    [Documentation]
    ...               *Arguments*
    ...               user_login
    ...               user_pass
    [Arguments]       ${user_login}    ${user_pass}

    Log In To The System    ${user_login}    ${user_pass}
    sleep    2
    Get Element Attribute     //*[@id="js-flash-container"]/div/div/div     Incorrect username or password.
