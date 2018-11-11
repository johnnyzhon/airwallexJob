*** Settings ***
Resource          ../resource.txt

*** Test Cases ***
method could be SWIFT
    ${payload}    load test data    payload_US    payment_method=SWIFT
    httpPost    ${payload}
    Assert response passed

method should not be SWIF
    ${payload}    load test data    payload_US    payment_method=SWIF
    httpPost    ${payload}
    Assert response failed    ${FAILED_PAYMENT_METHOD_WRONG}

method should not be None
    ${payload}    load test data    payload_US    payment_method=${None}
    httpPost    ${payload}
    Assert response failed    ${FAILED_PAYMENT_METHOD_WRONG}
