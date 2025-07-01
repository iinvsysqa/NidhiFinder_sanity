*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    String    # Required for string manipulation keywords
Library    Collections    # Required for dictionary operations
Resource    ../Pages/check_EMI_Calculator.robot



*** Keywords ***
OurServicesNavigationcheck
    [Arguments]     ${Header_Home}  ${Aboutus_Home}  ${Services}  ${ContactUs}   ${Footer_Home}  ${Footer_AboutUs}  ${Footer_Services}  ${Footer_ContactUs}

    # FooterHome navigation
    Wait Until Element Is Visible    ${Footer_Home}
    ${element}=    Get WebElement    ${Footer_Home}
    Scroll To Element  ${element}
    Click Element    ${Footer_Home}
    Wait Until Element Is Visible   ${Header_Home} 
    
    # Footer About Us navigation
    Wait Until Element Is Visible    ${Footer_AboutUs}
    ${element}=    Get WebElement    ${Footer_AboutUs}
    Scroll To Element  ${element}
    Click Element    ${Footer_AboutUs}
    ${element}=    Get WebElement    ${Aboutus_Home}
    Scroll To Element   ${element}
    Wait Until Element Is Visible    ${Aboutus_Home}


     # Footer Services navigation
    Click Element   ${Header_Home}
    Wait Until Element Is Visible    ${Footer_Services}
    ${element}=    Get WebElement    ${Footer_Services}
    Scroll To Element  ${element}
    Click Element    ${Footer_Services}
    ${element}=    Get WebElement    ${Services}
    Scroll To Element   ${element}
    Wait Until Element Is Visible    ${Services}
 


     # Footer  Contact us page navigation
    Click Element   ${Header_Home}
    Wait Until Element Is Visible    ${Footer_ContactUs}
    ${element}=    Get WebElement    ${Footer_ContactUs}
    Scroll To Element  ${element}
    Click Element    ${Footer_ContactUs}
    ${element}=    Get WebElement     ${ContactUs}
    Scroll To Element   ${element}
    Wait Until Element Is Visible     ${ContactUs}
    
QuickLinksNavigation
    [Arguments]  ${Footer_CheckEligibility}  ${Footer_TermsAndConditions}  ${Footer_PrivacyPolicy}  ${Basicinfo}   ${Terms&condition}   ${PrivacyPolicy}  ${Header_Home}

    # checkeligibility page
    Wait Until Element Is Visible    ${Footer_CheckEligibility}
    ${element}=    Get WebElement    ${Footer_CheckEligibility}
    Scroll To Element  ${element}

    Click Element    ${Footer_CheckEligibility}
    Wait Until Element Is Visible  ${Basicinfo} 

    # terms and conditions
    Go Back
    ${element}=    Get WebElement    ${Footer_TermsAndConditions}
    Scroll To Element  ${element}
    Click Element    ${Footer_TermsAndConditions}
    ${element}=    Get WebElement     ${Terms&condition}
    Scroll To Element   ${element}
    Wait Until Element Is Visible     ${Terms&condition}


    # check Privacy Policy
    Wait Until Element Is Visible    ${Header_Home}
    ${element}=    Get WebElement    ${Footer_PrivacyPolicy}
    Scroll To Element  ${element}
    Click Element    ${Footer_PrivacyPolicy}
    ${element}=    Get WebElement     ${PrivacyPolicy}
    Scroll To Element   ${element}
    Wait Until Element Is Visible     ${PrivacyPolicy}
    Click Element    ${Header_Home}

checkLoansnavigation   
    [Arguments]       ${Header_Home}  ${Footer_PersonalLoan}  ${Footer_HomeLoan}  ${Footer_EducationLoan}  ${Footer_AutoLoan}  ${Footer_BusinessLoan}  ${Footer_LoanAgainstProperty}  ${Footer_GoldLoan}  ${Footer_GovtSchemeBasedLoan}  ${PersonalLoan}  ${Homeloan}  ${EducationLoan}  ${AutoLoan}  ${BusinessLoan}  ${LoanAgainstProperty}  ${GoldLoan}  ${GovtSchemeBasedLoan}
       

    Wait Until Element Is Visible    ${Footer_PersonalLoan}
    ${element}=    Get WebElement    ${Footer_PersonalLoan}
    Scroll To Element  ${element}

    Click Element    ${Footer_PersonalLoan}
     ${element}=    Get WebElement      ${PersonalLoan} 
    Scroll To Element   ${element}
    Wait Until Element Is Visible  ${PersonalLoan} 



     Click Element    ${Header_Home}
     Wait Until Element Is Visible    ${Footer_HomeLoan}
    ${element}=    Get WebElement    ${Footer_HomeLoan}
    Scroll To Element  ${element}
    Click Element    ${Footer_HomeLoan}
    ${element}=    Get WebElement      ${Homeloan}
    Scroll To Element   ${element}
    Wait Until Element Is Visible     ${Homeloan}


     Click Element    ${Header_Home}
     Wait Until Element Is Visible    ${Footer_EducationLoan}
    ${element}=    Get WebElement    ${Footer_EducationLoan}
    Scroll To Element  ${element}
    Click Element    ${Footer_EducationLoan}
    ${element}=    Get WebElement      ${EducationLoan}
    Scroll To Element   ${element}
    Wait Until Element Is Visible     ${EducationLoan}


     Click Element    ${Header_Home}
     Wait Until Element Is Visible     ${Footer_AutoLoan}
    ${element}=    Get WebElement    ${Footer_AutoLoan}
    Scroll To Element  ${element}
    Click Element    ${Footer_AutoLoan}
    ${element}=    Get WebElement      ${AutoLoan}
    Scroll To Element   ${element}
    Wait Until Element Is Visible     ${AutoLoan}



     Click Element    ${Header_Home}
     Wait Until Element Is Visible    ${Footer_BusinessLoan}
    ${element}=    Get WebElement    ${Footer_BusinessLoan}
    Scroll To Element  ${element}
    Click Element    ${Footer_BusinessLoan}
    ${element}=    Get WebElement      ${BusinessLoan}
    Scroll To Element   ${element}
    Wait Until Element Is Visible     ${BusinessLoan}

    Click Element    ${Header_Home}
     Wait Until Element Is Visible    ${Footer_LoanAgainstProperty}
    ${element}=    Get WebElement    ${Footer_LoanAgainstProperty}
    Scroll To Element  ${element}
    Click Element    ${Footer_LoanAgainstProperty}
    ${element}=    Get WebElement      ${LoanAgainstProperty}
    Scroll To Element   ${element}
    Wait Until Element Is Visible     ${LoanAgainstProperty}

    Click Element    ${Header_Home}
     Wait Until Element Is Visible   ${Footer_GoldLoan}
    ${element}=    Get WebElement    ${Footer_GoldLoan}
    Scroll To Element  ${element}
    Click Element    ${Footer_GoldLoan}
    ${element}=    Get WebElement      ${GoldLoan}
    Scroll To Element   ${element}
    Wait Until Element Is Visible     ${GoldLoan}

    Click Element    ${Header_Home}
     Wait Until Element Is Visible   ${Footer_GovtSchemeBasedLoan}
    ${element}=    Get WebElement    ${Footer_GovtSchemeBasedLoan}
    Scroll To Element  ${element}
    Click Element    ${Footer_GovtSchemeBasedLoan}
    ${element}=    Get WebElement      ${GovtSchemeBasedLoan}
    Scroll To Element   ${element}
    Wait Until Element Is Visible     ${GovtSchemeBasedLoan}





    
