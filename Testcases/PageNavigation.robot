*** Settings ***
Resource  ../Pages/Home_navigation.robot
Resource    ../Pages/Loginpage_checkEligibility.robot
Resource    ../Pages/check_EMI_Calculator.robot

*** Variables ***

${URL}      https://nidhifinder.com/
${BROWSER}  chrome

${Header_Home}      (//*[text()='Home'])[1]
${Aboutus_Home}          (//*[text()='About Us'])[3]
${Services}        (//*[text()='Services'])[3]
${ContactUs}        (//*[text()='Send Us a Message'])[1]
${Basicinfo}        (//*[text()='Login to your account'])[1]
${Terms&condition}    (//*[text()='Terms & Conditions'])[1]
${PrivacyPolicy}     (//*[text()='Privacy Policy'])[1]

${PersonalLoan}     (//*[text()='Personal Loan'])[3]
${Homeloan}         (//*[text()='Home Loan'])[3]
${EducationLoan}     (//*[text()='Education Loan'])[3]
${AutoLoan}     (//*[text()='Auto Loan'])[3]
${BusinessLoan}   (//*[text()='Business Loan'])[3]
${LoanAgainstProperty}   (//*[text()='Loan Against Property'])[3]
${GoldLoan}      (//*[text()='Gold Loan'])[3]
${GovtSchemeBasedLoan}         (//*[text()='Govt Scheme Based Loan'])[3]






${Footer_PersonalLoan}   (//*[text()='Personal Loan'])[4]
${Footer_HomeLoan}   (//*[text()='Home Loan'])[4]
${Footer_EducationLoan}   (//*[text()='Education Loan'])[4]
${Footer_AutoLoan}   (//*[text()='Auto Loan'])[4]
${Footer_BusinessLoan}   (//*[text()='Business Loan'])[5]
${Footer_LoanAgainstProperty}   (//*[text()='Loan Against Property'])[4]
${Footer_GoldLoan}   (//*[text()='Gold Loan'])[4]
${Footer_GovtSchemeBasedLoan}   (//*[text()='Govt Scheme Based Loan'])[4]
${Footer_CheckEligibility}    //*[@id="root"]/div[2]/footer/div[1]/div[3]/ul/li[1]
${Footer_TermsAndConditions}   (//*[text()='Terms And Conditions'])[1]
${Footer_PrivacyPolicy}   (//*[text()='Privacy Policy'])[1]
${Footer_Home}   (//*[text()='Home'])[3]
${Footer_AboutUs}   (//*[text()='About Us'])[3]
${Footer_Services}   (//*[text()='Services'])[4]
${Footer_ContactUs}   (//*[text()='Contact Us'])[3]


*** Keywords ***

*** Test Cases ***
CheckHomepagenavigators
    [Documentation]    Test Home page navigators in Nidhi Finder 

    Setup Browser    ${URL}    ${BROWSER}
    OurServicesNavigationcheck   ${Header_Home}  ${Aboutus_Home}  ${Services}  ${ContactUs}   ${Footer_Home}  ${Footer_AboutUs}  ${Footer_Services}  ${Footer_ContactUs}
    QuickLinksNavigation     ${Footer_CheckEligibility}   ${Footer_TermsAndConditions}  ${Footer_PrivacyPolicy}  ${Basicinfo}   ${Terms&condition}   ${PrivacyPolicy}  ${Header_Home}
    checkLoansnavigation    ${Header_Home}  ${Footer_PersonalLoan}  ${Footer_HomeLoan}  ${Footer_EducationLoan}  ${Footer_AutoLoan}  ${Footer_BusinessLoan}  ${Footer_LoanAgainstProperty}  ${Footer_GoldLoan}  ${Footer_GovtSchemeBasedLoan}  ${PersonalLoan}  ${Homeloan}  ${EducationLoan}  ${AutoLoan}  ${BusinessLoan}  ${LoanAgainstProperty}  ${GoldLoan}  ${GovtSchemeBasedLoan} 