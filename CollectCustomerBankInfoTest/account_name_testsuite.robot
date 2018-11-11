*** Settings ***
Force Tags        accountName
Resource          resource.txt

*** Test Cases ***
Account name could be any 2 characters@US@SWIFT
    ${payload}    load test data    payload_US    payment_method=SWIFT    account_name=ZQ
    httpPost    ${payload}
    Assert response passed

Account name could be any 5 characters@AU@SWIFT
    ${payload}    load test data    payload_AU    payment_method=SWIFT    account_name=_8d;$
    httpPost    ${payload}
    Assert response passed

Account name could be any 10 characters@CN@SWIFT
    ${payload}    load test data    payload_CN    payment_method=SWIFT    account_name=!!!@@@###$
    httpPost    ${payload}
    Assert response passed

Account name should not be any 1 characters@US@LOCAL
    ${payload}    load test data    payload_US    payment_method=LOCAL    account_name=1
    httpPost    ${payload}
    Assert response failed    ${FAILED_LENGTH_ACCOUNT_NAME_NOT_VALID}

Account name should not be any 11 characters@AU@LOCAL
    ${payload}    load test data    payload_AU    payment_method=LOCAL    account_name=aaabbbcccdd
    httpPost    ${payload}
    Assert response failed    ${FAILED_LENGTH_ACCOUNT_NAME_NOT_VALID}

Account name should not be empty@AU@LOCAL
    ${payload}    load test data    payload_AU    payment_method=LOCAL    account_name=
    httpPost    ${payload}
    Assert response failed    ${FAILED_ACCOUNT_NAME_REQUIRED}

Field Account name should be mandatory@CN@LOCAL
    ${payload}    load test data    payload_CN    payment_method=LOCAL
    remove from dictionary    ${payload}    account_name
    httpPost    ${payload}
    Assert response failed    ${FAILED_ACCOUNT_NAME_REQUIRED}
