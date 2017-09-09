import pymysql


def connection():
    conn = pymysql.connect(host="@DB_HOST",
                           user="@DB_USER",
                           passwd="@DB_USER_PWD",
                           db="@DB_NAME",
                           autocommit=True)

    c = conn.cursor()
    return c, conn