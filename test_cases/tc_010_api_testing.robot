# pip install robotframework-requests

*** Settings ***
Library    ../Resources/user_keywords.py
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource    ../resources/resources1.robot
Test Setup    Start Browser And Maximize
Test Teardown    Close browser and return title

*** Variables ***

${URL}    http://thetestingworldapi.com/
${end_point}    api/studentsDetails
${id}    117695

*** Test Cases ***
TC_001 get request
    create session    connection    ${URL}
    ${response}=    get on session    connection    ${end_point}
    log to console    ${response}
    log to console    ${response.status_code}
    log to console    ${response.content}


TC_002 get request by id
    create session    connection    ${URL}
    ${response}=    get on session    connection    ${end_point}/${id}
    log to console    ${response}
    ${status}=  convert to string    ${response.status_code}
    log to console    ${response.content}

    should be equal    ${status}    200


TC_003 get request by json
    create session    connection    ${URL}
    ${response}=    get on session    connection    ${end_point}/${id}
    log to console  ${response.json()}

    ${first_name}=    get value from json    ${response.json()}    data.first_name
    log to console    ${first_name}

    ${last_name}=    Get Value From Json    ${response.json()}    data.last_name
    log to console    ${last_name}


*** Keywords ***



