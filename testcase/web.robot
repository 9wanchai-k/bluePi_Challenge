*** Settings ***
Resource    ${CURDIR}../../web/data/import.robot
Suite Teardown  Close Browser
*** Test Cases ***
Go to web success
    [Documentation]    as a user, can go to web to do list
    common.Open Website
    home_page.Check go to home page
    home_page.Home page should be show tab bar    Add Item
    home_page.Home page should be show tab bar    To-Do Tasks
    home_page.Home page should be show tab bar    Completed
    Close Browser

Add Item
    [Documentation]    as a user, can add new task and verify that to do task have new task 
    common.Open Website
    home_page.Select tab bar menu                    Add Item
    home_page.Input task in text field               Test-demo
    home_page.Click button add task
    home_page.Select tab bar menu                    To-Do Tasks
    home_page.Verify todo task should be shown       Test-demo
    Close Browser

Delete task on todo task page
    [Documentation]    as a user, can delete task 
    common.Open Website
    home_page.Select tab bar menu                    Add Item
    home_page.Input task in text field               Test-demo
    home_page.Click button add task
    home_page.Select tab bar menu                    To-Do Tasks
    home_page.Verify todo task should be shown       Test-demo
    home_page.Delete todo task by task name          Test-demo
    Close Browser

Add item to completed
    [Documentation]    as a user, can add new task and verify that to do task have new task 
    common.Open Website
    home_page.Select tab bar menu                    Add Item
    home_page.Input task in text field               Test-demo
    home_page.Click button add task
    home_page.Select tab bar menu                    To-Do Tasks
    home_page.Verify todo task should be shown       Test-demo
    home_page.Click check box by task name           Test-demo
    home_page.Select tab bar menu                    Completed
    home_page.Verify task completed by task name     Test-demo
    Close Browser

Delete task on completed
    [Documentation]    as a user, can delete task on completed page
    common.Open Website
    home_page.Select tab bar menu                          Add Item
    home_page.Input task in text field                     Test-demo
    home_page.Click button add task
    home_page.Select tab bar menu                          To-Do Tasks
    home_page.Verify todo task should be shown             Test-demo
    home_page.Click check box by task name                 Test-demo
    home_page.Select tab bar menu                          Completed
    home_page.Verify task completed by task name           Test-demo
    home_page.Delete task completed by task name           Test-demo
    home_page.Verify task completed not show task by task name       Test-demo
    Close Browser