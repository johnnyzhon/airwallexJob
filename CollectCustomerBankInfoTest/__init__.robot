*** Settings ***
Suite Setup       Set Test Env Params
Force Tags        AC

*** Keywords ***
Set Test Env Params
    Set Global variable    ${GLOBAL_SERVER_URL}    http://preview.airwallex.com:30001
    Set Global variable    ${PASSED_MSG}    Bank details saved
    Set Global variable    ${FAILED_PAYMENT_METHOD_WRONG}    payment_method_wrong
    Set Global variable    ${FAILED_SWIFT_CODE_REQUIRED}    swift_code_required
    Set Global variable    ${FAILED_SWIFT_CODE_NOT_VALID_AU}    swift_code_not_valid_AU
    Set Global variable    ${FAILED_SWIFT_CODE_NOT_VALID_US}    swift_code_not_valid_US
    Set Global variable    ${FAILED_SWIFT_CODE_NOT_VALID_CN}    swift_code_not_valid_CN
    Set Global variable    ${FAILED_LENGTH_SWIFT_CODE_NOT_VALID}    length_swift_code_not_valid
    Set Global variable    ${FAILED_LENGTH_ACCOUNT_NUM_NOT_VALID_CN}    length_account_num_not_valid_CN
    set global variable    ${FAILED_LENGTH_ACCOUNT_NAME_NOT_VALID}    length_account_name_not_valid
    set global variable    ${FAILED_ACCOUNT_NAME_REQUIRED}    account_name_required
    set global variable    ${FAILED_ACCOUNT_NUMBER_REQUIRED}    account_number_required
    set global variable    ${FAILED_BANK_COUNTRY_CODE_REQUIRED}    bank_country_code_required
    set global variable    ${FAILED_BSB_REQUIRED_AU}    bsb_required_AU
    set global variable    ${FAILED_LENGTH_BSB_NOT_VALID}    length_bsb_not_valid
    set global variable    ${FAILED_ABA_REQUIRED_US}    aba_required_US
    set global variable    ${FAILED_LENGTH_ABA_NOT_VALID}    length_aba_not_valid
