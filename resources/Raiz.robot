*** Settings ***
Library    SeleniumLibrary

Resource    C:\\Users\\Robso\\Documents\\desafio_técnico\\projeto_desafio\\resources\\base.resource


Test Setup    Start session
Test Teardown    Finish session
*** Variables ***
${BASE_URL}        https://sampleapp.tricentis.com/101/app.php
${BROWSER}         Chrome
${DELAY}           2s
&{hobbies_array}   terceiro=Cliff Diving    quarto=Skydiving



*** Test Cases ***
Cadastro das informações do veiculo
    [Tags]    happy_path_vehicle
    [Documentation]    Cadastro realizado com sucesso
    ${element}    Set Variable    xpath=//table[@class='ui-datepicker-calendar']//a[text()='4']
    
    Fill vehicle data form    Audi    Moped    250    1500    
    ...                       ${element}    2    Diesel    250    
    ...                       30000    85000    ASX682K    430
    Submit vehicle data form

Cadastro das informacoes do segurado
    [Tags]    happy_path_insurant
    [Documentation]    Cadastro realizado com sucesso

    Go to Enter Insurant Data
    ${element}    Set Variable    xpath=//table[@class='ui-datepicker-calendar']//a[text()='18']
    

    Fill insurant data form    Smith    Blank    ${element}    Male    Rua Dom Pedro II    
    ...                        United States    85512487    Califórnia    Farmer    
    ...                        ${hobbies_array}    www.google.com
    Submit insurant data form