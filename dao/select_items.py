import logging

from util.db_conn import get_db_conn
from util.log_util import Logger

logger = Logger()


def select_items(item_info):
    conn = get_db_conn()
    cur = conn.cursor()
    logger.getLog().info("selecting from db")
    try:
        cur.execute("select * from items where id='%s' or name like '%%%s%%'" % (item_info, item_info))
        itemList = cur.fetchall()
        return itemList
    except Exception as e:
        logger.log.error(e)
    finally:
        cur.close()
        conn.close()


def select_all_items():
    conn = get_db_conn()
    cur = conn.cursor()
    logger.log.info("selecting from db")
    try:
        cur.execute("select * from items")
        itemList = cur.fetchall()
        return itemList
    except Exception as e:
        logger.log.error(e)
    finally:
        cur.close()
        conn.close()
