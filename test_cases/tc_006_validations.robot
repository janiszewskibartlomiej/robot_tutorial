*** Settings ***
Library    SeleniumLibrary
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${Browser}  Chrome
${URL1}  http://www.thetestingworld.com/
${URL2}  http://www.google.com/
${URL3}  http://www.robotframework.org/
${URL4}  http://www.thetestingworld.com/testings

*** Test Cases ***
TC_001 contains validation
    Open Browser    ${URL1}    ${Browser}
    Maximize Browser Window
    page should contain    VIDEOS
    page should not contain    VIDEOSS
    click element    xpath://a[text()='Login']
    close browser

TC_002 contains textfield validation
    Open Browser    ${URL1}    ${Browser}
    Maximize Browser Window
    click element    xpath://a[text()='Login']
    page should contain textfield    name:username
    page should not contain textfield    name:username11
    input text    name:username    testField
    close browser

TC_003 checkbox validation
    Open Browser    ${URL1}    ${Browser}
    Maximize Browser Window
    click element    xpath://a[text()='Login']
    checkbox should not be selected    name:remember
    click element    name:remember
    checkbox should be selected    name:remember
    close browser

TC_004 element text validation
    Open Browser    ${URL4}    ${Browser}
    Maximize Browser Window
    element should contain    css:#tab-content1 > p   Register now
    element should not contain    css:#tab-content1 > p   RRRRegister now
    element text should be    css:#tab-content1 > p   Register now and kick start your career as a Software Testing Pro!
    element text should not be   css:#tab-content1 > p   RRRRRegister now and kick start your career as a Software Testing Pro!
    close browser

TC_005 title visible enale
    Open Browser    ${URL4}    ${Browser}
    Maximize Browser Window
    title should be      Login & Sign Up Forms
    element should be visible  name:fld_username
    element should be enabled    css:input[type='submit']
    element should be disabled    name:fld_username

    close browser


*** Keywords ***
