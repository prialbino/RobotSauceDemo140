*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Variables in Page Object are the elements's selectors of a page
${txt_user}    css=[data-test="username"]
${txt_password}    css=[data-test="password"]
${btn_login}    id=login-button

*** Keywords ***
Inform user
    [Arguments]    ${user}
    Input Text    ${txt_user}    ${user}

Inform password
    [Arguments]    ${password}
    Input Password    ${txt_password}    ${password}

Click in the Login button
    Click Button    ${btn_login}