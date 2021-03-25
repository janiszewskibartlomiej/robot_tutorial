*** Settings ***
Library    SeleniumLibrary
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${Browser}  Chrome
${URL}  http://www.thetestingworld.com/testings

*** Test Cases ***
TC_001 selenium speed and sleep
    ${speed}=    get selenium speed
    log to console    ${speed}
    Open Browser    ${URL}    ${Browser}
    sleep    5 seconds
    Maximize Browser Window
    set selenium speed    5 seconds
    input text    name:fld_username    Testing
    input text    name:fld_email    Testing@testing.com
    input text    name:fld_password    TestingPassword
    ${speed}=    get selenium speed
    log to console    ${speed}
    close browser

TC_002 selenium timeout
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    ${tm}=    get selenium timeout
    log to console    ${tm}
    set selenium timeout    10 seconds
    ${tm}=    get selenium timeout
    log to console    ${tm}
    wait until page contains    Testing
    input text    name:fld_username    Testing
    input text    name:fld_email    Testing@testing.com
    input text    name:fld_password    TestingPassword
    close browser

TC_003 implicitly wait
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    ${tm}=    get selenium implicit wait
    log to console    ${tm}
    set selenium implicit wait    10 seconds
    ${tm}=    get selenium implicit wait
    log to console    ${tm}
    input text    name:fld_username    Testing
    input text    name:fld_email    Testing@testing.com
    input text    name:fld_password    TestingPassword
    close browser

*** Keywords ***
