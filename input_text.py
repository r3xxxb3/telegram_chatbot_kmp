import linecache
import sys
import json
import requests
import urllib
import string
import mysql.connector


db = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="P3rson@5",
            db="db_bot",
            auth_plugin="mysql_native_password")

TOKEN = "1201255394:AAGM8HeD6UPaLn-EFrxilTv2COuPKjXF73w"
# url dari bot
URL = "https://api.telegram.org/bot{}/".format(TOKEN)

def PrintException():
    exc_type, exc_obj, tb = sys.exc_info()
    f = tb.tb_frame
    lineno = tb.tb_lineno
    filename = f.f_code.co_filename
    linecache.checkcache(filename)
    line = linecache.getline(filename, lineno, f.f_globals)
    print('EXCEPTION IN ({}, LINE {} "{}"): {}'.format(filename, lineno, line.strip(), exc_obj))

def get_url(url):
    response = requests.get(url)
    content = response.content.decode("utf8")
    return content

#fungsi untuk mendapatkan file json dari url lalu ditaruh di variabel js
def get_json_from_url(url):
    content = get_url(url)
    js = json.loads(content)
    return js


#fungsi untuk mendapatkan chat id dan text terbaru lalu ditaruh di variabel text dan chat_id
def get_last_chat_id_and_text(updates):
    num_updates = len(updates["result"])
    last_update = num_updates - 1
    text = updates["result"][last_update]["message"]["text"]
    chat_id = updates["result"][last_update]["message"]["chat"]["id"]
    return (text, chat_id)


#fungsi untuk mendapatkan update json
def get_updates(offset=None):
    url = URL + "getUpdates?timeout=100"
    if offset:
        url += "&offset={}".format(offset)
    js = get_json_from_url(url)
    return js

#fungsi untuk mendapatkan id update terbaru
def get_last_update_id(updates):
    update_ids = []
    for update in updates["result"]:
        update_ids.append(int(update["update_id"]))
    return max(update_ids)



if __name__ == '__main__':
    last_update_id = None
    while True:
        updates = get_updates(last_update_id)
        if len(updates["result"]) > 0:
            last_update_id = get_last_update_id(updates) + 1
            for update in updates["result"]:
                try:
                    text = update["message"]["text"]
                    firstName = update["message"]["chat"]["first_name"]
                    full = firstName
                    chat = update["message"]["chat"]["id"]
                    insert = "insert into tb_inbox(chat_id, in_msg, pengirim) values ("+str(chat)+", '"+text+"', '"+full+"')"
                    fetch = db.cursor()
                    fetch.execute(insert)
                    db.commit()
                except Exception as e:
                    PrintException()