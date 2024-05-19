*** Settings ***
Library    SeleniumLibrary

Test Teardown    Close Browser

*** Variables ***
${url}    https://www.saucedemo.com/
${browser}    Chrome
${timeout}    10000ms

*** Test Cases ***
#frases > coordena as keyword na ordem que quero que aconteca
Select Sauce Labs Backpack
    Give I access the SauceDemo website
    When I inform the user    standard_user
    And inform the password    secret_sauce
    And click on the Login button
    Then I am in the products page
    When I click in the product    Sauce Labs Backpack    $29.99
    Then I am in the product page
    When I add the product to the cart
    Then I check the products quantity into the cart    1
    When I click in the icon cart
    Then I am in the cart page
    When I click in the menu burger
    And I click in Logout
    Then I am in the login page

Select Sauce Labs Backpack Login with Enter
    Give I access the SauceDemo website
    When I inform the user    standard_user
    And inform the password    orange
    And type Enter 

*** Keywords ***
Give I access the SauceDemo website
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5000ms                # 10seconds
    Wait Until Element Is Visible    css=.login_logo    ${timeout}

When I inform the user
    [Arguments]    ${username}
    Input Text     css=[data-test="username"]    ${username}

And inform the password
    [Arguments]    ${password}
    Input Password    css=[data-test="password"]    ${password}

And click on the Login button
    Click Button    id=login-button    

And type Enter
    Press Key    css=[data-test="password"]    ENTER

Then I am in the products page
  # Wait Until Element Is Visible    css=.title    ${timeout}
  # Element Text Should Be    css=.title    Products
  # a linha abaixo substitui as duas acima
    Wait Until Element Contains    css=.title    Products    ${timeout}

When I click in the product
    [Arguments]    ${product_name}    ${product_price}
    Set Test Variable    ${test_product_name}    ${product_name}
    Set Test Variable    ${test_product_price}    ${product_price}
    Click Element    css=img[alt="${test_product_name}"]

Then I am in the product page
    Wait Until Element Is Visible    name=back-to-products    ${timeout}
    Element Text Should Be    name=back-to-products    Back to products
    Element Text Should Be    css=div.inventory_details_name.large_size    ${test_product_name}
    Element Text Should Be    css=div.inventory_details_price    ${test_product_price}

When I add the product to the cart
    Click Element    css=button.btn.btn_primary.btn_small.btn_inventory

Then I check the products quantity into the cart
    [Arguments]    ${cart_items}
    Set Test Variable    ${test_cart_items}    ${cart_items}
    Element Text Should Be    css=span.shopping_cart_badge    ${test_cart_items}

When I click in the icon cart
    Click Link    ${test_cart_items}
Then I am in the cart page
    Wait Until Element Contains    css=.title    Your Cart
    Element Text Should Be    css=div.inventory_item_name    ${test_product_name}
    Element Text Should Be    css=div.inventory_item_price    ${test_product_price}
    Element Text Should Be    css=div.cart_quantity    ${test_cart_items}
    
When I click in the menu burger
    Click Element    id=react-burger-menu-btn

And I click in Logout
    Click Element    link=Logout

Then I am in the login page
    Wait Until Element Is Visible    css=input.submit-button.btn_action    5000ms