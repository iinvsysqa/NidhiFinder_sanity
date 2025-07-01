*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary



***Variables***
${checkEligibilityBtn_before_login}   xpath:(//*[contains(text(),'Check Eligibility')])[1]
${number_textbox}                     xpath: /html/body/div/div[2]/div[2]/div/form/div/div/input
${GetOTPbtn}                          xpath://*[@id="root"]/div[2]/div[2]/div/form/button
${Otptextbox1}                        xpath:(//*[@id="root"]/div[2]/div[2]/form/div[2]/input[1])
${Otptextbox2}                        xpath:(//*[@id="root"]/div[2]/div[2]/form/div[2]/input[2])
${Otptextbox3}                        xpath:(//*[@id="root"]/div[2]/div[2]/form/div[2]/input[3])
${Otptextbox4}                        xpath:(//*[@id="root"]/div[2]/div[2]/form/div[2]/input[4])
${verifyOTPbtn}                       xpath://*[@id="root"]/div[2]/div[2]/form/button
${Basicinformationtxt}                xpath://*[@id="root"]/div[2]/div[2]/div[2]/form/div[1]/h2
${Paninputfield}                      xpath://*[@id="root"]/div[2]/div[2]/div[2]/form/div[2]/input
${Fullnameinputfield}                 xpath://*[@id="root"]/div[2]/div[2]/div[2]/form/div[4]/input
${Emailinputfield}                    xpath://*[@id="root"]/div[2]/div[2]/div[2]/form/div[6]/input
${DOBinputfield}                      xpath://*[@id="root"]/div[2]/div[2]/div[2]/form/div[5]/input
${BasicinformationNextbtn}            xpath://*[@id="root"]/div[2]/div[2]/div[2]/form/div[8]/button
${panErrmsg}                          xpath://*[contains(text(),'PAN number is required')]
${FullnameErrmsg}                     xpath://*[contains(text(),'Full name is required')]
${Emailerrmsg}                        xpath://*[contains(text(),'Email is required')]
${DOBerrmsg}                          xpath://*[contains(text(),'Date of birth is required')]

# Residencypage
${ResidencyDetails}                   xpath://*[contains(text(),'Residency Details')]
${PincodeErrmsg}                      xpath://*[contains(text(),'Pincode is required')]
${AddressErrmsg}                      xpath://*[contains(text(),'Address is required')]
${StateErrmsg}                      xpath://*[contains(text(),'State is required')]
${MonthlyIcomeErrmsg}                      xpath://*[contains(text(),'Monthly income is required')]
${LastsalarydateErrmsg}                      xpath://*[contains(text(),'Last salary date is required')]
${LoanamountErrmsg}                      xpath://*[contains(text(),'Loan amount is required')]
${Nextbutton}                            xpath://*[contains(text(),'Next ')]
${PincodeTextbox}                        xpath://*[@id="root"]/div[2]/div[2]/div[2]/form/div[3]/input
${AddressTextbox}                        xpath://*[@id="root"]/div[2]/div[2]/div[2]/form/div[4]/input
${StateTextbox}                           xpath://*[@id="root"]/div[2]/div[2]/div[2]/form/div[5]/select
${Monthlyincometextbox}                    xpath://*[@id="root"]/div[2]/div[2]/div[2]/form/div[7]/input
${lastsalarydatetextbox}                    xpath://*[@id="root"]/div[2]/div[2]/div[2]/form/div[10]/input
${Loanamounttextbox}                        xpath://*[@id="root"]/div[2]/div[2]/div[2]/form/div[12]/input

#  summarydetails
${summarydetailstxt}                        xpath:(//*[contains(text(),'Summary Details')])[2]
${submit button}                            xpath://*[contains(text(),'Submit')]
${submission successful text}                            xpath://*[contains(text(),'Submission Successful')]
${ok btn}                            xpath://*[contains(text(),'Ok')]

*** Keywords ***
Login With Credentials
    [Arguments]    ${phone}  
    Sleep    3s
    Click Element   ${checkEligibilityBtn_before_login}
    Sleep    3s

    Input Text     ${number_textbox}    ${phone}
    Click Element   ${GetOTPbtn}

    Sleep    3s
    Input Text      ${Otptextbox1}   1
    Input Text      ${Otptextbox2}  2
    Input Text      ${Otptextbox3}  3
    Input Text      ${Otptextbox4}  4
    
    Click Button    ${verifyOTPbtn}

    Wait Until Page Contains Element    ${checkEligibilityBtn_before_login}   timeout=10s
    Click Element    ${checkEligibilityBtn_before_login}
    Sleep    3s
    Wait Until Page Contains Element    ${Basicinformationtxt}    timeout=10s

    Click Button      ${BasicinformationNextbtn}

    Element Should Contain   ${panErrmsg}   PAN number is required
    Element Should Contain   ${FullnameErrmsg}     Full name is required
    Element Should Contain   ${Emailerrmsg}   Email is required
    Element Should Contain   ${DOBerrmsg}   Date of birth is required

    
    Input Text     ${Paninputfield}     DMPLL9087F
    Input Text     ${Fullnameinputfield}     Mohammed
    Input Text     ${Emailinputfield}       iinvsysqa@gmail.com
    Input Text     ${DOBinputfield}    03042021
    Click Button      ${BasicinformationNextbtn}

    Sleep    3s
#  cheking residentail page
    Element Should Contain   ${ResidencyDetails}   Residency Details
    Click Button      ${Nextbutton}
    Element Should Contain   ${PincodeErrmsg}   Pincode is required
    Element Should Contain   ${AddressErrmsg}   Address is required
    Element Should Contain   ${StateErrmsg}   State is required
    Element Should Contain   ${MonthlyIcomeErrmsg}   Monthly income is required
    Element Should Contain   ${LastsalarydateErrmsg}   Last salary date is required
    Element Should Contain   ${LoanamountErrmsg}   Loan amount is required


    Input Text      ${PincodeTextbox}       607104
    Input Text      ${AddressTextbox}       pondy
    Click Element      ${StateTextbox}    
    Select From List By Index        ${StateTextbox}  1   
    Input Text     ${Monthlyincometextbox}  10000    
    Input Text     ${lastsalarydatetextbox}    03042021
    Input Text      ${Loanamounttextbox}   10000
    Click Element    ${Nextbutton}  

    Sleep    3s
    # Summarydetailspaeg
    Element Should Contain   ${summarydetailstxt}   Summary Details
     execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Click Element    ${submit button}
     Sleep    3s
    Element Should Contain   ${submission successful text}   Submission Successful
    Click Element    ${ok btn}
     Sleep    3s
    Element Should Contain   ${checkEligibilityBtn_before_login}   Check Eligibility

    

    
    
