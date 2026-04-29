*** Settings ***
Documentation     Example test cases using the keyword-driven testing approach
Library           SeleniumLibrary

*** Variables ***
${URL}    https://travels.praegus.nl/chat

*** Test Cases ***
Send Chat Message
    [Documentation]    This test case sends a chat message.
    Open Browser    ${URL}
    Input Text    css:textarea    Hello, this is a test message!
    Click Button    css:button[type="submit"]
    Sleep    5s
    Close Browser