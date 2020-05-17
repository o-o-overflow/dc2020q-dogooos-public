#!/usr/bin/env python3

import sys
import requests
import traceback
import time

def printinfo(r):
    print("v" * 80)
    print(r.status_code)
    print(r.url)
    print(r.headers)
    print("-"*80)
    print(r.content)
    print("^" * 80)

def main():
    time.sleep(5)
    host = sys.argv[1]
    port = int(sys.argv[2])
    r = None
    try:
        print("[+] Starting test of adding Comment")
        base_url = f"http://{host}:{port}"
        #post_data = "username=demidog&password=princess'
        post_data = {"comment":"this_is_a_comment", "commenter":"anon"}
        url = base_url + "/dogooo/deets/add/1"
        r = requests.post(url, post_data, timeout=5)

        if r.status_code != 200:
            printinfo(r)

        assert r.status_code == 200

        assert r.content.find(b"this_is_a_comment") > -1

        print("[+] Starting test of Session ")
        sess = requests.Session()
        post_data = {"username": "demidog", "password": "princesses_password"}
        url = base_url + "/dogooo/login"

        r = sess.post(url, post_data, timeout=5)

        # assert r.status_code == 200
        if r.content.find(b"This is Frida. She became Mexic") == -1:
            printinfo(r)
        assert r.content.find(b"This is Frida. She became Mexic") > -1

        print("[+] Testing create ")
        #print(r.content)
        files = {'file': open('/round_rue_ninja.png', 'rb')}
        values = {'DB': 'photcat', 'OUT': 'csv', 'SHORT': 'short'}
        post_data = {"post_text": "this_is_a_rad_dog", "rating":15}
        url = base_url + "/dogooo/create"
        r = sess.post(url, data=post_data, files=files, timeout=5)
        if r.status_code != 200:
            printinfo(r)
        assert r.status_code == 200

        if r.content.find(b"Post Saved") == -1:
            printinfo(r)
        assert r.content.find(b"Post Saved") > -1

    except Exception as ex:
        print(ex)
        traceback.print_exc()
        if r is not None:
            print(r.url)
            print(r.headers)
            print(r.content)
        sys.exit(99)

    sys.exit(0)


if __name__ == '__main__':
    main()
