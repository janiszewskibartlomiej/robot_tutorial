*** Settings ***
Library    ../Resources/user_keywords.py
Library    SikuliLibrary    mode=NEW    #pip install robotframework-SikuliLibrary
# https://github.com/rainmanwy/robotframework-SikuliLibrary
Resource    ../resources/resources1.robot
Test Setup    Start Browser And Maximize
Test Teardown    Close browser and return title

*** Test Cases ***
TC_001 def without return and arguments
    create_folder
    # nie terzeba tworzyc keywords zeby kozystac z definicji nawet z argumentami, czy z return
    Log    "Create folder is done"

TC_002 def with arguments
    create_sub_folder    Subfolder
    Log    "Create folder is done"

TC_003 def with argument and use keyword
    Create Sub Folder With Name    dict_with_keyword

TC_004 def return value
    [Documentation]    nazwa definicji z podkreśleniami
    ${return_name}=    user_keywords.create_sub_folder_and_return_name    return_test4
    log    ${return_name}

TC_005 def return value
    [Documentation]    nazwa definicji bec podkreśleń
    ${return_name}=    create sub folder and return name    return_test3
    log    ${return_name}


TC_006 def return value
    ${name}=    Create Sub Folder And Return Name folder   return_test1
    log    ${name}

TC_007 BDD version
    Given Start Browser And Maximize
    When Create sub Folder with name    BDD
    Then Create Sub Folder And Return Name folder    Sub_BDD

TC_008 test with sekuli - use view to locate element
    Start Sikuli Process
    Add Image Path   Path_to_images_location
    Click    image_name.png


*** Keywords ***

Create sub Folder with name
    [Arguments]    ${folder_name}
    create_sub_folder    ${folder_name}

Create Sub Folder And Return Name folder
    [Arguments]    ${folder_name}
    ${name}=    create_sub_folder_and_return_name    ${folder_name}
    Log    ${name}
    [Return]    ${name}

