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

TC_001 get value and text
    input text    name:fld_username    Key words with arguments
    ${val1}=    get value    name:fld_username
    log    ${val1}
    ${text1}=    get text    xpath://a[text()='Read Detail']
    log    ${text1}

TC_002 get value from select or dropdown
    select from list by index    name:sex    1
    ${Val2}=    Get Selected List Value    name:sex
    Log    ${Val2}
    ${Text}=    Get Selected List Label    name:sex
    ${Text2}=    Get Selected List Labels    name:sex
    Log    ${Text}
    Log    ${Text2}
    ${All_labels}=    Get List Items    name:sex
    Log    ${All_labels}

TC_003 get souce attribute count
    ${current_url}=    Get Location
    Log    ${current_url}

    ${source}=    Get Source
    Log    ${source}

    ${class_name}=    get element attribute    name:fld_username    class
    Log    ${class_name}

    ${elements_count}=    get element count    class:field
    Log    ${elements_count}

*** Keywords ***
