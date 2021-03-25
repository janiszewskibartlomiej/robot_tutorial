*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://www.thetestingworld.com/testings
${Browser}    Chrome

*** Keywords ***
Start Browser and Maximize
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window

Start Browser And Maximize with arguments
    [Arguments]    ${User_URL}    ${User_Browser}
    Open Browser    ${User_URL}    ${User_Browser}
    Maximize Browser Window

Start Browser And Maximize with arguments and return value
    [Arguments]    ${User_URL}    ${User_Browser}
    Open Browser    ${User_URL}    ${User_Browser}
    Maximize Browser Window
    ${Title}=    get title
    log to console    ${Title}
    [Return]    ${Title}

Close browser and return title
    ${Title}=    get title
    close browser
   [Return]    ${Title}

Before Each Test Suite
    Log    Before Each Test Suite

After Each Test Suite
    Log    After Each Test Suite