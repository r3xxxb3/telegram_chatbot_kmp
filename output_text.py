import linecache
import time
import sys
import json
import requests
import urllib
import string
import mysql.connector

def PrintException():
    exc_type, exc_obj, tb = sys.exc_info()
    f = tb.tb_frame
    lineno = tb.tb_lineno
    filename = f.f_code.co_filename
    linecache.checkcache(filename)
    line = linecache.getline(filename, lineno, f.f_globals)
    print('EXCEPTION IN ({}, LINE {} "{}"): {}'.format(filename, lineno, line.strip(), exc_obj))

db = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="P3rson@5",
            db="db_bot",
            auth_plugin="mysql_native_password")

def database_search(word):
    search = "select id, id_jenis, kata from tb_kata where char_length(kata) <= "+ str((len(word) + 1)) +" and char_length(kata) >= "+ str((len(word) - 1))
    fetch = db.cursor()
    fetch.execute(search)
    data = fetch.fetchall()
    return data

def KMPSearch(pat, txt):
    M = len(pat)
    N = len(txt)
    lps = [0] * M
    computeLPSArray(pat, M, lps)
    i = 0
    j = 0
    val = 0

    while i <= N:

        if pat[j] == txt[i]:
            i += 1
            j += 1

        else:
            if j != 0:
                j = lps[j - 1]
                val += 1
            else:
                i += 1
                val += 1

        if j == M:
            # print(i-j)
            j = lps[j - 1]
            index = val / N * 100
            if index != None:
                found = index
            else:
                found = index
            return found

        if i == N:
            print(i)
            index = val / N * 100
            found = index
            print(found)
            if found <= 50:
                return found
            elif found > 50:
                return found





def computeLPSArray(pat, M, lps):
    len = 0
    i = 1
    lps[0] = 0

    while i < M:
        if pat[i] == pat[len]:
            len += 1
            lps[i] = len
            i += 1
        else:
            if len != 0:
                len = lps[len - 1]
            else:
                lps[i] = 0
                i += 1

if __name__ == '__main__':
    subjek = 0
    objek = 0
    predikat = 0
    keterangan = 0
    tanya = 0
    while True:
        try:
            zero = 0
            select = "select * from tb_inbox where flag = '"+str(zero)+"' "
            fetch = db.cursor()
            fetch.execute(select)
            dbinput = fetch.fetchall()
            db.commit()
            for sentence in dbinput:
                words = sentence[2].split()
                check = sentence[2].lower()
                for word in words:
                    lowed = word.lower()
                    datas = database_search(lowed)
                    for data in datas:
                        id = data[0]
                        jenis = data[1]
                        kata = data[2]
                        print(id)
                        print(jenis)
                        print(kata)

                        status = KMPSearch(kata, lowed)
                        print(status)
                        if status > 50:
                            continue
                        if status <= 50:
                            if jenis == 1:
                                # print("tanya")
                                tanya = id
                                print(tanya)
                            elif jenis == 2 :
                                # print("subjek")
                                if subjek == 0:
                                    subjek = id
                                elif objek > 0:
                                    objek = id
                                    print(objek)
                                else:
                                    objek = id
                                    print(objek)
                            elif jenis == 4 :
                                # print("predikat")
                                predikat = id
                                print(predikat)
                            elif jenis == 5 :
                                # print("keterangan")
                                keterangan = id
                                print(keterangan)
                            break

                search = "select balasan from tb_balasan where id_subjek = "+str(subjek)+" and id_tanya = "+str(tanya)+" and id_objek = "+str(objek)+" and id_predikat = "+str(predikat)+" and id_keterangan = "+str(keterangan)
                # print(subjek)
                fetch = db.cursor()
                fetch.execute(search)
                replys = fetch.fetchall()
                print(replys)
                output = "insert into tb_outbox(id_inbox, chat_id, out_msg, pengirim) values (%s, %s, %s, %s)"
                update = "update tb_inbox set flag = %s where id_inbox = %s"
                if check == "clear":
                    tanya = 0
                    subjek = 0
                    objek = 0
                    predikat = 0
                    keterangan = 0
                    print("okee")
                    values2 = '1', sentence[0]
                    exe = db.cursor()
                    exe.execute(update, values2)
                    db.commit()
                    continue
                elif replys != []:
                    i = 0
                    for reply in replys:
                        print(reply[i])
                        values = sentence[0], sentence[1], reply[i], "BOT"
                        exe = db.cursor()
                        exe.execute(output, values)
                        db.commit()
                        i+=1
                    cute = db.cursor()
                    values2 = '1', sentence[0]
                    cute.execute(update, values2)
                    db.commit()
                else:
                    chat = sentence[1]
                    reply = "Mohon maaf Bot tidak tau"
                    values2 = '1', sentence[0]
                    values = sentence[0], sentence[1], reply, "BOT"
                    exe = db.cursor()
                    cute = db.cursor()
                    exe.execute(output, values)
                    cute.execute(update, values2)
                    db.commit()
                    # send_message(reply, chat)
        except Exception as e:
            PrintException()