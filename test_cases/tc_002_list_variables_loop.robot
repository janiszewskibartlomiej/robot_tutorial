*** Settings ***
Library    SeleniumLibrary
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${Browser}  Chrome


${URL}  http://www.thetestingworld.com/testings

*** Test Cases ***
TC_002 Variabe Test
    ${Var1}=    set variable    HelloWord
    log to console    ${Var1}


TC_003 Variable list
    @{List1}    create list   Hello    22    23.23    World    Abcd234
    ${list_lenght}    get length    ${List1}
    log to console    ${list_lenght}
    ${list_data}=    get from list    ${List1}    2
    log to console    ${list_data}

TC_004 loop
    FOR    ${i}    IN RANGE    1    10
       log to console    ${i}
       END

TC_005 volume of list
    @{List2}    create list   Hello    22    23.23    World    Abcd234
    log to console    ${List2}
    FOR    ${e}  IN  @{List2}
      log to console  ${e}
    END

TC_006 variavke test
    ${var1}=  set variable    log to console
    run keyword    ${var1}    test printowania

    ${var}=    set variable    NO
    run keyword if    '${var}' == 'YES'    log to console    Value Found
    run keyword if    '${var}' == 'NO'    log to console    Value Not Found


*** Keywords ***
