# *** Settings ***
# Library    SeleniumLibrary
# Library    FakerLibrary
# Resource   ../Pages/Loginpage_checkEligibility.robot
# Resource   ../Pages/check_EMI_Calculator.robot
# Library    ../Libraries/Homepage.py    WITH NAME    Homepage
# Library     ../Libraries/LoanLibraries.py            



# *** Variables ***
# ${URL}      https://nidhifinder.com/
# ${BROWSER}  chrome

# ${LOAN_AMOUNT}    100000
# ${TENURE}    10
# ${INTEREST}    12.5
# ${EMI_TEXT}    ₹1,234




# *** Test Cases ***
# Test Loan Calculator Flow
#     [Documentation]    Test entire loan calculator flow
#     Setup Browser      ${URL}  ${BROWSER}
#     Enter Loan Amount    ${LOAN_AMOUNT}
#     Change Tenure        ${TENURE}
#     Change Interest Rate    ${INTEREST}
#     Verify EMI Calculated    ${EMI_TEXT}




*** Settings ***
# Resource    CommonKeywords.robot
Resource    ../Pages/Loginpage_checkEligibility.robot
Resource    ../Pages/check_EMI_Calculator.robot

*** Variables ***
${URL}      https://nidhifinder.com/
${BROWSER}  chrome
${LOAN_AMOUNT}    100000
${TENURE}    10
${INTEREST}    12.5
${EMI_TEXT}    ₹ 1,458

# Locators
${LOAN_AMOUNT_INPUT}    xpath=//input[@type='text'][1]
${YEAR_BUTTON}          xpath=//div[@role='group']/button[2]
${TENURE_TRACK}         xpath=(//span[contains(@class,'MuiSlider-thumb')])[3]/parent::span
${TENURE_THUMB}         xpath=(//span[contains(@class,'MuiSlider-thumb')])[3]
${TENURE_LABEL}         xpath=(//*[@class='MuiSlider-valueLabelLabel'])[3]
${INTEREST_TRACK}       xpath=(//span[contains(@class,'MuiSlider-thumb')])[2]/parent::span
${INTEREST_THUMB}       xpath=(//span[contains(@class,'MuiSlider-thumb')])[2]
${INTEREST_LABEL}       xpath=(//*[@class='MuiSlider-valueLabelLabel'])[2]
${EMI_VALUE}            xpath=//div[contains(., 'Your EMI is')]/span

*** Keywords ***
Enter Loan Amount
    [Arguments]    ${amount}
    Wait Until Element Is Visible    ${LOAN_AMOUNT_INPUT}
    ${element}=    Get WebElement    ${LOAN_AMOUNT_INPUT}
    Scroll To Element    ${element}
    Enter Value    ${element}    Loan Amount    ${amount}

Change Tenure
    [Arguments]    ${tenure}
    Wait Until Element Is Visible    ${YEAR_BUTTON}
    ${yearBtn}=    Get WebElement    ${YEAR_BUTTON}
    ${sliderTrack}=    Get WebElement    ${TENURE_TRACK}
    ${sliderThumb}=    Get WebElement    ${TENURE_THUMB}
    ${label}=    Get WebElement    ${TENURE_LABEL}
    
    Scroll To Element    ${yearBtn}
    Click Element    ${yearBtn}
    Set Slider To Value    ${tenure}    ${sliderTrack}    ${sliderThumb}    ${label}    1    30

Change Interest Rate
    [Arguments]    ${rate}
    Wait Until Element Is Visible    ${INTEREST_TRACK}
    ${sliderTrack}=    Get WebElement    ${INTEREST_TRACK}
    ${sliderThumb}=    Get WebElement    ${INTEREST_THUMB}
    ${label}=    Get WebElement    ${INTEREST_LABEL}
    
    Set Slider To Value    ${rate}    ${sliderTrack}    ${sliderThumb}    ${label}    4.0    24.0

# Verify EMI Calculated
#     [Arguments]    ${emi}
#     Wait Until Element Is Visible    ${EMI_VALUE}
#     ${emiText}=    Get WebElement    ${EMI_VALUE}
    
#     Scroll To Element    ${emiText}
#     ${result}=    Verify Text Contains    ${emiText}    ${emi}    EMI Amount
#     Should Be True    ${result}    EMI verification failed. Expected: ${emi}

Verify EMI Calculated
    [Arguments]    ${expected_emi}
    Wait Until Element Is Visible    ${EMI_VALUE}
    ${emi_element}=    Get WebElement    ${EMI_VALUE}
    Scroll To Element    ${emi_element}
    ${actual_emi}=    Get Text    ${emi_element}
    ${actual_emi}=    Strip String    ${actual_emi}
    Log    Actual EMI from website: ${actual_emi}

    # ${status}=    Run Keyword And Return Status    Should Be Equal As Strings    ${actual_emi}    ${expected_emi}
    ${status}=    Run Keyword And Return Status    Should Contain    ${actual_emi}    ${expected_emi}

    
    Run Keyword If    not ${status}
    ...    Fail    EMI verification failed.\nExpected: ${expected_emi}\nActual: ${actual_emi}


*** Test Cases ***
Test Loan Calculator Flow
    [Documentation]    Test entire loan calculator flow
    [Tags]    Calculator
    Setup Browser    ${URL}    ${BROWSER}
    Enter Loan Amount    ${LOAN_AMOUNT}
    Change Tenure        ${TENURE}
    Change Interest Rate    ${INTEREST}
    Verify EMI Calculated    ${EMI_TEXT}
    Close Browser
