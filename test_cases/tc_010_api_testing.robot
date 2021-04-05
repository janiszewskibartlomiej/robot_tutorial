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

${URL}    http://thetestingworldapi.com
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

TC_004 get request with parameters
    create session    conn    https://reqres.in
    ${param}=    create dictionary    page=2
    ${response}=    get on session     conn    /api/users    params=${param}

    @{name_list}=    jsonlibrary.get value from json    ${response.json()}    data[0].first_name
    log to console   "name list>>" @{name_list}

    ${name}=    get from list    ${name_list}    0
    log to console    name >> ${name}


TC_005 delete request
    create session    connection    ${URL}
    delete request    conn    api/studentsDetails/32


TC_006 post request - new resource
    create session    add_data    ${URL}
    ${body}=    create dictionary    first_name=Bart    middle_name=Jan    last_name=Janisz    date_of_birth=11/11/2000
    ${header}=    create dictionary    Content-Type=application/json


    ${response}=    post on session    add_data    ${end_point}    data=${body}    headers=${header}

    log to console    ${response.status_code}
    log to console    ${response.content}


TC_007 put request - update resource
    create session    up_data    ${URL}
    ${body}=    create dictionary    id=1818    first_name=Bart    middle_name=Jan    last_name=Janisz    date_of_birth=11/11/2000
    ${header}=    create dictionary    Content-Type=application/json


    ${response}=    put on session    up_data    ${end_point}/1818    data=${body}    headers=${header}

    log to console    ${response.status_code}
    log to console    ${response.content}

    ${response1}=    get on session    up_data    ${end_point}/1818

    log to console    ${response1.content}
*** Keywords ***



