#!/usr/bin/env python3

import sys
import requests
import traceback


def printinfo(r):
    print("v" * 80)
    print(r.status_code)
    print(r.url)
    print(r.headers)
    print("-"*80)
    print(r.content)
    print("^" * 80)


def main():
    host = sys.argv[1]
    port = int(sys.argv[2])
    r = None
    try:
        base_url = f"http://{host}:{port}"
        print("[+] Starting Check 2 for fstring error message ")
        sess = requests.Session()
        post_data = {"username": "demidog", "password": "princesses_password"}
        url = base_url + "/dogooo/login"
        r = sess.post(url, post_data, timeout=5)

        if r.status_code != 200:
            printinfo(r)
        # assert r.status_code == 200
        assert r.content.find(b"Create Post") > -1

        print("[+] Creating user ")
        uname = "{abs(-1)}"
        passw = "herehelies"
        #files = {'file': open('/round_rue_ninja.png', 'rb')}
        post_data = {"username": uname, "password": passw}
        url = base_url + "/dogooo/user/create"
        r = sess.post(url, data=post_data, timeout=5)
        if r.status_code != 200:
            printinfo(r)
        assert r.status_code == 200
        assert r.content.find(b"User Created") > -1

        print("[+] USER CREATED!")
        url = f"{base_url}/dogooo/login"
        r = requests.post(url, post_data, timeout=5)
        if r.status_code != 200:
            printinfo(r)
        assert r.status_code == 200
        #assert r.content.find(b"Only variable references") > -1
        print("[+] Received expected error message")
        
    except Exception as ex:
        print(ex)
        traceback.print_exc()
        if r is not None:
            print(r.url)
            print(r.headers)
            print(r.content)
        sys.exit(132)

    sys.exit(0)


if __name__ == '__main__':
    main()
