*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***

*** Test Cases ***
VerifyGoogleSearchResults
    open browser    https://www.google.com/     chrome
    input text    name:q    robotframework
    submit form

    ${AllLinkCount}=    get element count    xpath://div[contains(@class,'g')]//div[@class='yuRUbf']/a
    log to console  Total Links ${AllLinkCount}

    @{ListAllLinks}     create list

    FOR    ${i}    IN RANGE    1    ${AllLinkCount}
       ${linkText}=   get text    xpath:(//div[contains(@class,'g')]//div[@class='yuRUbf']/a)[${i}]
       log to console    ${linkText}
        append to file    C:\\Users\\akm17\\PycharmProjects\\NewPythonTest\\Reports\\Output.txt   ${linkText}\n
    END


    close browser
*** Keywords ***
