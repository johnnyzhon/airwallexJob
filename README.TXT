[Author] zhongqiang smone123@126.com

[Environment]

Macbook Air 			       10.11.6
python 				       2.7.10
robotframework 			       3.0.4
robotframework-ride                    2.0a1 
wxPython                               3.0.2.0
robotframework-requests                0.5.0
requests                               2.20.1

test endpoint url: http://preview.airwallex.com:30001/bank

[Usage]
0.Test macbook with above tools should be ready firstly;
1.Download from github;
2.untar to a local directory and change path to local directory;
3.run all case with AC tag via cmd: pybot -d ./log -i AC ./CollectCustomerBankInfoTest

[Testsuite overview]:
Total 51 cases, and detail as follow testsuites,
CollectCustomerBankInfoTest
CollectCustomerBankInfoTest . Account Name Testsuite (for account name test, tags:AC,accountName)
CollectCustomerBankInfoTest . Account Number	(for account name test,tags:AC,accountNumber)
CollectCustomerBankInfoTest . Account Number . Account Number Unvalid Testsuite
CollectCustomerBankInfoTest . Account Number . Account Number Valid Testsuite	
CollectCustomerBankInfoTest . Bank Country Code Testsuite(for bank country code,bsb,aba test,tags:AC,bankCountryCode,aba,bsb)
CollectCustomerBankInfoTest . Payment Method(for payment method test,tags:AC,payment)
CollectCustomerBankInfoTest . Payment Method . Payment Method Local Testsuite	
CollectCustomerBankInfoTest . Payment Method . Payment Method Swift Testsuite
CollectCustomerBankInfoTest . swift_code_testsuite (for swift code test,tags:AC,swiftCode)

[log]
You could find whole runing log in log directory,maybe helpful for dev investigate bugs.

[Bugs]
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

[Disclaimer]
1.There is a confused point in business requirement;
say account number should be 1~17 characters for US in one place,and say account number should be 7~11 charaters for US in another place.so impact follow cases judgement.
@case:
account num should not be 18 characters@US
2.some scenario did not define error msg in business requirement;
this cases is very wrong  by coincidence, so just use 'fake' msg to compare with it at some of this cases, and need to replace it later in cases.
@case: ...
PS: There maybe some misstake in cases due to time constraints, if has, sorry for that.
END
