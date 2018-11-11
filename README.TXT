Tester: zhongqiang 13916737016

Environment

Macbook Air 			       10.11.6
python 				       2.7.10
robotframework 			       3.0.4
robotframework-ride                    2.0a1 
wxPython                               3.0.2.0
robotframework-requests                0.5.0
requests                               2.20.1

test endpoint url: http://preview.airwallex.com:30001/bank

Usage
1.Download from ;
2.untar to a local directory and change path to local directory;
3.run all case with AC tag via cmd: pybot -d ./log -i AC ./CollectCustomerBankInfoTest

Case overview:
Total 51 cases, and detail as follow testsuites,
CollectCustomerBankInfoTest
CollectCustomerBankInfoTest . Account Name Testsuite(for account name test,include tags:AC,accountName)
CollectCustomerBankInfoTest . Account Number	
CollectCustomerBankInfoTest . Account Number . Account Number Unvalid Testsuite(for account name test,tags:AC,accountNumber)
CollectCustomerBankInfoTest . Account Number . Account Number Valid Testsuite	
CollectCustomerBankInfoTest . Bank Country Code Testsuite(for bank country code,bsb,aba test,tags:AC,bankCountryCode,aba,bsb)
CollectCustomerBankInfoTest . Payment Method(for payment method test,tags:AC,payment)
CollectCustomerBankInfoTest . Payment Method . Payment Method Local Testsuite	
CollectCustomerBankInfoTest . Payment Method . Payment Method Swift Testsuite	

Bugs
Postive scenario:(expect success, got status code 400)
@cases:
Account name could be any 10 characters@CN@SWIFT 
account num could be any 20 characters@CN
field bsb could be dropped@CN
length of bsb should not be other except 6 @AU
field aba could be dropped@CN

Negative scenario:
1. expect 400,got 200
@cases:
account num should not be 7 characters@CN
field aba should be mandatory @US
length of aba should not be other except 9@US
length of swift code should not be 9 characters@AU

2. got unexpect error msg
@cases:
account num should not be 21 characters@CN
account num should not be 5 characters@AU
account num should not be 10 characters@AU
the 5th and 6th of swift code should math bank country code CN
the 5th and 6th of swift code should math bank country code US abnormal
length of swift code should not be 12 characters@CN

Disclaimer
There is a confused point in business requirement
say account number should be 1~17 characters for US in one place,
and another say account number should be 7~11 charaters for US in another place.
so could impact follow cases judgement, i just use 'fake' msg to compare with it at some of this cases
and need to double check this cases by eye.
@case:
account num should not be 18 characters@US
