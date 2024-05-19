*** Settings ***
# o Selenium sera chamado do base_page, por isso nao sera incluido aqui
Resource    ../../pages/base_page.robot

Test Setup    base_page.Open navigator
Test Teardown    base_page.Close navigator

*** Test Cases ***
Select Backpack
    Inform user    standard_user
    Inform password    secret_sauce
    Click in the Login button
    Element Text Should Be    ${title_section}    Products
    Click in the product    Sauce Labs Backpack
    Element Text Should Be    ${inventory_item_product_name}    Sauce Labs Backpack
    Element Text Should Be    ${inventory_item_product_price}    $29.99
    Click in the button "Add to cart"
    Click in the cart
    Element Text Should Be    ${title_section}    Your Cart
    Element Text Should Be    ${cart_product_name}    Sauce Labs Backpack
    Element Text Should Be    ${cart_product_price}    $29.99
    Element Text Should Be    ${cart_product_quantity}    1
    Click on Logout
