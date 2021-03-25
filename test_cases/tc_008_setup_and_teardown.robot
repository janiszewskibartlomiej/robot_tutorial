*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resources1.robot
Documentation    Dokumentacja pliku
Test Timeout    10s
Library    SeleniumLibrary
Resource    ../Resources/resources1.robot
#Documentation    Tests with setup and teardown
Test Setup    Start Browser And Maximize
Test Teardown    Close browser and return title
Suite Setup    Before Each Test Suite
Suite Teardown    After Each Test Suite
Default Tags    DFL
Force Tags    For_ALL_Test_cases

*** Variables ***
${Browser}  Chrome
${URL1}  http://www.thetestingworld.com/
${URL2}  http://www.google.com/
${URL3}  http://www.robotframework.org/
${URL4}  http://www.thetestingworld.com/testings


*** Test Cases ***
TC_001 keywords without arguments
    [Tags]    Smoke
    [Documentation]    dokumentacja przypadku pierwszego
    [Timeout]    10s
    sleep    3
    input text    name:fld_username    Hello Gays
    sleep    3

TC_002 keywords with arguments
    [Tags]    Smoke    Sanity
    [Timeout]  2mins 1s
    sleep    3
    input text    name:fld_username    Key words with arguments
    sleep    3


*** Keywords ***
