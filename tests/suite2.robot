*** Settings ***
Resource    ../resources/variables.robot
Library    Collections
Library    pabot.PabotLib
*** Test Cases ***
Test Case 1 On Device-2
     FOR  ${Index}  IN RANGE  1    10
        Wait Until Turn is device2
        ${msg}=     Set Variable  (Msg-${Index} Dvc-2)
        Add ${msg} To List
        Log Message List To Console
        Set Turn Value      device1
     END



#Test Case 1 On Device-2
#     FOR  ${Index}  IN RANGE  5
#        Wait Until Turn is device2
##        ${msg}=     Set Variable  Message-${Index} From Device-2
##        Add ${msg} To List
#        Set Turn Value      device1
##        Log Message List To Console
#     END