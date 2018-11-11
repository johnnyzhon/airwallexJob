# -*- coding:utf-8 -*-


payload_country_US = {
    "payment_method": "SWIFT",
    "bank_country_code": "US",
    "account_name": "Jaime blue",
    "account_number": "123a{_=|*&^%$#@!~",
    "swift_code": "ICBCUSBJ",
    "aba": "11122233A",
    "bsb": "qqww23"
}
payload_country_AU = {
    "payment_method": "SWIFT",
    "bank_country_code": "AU",
    "account_name": "Jon Snow",
    "account_number": "1a<:(*+;#",
    "swift_code": "ICBCAUBJZQ",
    "aba": "11122233A",
    "bsb": "qqww23"
}
payload_country_CN = {
    "payment_method": "SWIFT",
    "bank_country_code": "CN",
    "account_name": "Arya Stark",
    "account_number": "11~`!@(_+{[|:'.?/\\< ",
    "swift_code": "ICBCCNBJ12",
    "aba": "11122233A",
    "bsb": "qqww23"
}


template = {
    'payload_US': payload_country_US,
    'payload_AU': payload_country_AU,
    'payload_CN': payload_country_CN,
}

