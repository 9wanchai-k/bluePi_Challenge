*** Settings ***
Resource    ../../data/import.robot

*** Keywords ***
Open website 
    ${chrome options}=      Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver  
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Create Webdriver    Chrome    chrome_options=${chrome options}
    Maximize Browser Window
    Goto    ${url}

Input text to element when ready
    [Documentation]  Input Text To Element
    [Arguments]     ${locator_element}   ${text_to_input}
    Wait Until Element Is Visible   ${locator_element}
    Input Text     ${locator_element}    ${text_to_input}

Click element when ready
    [Documentation]  Tap Element When Ready
    [Arguments]    ${locator_element}
    Wait Until Element Is Visible    ${locator_element}
    Click Element   ${locator_element}

Clear text to element when ready
    [Documentation]  Clear Text To Element When Ready
    [Arguments]    ${locator_element}
    Wait Until Element Is Visible    ${locator_element}
    Clear Text    ${locator_element}