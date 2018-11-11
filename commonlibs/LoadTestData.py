# -*- coding:utf-8 -*-

import json
import payload
import sys
import os
import inspect
import copy
reload(sys)
sys.setdefaultencoding('utf8')
cur_path = os.path.dirname(os.path.abspath(__file__))
errmsg = os.path.join(cur_path, '../variables/errormsg.json')


class FakeTestDataException(Exception):
    def __init__(self, item):
        print 'Fake data error,field %s not exist in data template' % item


def load_test_data(template_type, **kwargs):
    customed_kv = kwargs
    try:
        data = copy.deepcopy(payload.template[template_type])
    except KeyError:
        raise FakeTestDataException(template_type)
    for key in customed_kv.keys():
        if key in data.keys():
            data[key] = str(customed_kv[key])
        else:
            raise FakeTestDataException(key)
    print "account number length %s" % str(len(data['account_number']))
    print "account name length %s" % str(len(data['account_name']))
    return data


def is_strings_equal(actual_str, expect_str):
    try:
        err_json = json.load(open(errmsg, 'r'))
        org_expect_msg = err_json[expect_str]
    except ValueError:
        print 'load json obj %s failed,pls check !' % errmsg
        raise ValueError
    except KeyError:
        print '%s maybe not in errormsg.json' % expect_str
        raise KeyError
    print type(actual_str), actual_str
    print type(org_expect_msg), org_expect_msg
    actual_msg = actual_str.strip()
    expect_msg = org_expect_msg.strip()
    if actual_msg == expect_msg:
        return True
    else:
        return False


def main():
    pass


if __name__ == '__main__':
    load_test_data('payload_US')
    print is_strings_equal(u"1", 'payment_method_wrong')