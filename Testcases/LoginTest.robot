*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Resource   ../Pages/Loginpage_checkEligibility.robot
Library    ../Libraries/Homepage.py    WITH NAME    Homepage



*** Variables ***
${URL}      https://nidhifinder.com/
${BROWSER}  chrome

${OTP1}  1
${OTP1}  2
${OTP1}  3
${OTP1}  4

*** Keywords ***
Initialize Fake Data
    # Personal information
    ${first_name}=    First Name
    ${last_name}=    Last Name
    ${email}=    Email 
    ${street}=    Street Address
    ${city}=    City
    ${zipcode}=    Zipcode
    ${company}=    Company
    ${job}=    Job
    ${credit_card}=    Credit Card Number
    
    # Set all as suite variables
    Set Suite Variable    ${first_name}
    Set Suite Variable    ${last_name}
    Set Suite Variable    ${email}
    Set Suite Variable    ${street}
    Set Suite Variable    ${city}
    Set Suite Variable    ${zipcode}
    Set Suite Variable    ${company}
    Set Suite Variable    ${job}
    Set Suite Variable    ${credit_card}

*** Test Cases ***

Login Test
         
    ${phone}=   Homepage.Random Phone Number
    Set Suite Variable    ${phone}

    Initialize Fake Data  
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window  
    Login With Credentials    ${phone}
   
    Close Browser

