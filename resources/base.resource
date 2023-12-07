*** Settings ***
Documentation    Base para a automação

Library    SeleniumLibrary

Resource    pages/EnterVehicleData.robot
Resource    pages/EnterInsurantData.robot

*** Variables ***
${BASE_URL}        https://sampleapp.tricentis.com/101/app.php
${BROWSER}         Chrome
${DELAY}           2s

*** Keywords ***
Start session
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

Finish session
    Capture Page Screenshot
    Close Browser