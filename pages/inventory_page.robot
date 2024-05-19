*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${title_section}    css=.title


*** Keywords ***
Click in the product
    [Arguments]    ${product_name}
    Click Element    css=img[alt="${product_name}"]