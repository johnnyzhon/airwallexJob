*** Settings ***
Resource          ../resource.txt

*** Test Cases ***
account num could be any 8 characters@CN
    ${payload}    load test data    payload_CN    account_number=1a~*&}|.
    httpPost    ${payload}
    Assert response passed

account num could be any 20 characters@CN
    ${payload}    load test data    payload_CN    #use default account number
    httpPost    ${payload}
    Assert response passed

account num could be any 6 characters@AU
    ${payload}    load test data    payload_AU    account_number=%^$???
    httpPost    ${payload}
    Assert response passed

account num could be any 9 characters@AU
    ${payload}    load test data    payload_AU
    httpPost    ${payload}
    Assert response passed

account num could be any 1 characters@US
    ${payload}    load test data    payload_US    account_number=1
    httpPost    ${payload}
    assert response passed

account num could be any 17 characters@US
    ${payload}    load test data    payload_US
    httpPost    ${payload}
    assert response passed
