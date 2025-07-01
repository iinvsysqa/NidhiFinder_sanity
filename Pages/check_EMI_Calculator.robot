*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    String    # Required for string manipulation keywords
Library    Collections    # Required for dictionary operations
Library    ../Libraries/LoanLibraries.py  WITH NAME    Custom

*** Keywords ***
Setup Browser
    [Arguments]    ${URL}    ${BROWSER}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    10 seconds
    Set Selenium Speed    0.5

Scroll To Element
    [Arguments]    ${element}
    Execute JavaScript    arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'});    ARGUMENTS    ${element}
    Sleep    0.5s

Enter Value
    [Arguments]    ${element}    ${fieldname}    ${value}
    Wait Until Element Is Visible    ${element}
    Execute JavaScript    arguments[0].value = '';    ARGUMENTS    ${element}
    Input Text    ${element}    ${value}
    Log    Entered value '${value}' in field '${fieldname}'

Set Slider To Value
    [Arguments]    ${target_value}    ${slider_track}    ${slider_thumb}    ${label}    ${min_val}    ${max_val}

    ${target}=    Convert To Number    ${target_value}

    # Get current value from label
    ${current_text}=    Get Text    ${label}
    ${current_text}=    Remove String    ${current_text}    %    ${SPACE}    ,
    ${current_text}=    Strip String    ${current_text}
    ${current_value}=    Run Keyword If    '${current_text}' != '${EMPTY}'    Convert To Number    ${current_text}
    ...    ELSE    Set Variable    ${min_val}

    # Get track and thumb widths
    ${track_size}=    Get Element Size    ${slider_track}
    ${thumb_size}=    Get Element Size    ${slider_thumb}
    ${track_width}=    Set Variable    ${track_size[0]}
    ${thumb_width}=    Set Variable    ${thumb_size[0]}

    # Calculate movement
    ${usable_width}=    Evaluate    ${track_width} - ${thumb_width}
    ${value_range}=    Evaluate    ${max_val} - ${min_val}
    ${pixels_per_unit}=    Evaluate    ${usable_width} / ${value_range}
    ${x_offset}=    Evaluate    int((${target} - ${current_value}) * ${pixels_per_unit})

    # Get thumb location
    ${thumb_loc}=    Custom.Get Element Location    ${slider_thumb}
    ${start_x}=    Set Variable    ${thumb_loc['x']}
    ${start_y}=    Set Variable    ${thumb_loc['y']}

    # Perform slider movement using offset
    Drag And Drop By Offset    ${slider_thumb}    ${x_offset}    0
    Sleep    0.5s


Verify Text Contains
    [Arguments]    ${element}    ${expected_text}    ${field}=${EMPTY}
    ${actual}=    Get Text    ${element}
    ${actual}=    Strip String    ${actual}
    ${status}=    Run Keyword And Return Status    Should Contain    ${actual}    ${expected_text}
    
    Run Keyword If    '${field}' != '${EMPTY}' and ${status} == True
    ...    Log    Text verification for '${field}': Expected '${expected_text}' in '${actual}' - PASS

    Run Keyword If    '${field}' != '${EMPTY}' and ${status} == False
    ...    Log    Text verification for '${field}': Expected '${expected_text}' in '${actual}' - FAIL

    Run Keyword If    '${field}' == '${EMPTY}' and ${status} == True
    ...    Log    Text verification: Expected '${expected_text}' in '${actual}' - PASS

    Run Keyword If    '${field}' == '${EMPTY}' and ${status} == False
    ...    Log    Text verification: Expected '${expected_text}' in '${actual}' - FAIL

    [Return]    ${status}
