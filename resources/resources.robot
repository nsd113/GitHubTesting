*** Settings ***
Library      SeleniumLibrary
Library      String
Library      BuiltIn
Library      Collections
Library      OperatingSystem
Library      DateTime
Variables    variables.py
Variables    locators.py

*** Variables ***
${url}                ${URL_TEST}
${browser}            ${BROWSER_CHROME}

*** Keywords ***
Opening Browser
    [Documentation]   Open the browser, maximize the window and waiting for the page to load for 4 sec
    ...               *Arguments*
    ...               - url: website wich will be open
    ...               - browser: the browser that is being checked
    [Arguments]       ${url}    ${browser}

    SeleniumLibrary.Open Browser    ${url}    ${browser}
    Sleep     2
    Element Should Be Visible    ${login_button_main_page_loc}

Closing Browser
    [Documentation]  Closing the browser after the test is completed
    SeleniumLibrary.Close Browser

Input Credentials to Log In
    [Documentation]   Input credentias to the login form
    [Arguments]       ${user_login}    ${user_pass}

    Click Element     ${login_button_main_page_loc}
    Sleep    2

    Input Text        ${user_name_input_loc}   ${user_login}
    Input Password    ${user_pass_input_loc}   ${user_pass}

Click Sign In
    [Documentation]   Click sign in button after inputting of userlogin and userpass. Allows to sign into webinterface
    Click Button    ${log_in_to_website_loc}

Sign Out Of Web Interface
    [Documentation]   Sign out user from the system

    Click Element             ${user_menu_button_loc}
    Click Element             ${logout_button_loc}
    Sleep    1
    Click Element             ${logout_confirm}
    Get Element Attribute     ${login_button_main_page_loc}    Sign in

