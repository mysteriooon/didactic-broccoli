import psycopg2.extras
from db import get_db


def get_poor_count():
    cursor = get_db().cursor(cursor_factory=psycopg2.extras.RealDictCursor)
    cursor.execute("""
    SELECT count(*) as count
    FROM people p
             LEFT JOIN (SELECT MAX(make_date(year := year::integer, month := month::integer, day := 1)),
                               MAX(summary_income) as inc,
                               passport
                        FROM fns
                        GROUP BY passport) as money on money.passport = p.passport
    WHERE money.inc < 10465.0;
    """)
    return cursor.fetchone()['count']


def get_poor_gender_stats():
    cursor = get_db().cursor(cursor_factory=psycopg2.extras.RealDictCursor)
    cursor.execute("""
    SELECT count(*) as count, p.gender
        FROM people p
                 LEFT JOIN (SELECT MAX(make_date(year := year::integer, month := month::integer, day := 1)),
                                   MAX(summary_income) as inc,
                                   passport
                            FROM fns
                            GROUP BY passport) as money on money.passport = p.passport
        WHERE money.inc < 10465.0
        GROUP BY p.gender
    """)
    return cursor.fetchall()
