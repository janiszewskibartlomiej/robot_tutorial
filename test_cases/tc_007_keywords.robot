*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resources1.robot
Documentation    Dokumentacja pliku
Test Timeout    10s


*** Variables ***
${Browser}  Chrome
${URL1}  http://www.thetestingworld.com/
${URL2}  http://www.google.com/
${URL3}  http://www.robotframework.org/
${URL4}  http://www.thetestingworld.com/testings


*** Test Cases ***
TC_001 keywords without arguments
    [Documentation]    dokumentacja przypadku pierwszego
    [Timeout]    10s    Faild executing first test case
    Start Browser And Maximize
    input text    name:fld_username    Hello Gays
    close browser

TC_002 keywords with arguments
    [Timeout]  2mins 1s
    Start Browser And Maximize with arguments    ${URL4}    ${Browser}
    input text    name:fld_username    Key words with arguments
    sleep    1
    close browser

TC_003 keywords with arguments and return value
    ${Return}=    Start Browser And Maximize With Arguments And Return Value    ${URL4}    ${Browser}
    log to console    ${Return}
    input text    name:fld_username    ${Return}
    sleep    3
    close browser

*** Keywords ***
