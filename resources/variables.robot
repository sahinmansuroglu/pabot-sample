*** Settings ***
Library    pabot.PabotLib
Library    Collections
*** Variables ***
@{messagelist}

${index}        ${0}
${turn}         device1
${variable}     Deger

*** Keywords ***
Set Turn Value
    [Arguments]     ${turnValue}
    Acquire Lock    locTurn
    Set Parallel Value For Key    turn    ${turnValue}
    Release Lock    locTurn

Get Turn Value
    ${turn}=    Get Parallel Value For Key    turn
    RETURN  ${turn}

Get Messages
    ${turn}=    Get Parallel Value For Key    messages
    RETURN  ${turn}

Set Message
        [Arguments]     ${message}
        Acquire Lock    locMsg
        Set Parallel Value For Key    messages    ${message}
        Release Lock    locMsg

Wait Until Turn is device1
    ${turn}=    Get Turn Value
    WHILE    '${turn}' != 'device1'     limit=30
        Sleep    10ms
        ${turn}=    Get Turn Value
    END

Wait Until Turn is device2
   ${turn}=    Get Turn Value
       WHILE    '${turn}' != 'device2'    limit=30
           Sleep    10ms
           ${turn}=    Get Turn Value
       END

Initailize Message List
    Set Message     message:

Add ${message} To List
    ${msg}=     Get Messages
    ${all_msg}=      Catenate    ${msg}  ${message}
    Set Message     ${all_msg}

Log Message List To Console
     ${msg}=     Get Messages
     Log To Console     \n${msg}


