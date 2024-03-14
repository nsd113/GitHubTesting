*** Settings ***
Variables    locators.py
Variables    variables.py
Resource     resources.robot
Library      SeleniumLibrary
Library      Browser

*** Variables ***
${url_test}                 ${URL_TEST}
${browser_chrome}           ${BROWSER_CHROME}
${valid_user_login}         ${USER_LOGIN_CORRECT_AUTO_CHART}
${valid_user_pass}          ${USER_PASS_CORRECT_AUTO_CHART}

*** Keywords ***
Log In To The System
    [Documentation]    CLick the SignIn, input user password and login and clicking sign in
    [Arguments]        ${user_login}=${valid_user_login}    ${user_pass}=${valid_user_pass}
    ...                ${url}=${url_test}    ${browser}=${browser_chrome}

    Opening Browser                 url=${url}
    ...                             browser=${browser}

    Input Credentials to Log In     user_login=${user_login}
    ...                             user_pass=${user_pass}

    Click Sign In
