*** Settings ***
Documentation    Página relacionada ao cadastro do veículo

Library    SeleniumLibrary

*** Keywords ***
Click Next Month
    Click Element    xpath=//a[@title="Next"]

Click Back Month
    Click Element    xpath=//a[@title="Prev"]

Right Hand Drive Affirmative
    Click Element    xpath=//label[text()='Right Hand Drive']/following-sibling::p//label[input[@value='Yes']]/span

Left Hand Drive Negative
    Click Element    xpath=//label[text()='Right Hand Drive']/following-sibling::p//label[input[@value='No']]/span




Fill vehicle data form
    [Arguments]    ${make}                  ${model}                  ${cylinder_capacity}
    ...            ${engine_performance}    ${date_of_manufacture}    ${number_of_seats}
    ...            ${fuel_type}             ${payload}                ${total_weight}    
    ...            ${list_price}            ${license_plate_number}   ${annual_mileage}

    Select From List By Value    css=select[name='Make']                ${make}
    Select From List By Value    css=select[name='Model']               ${model}
    Input Text                   css=input[id='cylindercapacity']       ${cylinder_capacity}
    Input Text                   css=input[id='engineperformance']      ${engine_performance}

    Click Element                xpath=//button[@class="ui-datepicker-trigger"]
    Click Back Month
    Click Element        ${date_of_manufacture}

    Right Hand Drive Affirmative
    
    Select From List By Value    css=select[name='Number of Seats']    ${number_of_seats}
    Select From List By Value    css=select[name='Fuel Type']          ${fuel_type}
    
    
    Input Text    xpath=//input[@name='Payload']                 ${payload}
    Input Text    xpath=//input[@name="Total Weight"]            ${total_weight}
    Input Text    xpath=//input[@name="List Price"]              ${list_price}
    Input Text    xpath=//input[@name="License Plate Number"]    ${license_plate_number}
    Input Text    xpath=//input[@name="Annual Mileage"]          ${annual_mileage}

Submit vehicle data form
    Click Element    xpath=//button[contains(text(), "Next")]