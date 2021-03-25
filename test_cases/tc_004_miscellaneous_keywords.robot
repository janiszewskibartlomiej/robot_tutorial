*** Settings ***
Library    SeleniumLibrary
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${Browser}  Chrome
${URL}  http://www.thetestingworld.com/testings

*** Test Cases ***
TC_001 screenshot
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    input text    name:fld_username    Testing
    input text    name:fld_email    Testing@testing.com
    input text    name:fld_password    TestingPassword
    capture page screenshot    ./snapshots/tc001.png
    close browser

TC_002 close all browser
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    input text    name:fld_username    Testing
    input text    name:fld_email    Testing@testing.com
    input text    name:fld_password    TestingPassword
    Open Browser    https://www.google.com    chrome
    close all browsers

TC_002 go to back get current url
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    ${current_url}=    get location
    log to console    ${current_url}
    input text    name:fld_username    Testing
    input text    name:fld_email    Testing@testing.com
    input text    name:fld_password    TestingPassword
    go to    https://www.google.com
    ${current_url}=    get location
    log to console    ${current_url}
    go back
    close browser

TC_003 execute JS
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    input text    name:fld_username    Testing
    input text    name:fld_email    Testing@testing.com
    input text    name:fld_password    TestingPassword
    execute javascript    window.scrollTo(0,1000)
    sleep    5 seconds
    close browser

TC_004 mose cases
    Open Browser    http://www.thetestingworld.com/    ${browser}
    maximize browser window
#    open context menu    css:#menu494
#    sleep    2
#    double click element    xpath://a[text()='Login']
#    go back
#    sleep    1
    mouse down    xpath://a[text()='Login']
    sleep    1
    mouse up    xpath://a[text()='Login']
    sleep    1
    mouse over    css:#menu494
    close browser
    sleep    1
    close browser

TC_005 keboard permorm
    Open Browser    http://www.thetestingworld.com/    ${browser}
    maximize browser window
    set selenium timeout    10 seconds
    wait until page contains    Login
    wait until page contains element    xpath://a[text()='Login']
    wait until element is visible    xpath://a[text()='Login']
    wait until element is enabled    xpath://a[text()='Login']
    wait until element contains    xpath://a[text()='Login']    Login
    click link    xpath://a[text()='Login']
    press keys    name:username  hello
    press keys    xpath://button[@type='submit']    \\13
    sleep    3
    close browser


*** Keywords ***
