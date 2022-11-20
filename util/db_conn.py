import sqlite3
from pathlib import Path


def get_db_conn():
    conn = sqlite3.connect(Path(__file__).resolve().parent.parent / "db/market.sqlite")
    return conn
