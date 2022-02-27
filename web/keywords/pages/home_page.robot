*** Settings ***
Resource    ../../data/import.robot

*** Keywords ***
Check go to home page
    [Documentation]    Check go to login page when open link
    Wait until element is visible              xpath=//h1[.="To Do List"]

Home page should be show tab bar 
    [Documentation]    Home page should be show
    [Arguments]    ${text}
    Wait until element is visible    xpath=//a[.="${text}"]

Home page should be show text field input 
    [Documentation]    Home page text field should be
    Wait until element is visible    id=new-task

Home page should be shown button
    [Documentation]    Home page should be shown button
    Wait until element is visible    xpath=//button/i[@class='material-icons' and text()="add"]

Select tab bar menu
    [Documentation]    Select tab bar menu
    [Arguments]    ${text}
    common.Click element when ready    xpath=//a[.="${text}"]

Input task in text field
    [Documentation]    Input task in text field
    [Arguments]    ${text}
    common.Input text to element when ready    id=new-task    ${text}

Click button add task
    [Documentation]    Click button add task
    common.Click element when ready    xpath=//button/i[@class='material-icons' and text()="add"]

Verify todo task should be shown
    [Documentation]    Verify todo task show be
    [Arguments]    ${task_name}
    Wait until element is visible    xpath=//span[@class='mdl-checkbox__label' and text()='${task_name}']

Delete todo task by task name
    [Documentation]    Delete todo task by task name
    [Arguments]    ${task_name}
    common.Click element when ready    xpath=//span[@class='mdl-checkbox__label' and text()='${task_name}']/../../button[.='Delete']

Click check box by task name
    [Documentation]    Click check box by task name
    [Arguments]    ${task_name}
    common.Click element when ready    xpath=//span[@class='mdl-checkbox__label' and text()='${task_name}']/../span[contains(@class,'mdl-ripple--center')]

Verify task completed by task name
    [Documentation]    Verify task completed by task name
    [Arguments]    ${task_name}
    Wait until element is visible    xpath=//span[@class='mdl-list__item-primary-content' and text()='${task_name}']/i[text()='done']

Delete task completed by task name
    [Documentation]    Delete task completed by task name
    [Arguments]    ${task_name}
    common.Click element when ready    xpath=//span[@class='mdl-list__item-primary-content' and text()='${task_name}']/../button[contains(@class,'delete')]

Verify task completed not show task by task name
    [Documentation]    Verify task completed not show task by task name
    [Arguments]    ${task_name}
    Wait Until Element Is Not Visible    xpath=//span[@class='mdl-list__item-primary-content' and text()='${task_name}']/../button[contains(@class,'delete')]