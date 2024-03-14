*** Settings ***
Library      SeleniumLibrary
Variables    ../../resources/locators.py
Variables    ../../resources/variables.py
Resource     ../../resources/common.robot

Suite Teardown    Closing Browser

*** Variables ***
${valid_user_login}         ${USER_LOGIN_CORRECT_AUTO_CHART}
${valid_user_pass}          ${USER_PASS_CORRECT_AUTO_CHART}


*** Test Cases ***
Log In To The System With Valid Credentials
    [Documentation]    User login to the system with valid password for user from Auto-chart usergroup
    ...
    ...                *TestRail:*
    ...                [https://p.testrail.io/index.php?/cases/view/4]
    [Tags]             testrailid=4

    Log In To The System            user_login=${valid_user_login}
    ...                             user_pass=${valid_user_pass}

