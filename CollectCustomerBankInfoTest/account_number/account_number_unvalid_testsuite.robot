*** Settings ***
Resource          ../resource.txt

*** Test Cases ***
account num should not be 7 characters@CN
    ${payload}    load test data    payload_CN    account_number=1112223
    httpPost    ${payload}
    assert response failed    fake

account num should not be 21 characters@CN
    ${payload}    load test data    payload_CN    account_number=111222333444555666777
    httpPost    ${payload}
    assert response failed    fake

account num should not be 5 characters@AU
    ${payload}    load test data    payload_AU    account_number=11122
    httpPost    ${payload}
    assert response failed    fake

account num should not be 10 characters@AU
    ${payload}    load test data    payload_AU    account_number=1112223334
    httpPost    ${payload}
    assert response failed    fake

account num should not be 0 characters@US
    ${payload}    load test data    payload_US    account_number=
    httpPost    ${payload}
    assert response failed    ${FAILED_ACCOUNT_NUMBER_REQUIRED}

account num should not be 18 characters@US
    ${payload}    load test data    payload_US    account_number=aaabbbcccdddeeefff
    httpPost    ${payload}
    assert response failed    fake

field account num should be mandatory
    ${payload}    load test data    payload_US
    remove from dictionary    ${payload}    account_number
    httpPost    ${payload}
    assert response failed    ${FAILED_ACCOUNT_NUMBER_REQUIRED}
