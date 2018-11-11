*** Settings ***
Resource          ../resource.txt

*** Test Cases ***
method could be LOCAL
    ${payload}    load test data    payload_US    payment_method=LOCAL
    httpPost    ${payload}
    Assert response passed

method should not be LOCAL1
    ${payload}    load test data    payload_US    payment_method=LOCAL1
    httpPost    ${payload}
    Assert response failed    ${FAILED_PAYMENT_METHOD_WRONG}

method should not be local
    ${payload}    load test data    payload_US    payment_method=local
    httpPost    ${payload}
    Assert response failed    ${FAILED_PAYMENT_METHOD_WRONG}

method should not be null
    ${payload}    load test data    payload_US    payment_method=
    httpPost    ${payload}
    Assert response failed    ${FAILED_PAYMENT_METHOD_WRONG}

method field is mandatory
    ${payload}    load test data    payload_US
    remove from dictionary    ${payload}    payment_method
    httpPost    ${payload}
    Assert response failed    ${FAILED_PAYMENT_METHOD_WRONG}
