import pymysql

def connection():
    conn = pymysql.connect(host="eu-cdbr-west-01.cleardb.com",
                           user="b23392502681a4",
                           passwd="a421218d",
                           db="heroku_d710c01591e6b23",
                           autocommit=True)

    c = conn.cursor()
    return c, conn
