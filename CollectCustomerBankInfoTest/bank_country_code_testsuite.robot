*** Settings ***
Force Tags        bankCountryCode    aba    bsb
Resource          resource.txt

*** Test Cases ***
Field bank country code should be mandatory
    ${payload}    load test data    payload_US
    remove from dictionary    ${payload}    bank_country_code
    httpPost    ${payload}
    assert response failed    ${FAILED_BANK_COUNTRY_CODE_REQUIRED}

bank country code should not be JP
    ${payload}    load test data    payload_US    bank_country_code=JP
    httpPost    ${payload}
    assert response failed    ${FAILED_BANK_COUNTRY_CODE_REQUIRED}

field bsb should be mandatory @AU
    ${payload}    load test data    payload_AU
    remove from dictionary    ${payload}    bsb
    httpPost    ${payload}
    assert response failed    ${FAILED_BSB_REQUIRED_AU}

field bsb could be dropped@US
    ${payload}    load test data    payload_US
    remove from dictionary    ${payload}    bsb
    httpPost    ${payload}
    assert response passed

field bsb could be dropped@CN
    ${payload}    load test data    payload_CN
    remove from dictionary    ${payload}    bsb
    httpPost    ${payload}
    assert response passed

field bsb could be 6 characters@AU
    ${payload}    load test data    payload_AU    bsb=qqww23
    httpPost    ${payload}
    assert response passed

length of bsb should not be other except 6 @AU
    ${payload}    load test data    payload_AU    bsb=12345
    httpPost    ${payload}
    assert response failed    ${FAILED_LENGTH_BSB_NOT_VALID}
    ${payload}    load test data    payload_AU    bsb=1234567
    assert response failed    ${FAILED_LENGTH_BSB_NOT_VALID}
    httpPost    ${payload}
    ${payload}    load test data    payload_AU    bsb=123456
    assert response passed

field aba should be mandatory @US
    ${payload}    load test data    payload_US
    remove from dictionary    ${payload}    aba
    httpPost    ${payload}
    assert response failed    ${FAILED_ABA_REQUIRED_US}

field aba could be dropped@AU
    ${payload}    load test data    payload_AU
    remove from dictionary    ${payload}    aba
    httpPost    ${payload}
    assert response passed

field aba could be dropped@CN
    ${payload}    load test data    payload_CN
    remove from dictionary    ${payload}    aba
    httpPost    ${payload}
    assert response passed

field aba could be 9 characters@US
    ${payload}    load test data    payload_US    aba=123456789
    httpPost    ${payload}
    assert response passed

length of aba should not be other except 9@US
    ${payload}    load test data    payload_US    aba=123456789
    httpPost    ${payload}
    assert response passed
    ${payload}    load test data    payload_US    aba=123456
    assert response failed    ${FAILED_LENGTH_ABA_NOT_VALID}
    httpPost    ${payload}
    ${payload}    load test data    payload_US    aba=1234567890
    assert response failed    ${FAILED_LENGTH_ABA_NOT_VALID}
