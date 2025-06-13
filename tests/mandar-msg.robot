*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close All Browsers

*** Variables ***
${EXPAND_CHAT_BUTTON}    xpath=/html/body/div[3]/div[1]/button
${BASE_URL}    https://pacaembu.com/
${BROWSER}    chrome
${INPUT_SITE_XPATH}    /html/body/webruntime-app/lwr-router-container/webruntime-inner-app/dxp_data_provider-user-data-provider/dxp_data_provider-data-proxy/embedded_service_iframe-iframe-wrapper/main/slot/webruntime-router-container/dxp_data_provider-user-data-provider/dxp_data_provider-data-proxy/embedded_service_iframe-frame-layout/slot/embeddedmessaging-container/embeddedmessaging-conversation-state/embeddedmessaging-input-footer/div/div[2]/textarea
${CHAT_IFRAME}    id:embeddedMessagingFrame

*** Keywords ***
Abrir navegador
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Create WebDriver    Chrome    options=${options}
    Go To    ${BASE_URL}  

Clicar no chat
    Wait Until Element Is Visible    ${EXPAND_CHAT_BUTTON}    timeout=30s
    Click Element    ${EXPAND_CHAT_BUTTON}
    Sleep    10s

*** Test Cases ***
Clicar no botão
    Abrir navegador
    Wait Until Keyword Succeeds    5 times    3s    Clicar no chat
    Wait Until Element Is Visible    ${CHAT_IFRAME}   
    Select Frame    ${CHAT_IFRAME}
    Press Keys    ${None}    Oi    ENTER
    Sleep    10s