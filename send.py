import linecache
import sys
import json
import requests
import urllib
import string
from Sastrawi.Stemmer.StemmerFactory import StemmerFactory
factory = StemmerFactory()
stemmer = factory.create_stemmer()
import mysql.connector

db = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="P3rson@5",
            db="db_bot",
            auth_plugin="mysql_native_password")

# token dari bot setelah daftar di @botfather
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

def send_message(text, chat_id):
    text = urllib.parse.quote_plus(text)
    url = URL + "sendMessage?text={}&chat_id={}".format(text, chat_id)
    get_url(url)

if __name__ == '__main__':
    while True:
        try:
            zero = 0
            select = "select * from tb_outbox where flag = '"+str(zero)+"' "
            update = "update tb_outbox set flag = %s where id_outbox = %s"
            fetch = db.cursor()
            fetch.execute(select)
            dbinput = fetch.fetchall()
            db.commit()
            print(dbinput)
            for sentence in dbinput:
                chatid = sentence[2]
                msg = sentence[3]
                values = '1', sentence[0]
                send_message(msg, chatid)
                fetch.execute(update, values)
                db.commit()
        except Exception as e:
            PrintException()