*** Settings ***
Library      SeleniumLibrary
Variables    ../../resources/locators.py
Variables    ../../resources/variables.py
Resource     ../../resources/common.robot

Test Setup        Test Setup
Suite Teardown    Closing Browser

*** Variables ***
${valid_user_login}         ${USER_LOGIN_CORRECT_AUTO_CHART}
${valid_user_pass}          ${USER_PASS_CORRECT_AUTO_CHART}


*** Test Cases ***
Logout From The Web Interface
    [Documentation]    User logout from the system
    ...
    ...                *TestRail:*
    ...                [https://pr.testrail.io/index.php?/cases/view/5]
    [Tags]             testrailid=5    SeleniumLibrary

    Sign Out Of Web Interface


*** Keywords ***
Test Setup
    [Documentation]    Preparing the Test Environment
    Log In To The System            user_login=${valid_user_login}
    ...                             user_pass=${valid_user_pass}



