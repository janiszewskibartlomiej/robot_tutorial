*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Browser}  Chrome


${URL}  http://www.thetestingworld.com/testings

*** Test Cases ***
TC_001 Browser Start and Close
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Input Text    name:fld_username    Testting1
    Input Text    xpath://input[@name='fld_email']  test@test.pl
    Clear Element Text    name:fld_username
    Clear Element Text    xpath://input[@name='fld_email']
    Select Radio Button    add_type    office
    Select Checkbox    name:terms
    Set Selenium Speed    1seconds
    Select From List By Index    name:sex    2
    Select From List By Value    name:sex    1
    Select From List By Label    name:sex    Female
    Click Link    xpath://a[text()='Read Detail']
    Click Element    css:.popup a
    Click Button    css:input[type='submit']
    Enter Username Password Email
    Enter Username Password Email With Data    username    email@email.com    password
    Close Browser
    


*** Keywords ***
Enter Username Password Email
    Input Text    name:fld_username    nameFromKeywords
    Input Text    xpath://input[@name='fld_email']    kewords@keywords.pl
    Input Text    name:fld_password    1234

Enter Username Password Email with data
    [Arguments]    ${username}    ${email}    ${password}
    Input Text    name:fld_username    ${username}
    Input Text    xpath://input[@name='fld_email']    ${email}
    Input Text    name:fld_password    ${password}
