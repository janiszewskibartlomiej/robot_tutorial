*** Settings ***
Library    SeleniumLibrary
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${Browser}  Chrome
${URL1}  http://www.thetestingworld.com/
${URL2}  http://www.google.com/
${URL3}  http://www.robotframework.org/

*** Test Cases ***
TC_001 handle multiple browser
    Open Browser    ${URL1}    ${Browser}
    Maximize Browser Window
    open browser    ${URL2}    ${Browser}
    Maximize Browser Window
    switch browser    1
    ${b1}=    get location
    log to console    ${b1}
    click element    xpath://a[text()='Login']
    switch browser    2
    ${b2}=    get location
    log to console    ${b2}
    input text    name:q    Test cases
    sleep    2
    close all browsers

TC_002 multiple tabs
    open browser    ${URL3}    ${Browser}
    Maximize Browser Window
    click element    //a[text()='Robohub']
    switch window    Robot Framework
    ${current_url}=    get location
    log to console    ${current_url}
    switch window    Robocorp documentation
    ${current_url}=    get location
    log to console    ${current_url}


    @{list}    get window handles
    FOR    ${window}    IN    @{list}
      switch window    ${window}
      ${url}=    get location
      log to console    ${url}
    END
    sleep    1
    close all browsers

*** Keywords ***
