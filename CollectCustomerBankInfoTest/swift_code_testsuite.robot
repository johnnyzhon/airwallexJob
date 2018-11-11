*** Settings ***
Force Tags        swiftCode
Resource          resource.txt

*** Test Cases ***
swift code should be mandatory while method is swift
    ${payload}    load test data    payload_US    payment_method=SWIFT
    remove from dictionary    ${payload}    swift_code
    httpPost    ${payload}
    Assert response failed    ${FAILED_SWIFT_CODE_REQUIRED}

the 5th and 6th of swift code should math bank country code AU
    ${payload}    load test data    payload_AU    payment_method=SWIFT    swift_code=ICBCUSZQ
    httpPost    ${payload}
    Assert response failed    ${FAILED_SWIFT_CODE_NOT_VALID_AU}

the 5th and 6th of swift code should math bank country code CN
    ${payload}    load test data    payload_CN    payment_method=SWIFT    swift_code=ICBCUSZQ
    httpPost    ${payload}
    Assert response failed    ${FAILED_SWIFT_CODE_NOT_VALID_CN}

the 5th and 6th of swift code should math bank country code US
    ${payload}    load test data    payload_US    payment_method=SWIFT    swift_code=ICBCzqZQ
    httpPost    ${payload}
    Assert response failed    ${FAILED_SWIFT_CODE_NOT_VALID_US}

the 5th and 6th of swift code should math bank country code US abnormal
    ${payload}    load test data    payload_US    payment_method=SWIFT    swift_code=ICBCAUZQ    bank_country_code=CN
    httpPost    ${payload}
    Assert response failed    fake

length of swift code could be 8 characters
    ${payload}    load test data    payload_US    payment_method=SWIFT    swift_code=****US**
    httpPost    ${payload}
    Assert response passed

length of swift code could be 11 characters
    ${payload}    load test data    payload_AU    payment_method=SWIFT    swift_code=****AU*%&@#
    httpPost    ${payload}
    Assert response passed

length of swift code should not be 0 characters@US
    ${payload}    load test data    payload_US    payment_method=SWIFT    swift_code=
    httpPost    ${payload}
    Assert response failed    ${FAILED_SWIFT_CODE_REQUIRED}

length of swift code should not be 7 characters@US
    ${payload}    load test data    payload_US    payment_method=SWIFT    swift_code=ICBCUSS
    httpPost    ${payload}
    Assert response failed    ${FAILED_LENGTH_SWIFT_CODE_NOT_VALID}

length of swift code should not be 12 characters@CN
    ${payload}    load test data    payload_CN    payment_method=SWIFT    swift_code=ABCDCNABCDE
    httpPost    ${payload}
    Assert response failed    ${FAILED_LENGTH_SWIFT_CODE_NOT_VALID}

length of swift code should not be 9 characters@AU
    ${payload}    load test data    payload_AU    payment_method=SWIFT    swift_code=ABCcAUABD
    httpPost    ${payload}
    Assert response failed    ${FAILED_LENGTH_SWIFT_CODE_NOT_VALID}
