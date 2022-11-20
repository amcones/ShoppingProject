from util.db_conn import get_db_conn


def check_login(account, password):
    conn = get_db_conn()
    cur = conn.cursor()
    cur.execute("select account,password,isadmin from users where account='%s'" % account)
    info = cur.fetchone()  # 由于数据库限制了用户名唯一，所以只会有一条记录
    if info is None:
        return -1
    else:
        if password == info[1]:
            return [info[0], info[2]]
        else:
            return 0
