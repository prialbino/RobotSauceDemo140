*** Settings ***
Library    SeleniumLibrary
Library    DateTime

Resource    cart_page.robot
Resource    inventory_item_page.robot
Resource    inventory_page.robot
Resource    login_page.robot

*** Variables ***
${timeout}    10000ms
${url}        https://www.saucedemo.com
${browser}    Chrome
${date}

*** Keywords ***
Open navigator
    Register Keyword To Run On Failure    Take Screenshot
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5000ms
    Wait Until Element Is Visible    css=.login_logo    ${timeout}

Close navigator
    Sleep    3000ms    #sometimes it is necessary to include this command, 
                       # so the code has some time to do the last action/validation
    Close Browser

Click in the cart
    Click Element    css=[data-test="shopping-cart-link"]
    Wait Until Element Contains    css=[data-test="title"]    Your Cart    ${timeout}

Click on Logout
    Click Button    id=react-burger-menu-btn
    Click Link    id=logout_sidebar_link
    Wait Until Element Is Visible    css=.login_log    ${timeout}

Get Date and time
  # Read date and time of operational system
    ${date} =    Get Current Date
    ${date} =    Convert Date    {date}    result_format=%Y.%m.%d_%H.%M.%S    
  
Take Screenshot
    #[Arguments]    ${screenshot_name}
    #Capture Page Screenshot    screenshots/${TEST_NAME}/${date}/${screenshot_name}.jpg
    ${date} =    Get Current Date
    ${date} =    Convert Date    {date}    result_format=%Y.%m.%d_%H.%M.%S    
  
    Capture Page Screenshot    screenshots/${TEST_NAME}/${date}.jpg