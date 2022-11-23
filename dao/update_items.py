from util.log_util import Logger

from util.db_conn import get_db_conn

logger = Logger()


def update_items(item_id, item_name, item_count, item_price, item_info, item_image):
    conn = get_db_conn()
    cur = conn.cursor()
    try:
        cur.execute("UPDATE items SET name  = '%s',count = %d,price = %f,info  = '%s',image = '%s' WHERE id = %d;" % (
            item_name, item_count, item_price, item_info, item_image, item_id))
        conn.commit()
    except Exception as e:
        logger.log.error(e)
    finally:
        cur.close()
        conn.close()
        return "success"


def insert_items(item_name, item_count, item_price, item_info, item_image):
    conn = get_db_conn()
    cur = conn.cursor()
    try:
        cur.execute("INSERT INTO items (name, count, price, info, image) VALUES ('%s', %d,%f,'%s','%s');" % (
            item_name, item_count, item_price, item_info, item_image))
        conn.commit()
    except Exception as e:
        logger.log.error(e)
    finally:
        cur.close()
        conn.close()
        return "success"


def delete_items(item_id):
    conn = get_db_conn()
    cur = conn.cursor()
    try:
        cur.execute("delete from items where id = %d" % item_id)
        conn.commit()
    except Exception as e:
        logger.log.error(e)
    finally:
        cur.close()
        conn.close()
        return "success"
