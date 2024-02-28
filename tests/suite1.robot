*** Settings ***
Resource    ../resources/variables.robot
Library    Collections
Library    pabot.PabotLib
*** Test Cases ***
Test Case 1 On Device-1
     Initailize Message List
     Set Turn Value      device2
     FOR  ${Index}  IN RANGE  1     10
        Wait Until Turn is device1
        ${msg}=     Set Variable  (Msg-${Index} Dvc-1)
        Add ${msg} To List
        Log Message List To Console
        Set Turn Value      device2
     END

