*** Settings ***
Documentation    Página relacionada a dados pessoais

Library    SeleniumLibrary

*** Variables ***
&{hobbies_array}    terceiro=Cliff Diving    quarto=Skydiving


*** Keywords ***
Click Next Month
    Click Element    xpath=//a[@title="Next"]

Click Back Month
    Click Element    xpath=//a[@title="Prev"]

Go to Enter Insurant Data
    Click Element    css=a[name='Enter Insurant Data']


Fill insurant data form
    [Arguments]    ${first_name}    ${last_name}         ${date_of_birth}    
    ...            ${gender}        ${street_address}    ${country}
    ...            ${zip_code}      ${city}              ${occupation}
    ...            ${hobbies}       ${website}           

    Input Text    css=input[name='First Name']    ${first_name}
    Input Text    css=input[name='Last Name']     ${last_name}
    
    Click Element    css=button[id="opendateofbirthcalender"]
    Wait Until Element Is Visible    xpath=//a[@title="Prev"]
    Repeat Keyword    220    Click Back Month
    Click Element        ${date_of_birth}
    
    Click Element                 css=input[value='${gender}'] + span.ideal-radio
    Input Text                    css=input[name='Street Address']      ${street_address}
    Select From List By Value     css=select[name='Country']            ${country}
    Input Text                    css=input[name='Zip Code']            ${zip_code}
    Input Text                    css=input[name='City']                ${city}
    Select From List By Value     css=select[name='Occupation']         ${occupation}


    
    Input Text                    css=input[name='Website']             ${website}
    Choose File    xpath=//button[contains(text(), "Open")]    ./fixtures/bmw_7.jpg
    

Submit insurant data form
    Click Element    css=#nextenterproductdata