*** Settings ***
Library    ../Resources/user_keywords.py
Library    RequestsLibrary
Library    Collections
Resource    ../resources/resources1.robot
Test Setup    Start Browser And Maximize
Test Teardown    Close browser and return title

*** Variables ***

${URL}    https://www.thetestingworld.com/testings/
${Browser}    chrome

*** Test Cases ***
TC_001 selenium speed
    set selenium speed    3  # kazdy step w danym tescie bedzie robiony co 3 sekond
    # set browser implicit wait    5   # mozemy ustawic implicit wait globany ta komenda. Wada jest tylko do jedne bierzacego
    # okna przegladarki  aby ustawic o na wszytskie okan stosujemy
    set selenium speed    5
    Input Text    name:fld_username    Testting1
    Input Text    xpath://input[@name='fld_email']  test@test.pl
    Clear Element Text    name:fld_username
    Clear Element Text    xpath://input[@name='fld_email']
    Select Radio Button    add_type    office
    Select Checkbox    name:terms
    Set Selenium Speed    1seconds

TC_002 wait for
    # mozna globalnie ustawic timeout
    set selenium timeout    10
    wait until page contains    Login Or Sign Up To Start    timeout=10
    wait until page contains element    name:fld_username    timeout=10

TC_003 validate text in element
    element text should be    name:fld_username      myusername      message=Text is not matching
    element should contain    name:fld_username      my      message=Subtext is not matching

TC_004 get title and source ...
    ${title}      get title
    log to console    ${title}

    ${source}      get source
    log to console    ${source}

    ${t1}      get text    css:#tab-content1>p
    log to console   "get text" >>> ${t1}

    ${t2}      get element attribute    name:fld_username      placeholder
    log to console   "placeholder >>>" ${t2}

    @{t3}      get list items    countryId
    log to console    "lista >>>"@{t3}

    ${t4}      get selenium speed
    log to console    ${t4}

    set selenium speed    2

    ${t5}      get selenium speed
    log to console    selenium speed >>>${t5}

    ${t6}      get webelement    name:fld_username
    log to console    Webelemnt >>>${t6}

    ${t7}      should be equal as strings    ${title}      Login & Sign Up Forms
    log to console    Assertion is ${t7}

    element should be visible    name:fld_username
    element should be visible    locator=name:fld_usernames    message=Error this elemnt not visible