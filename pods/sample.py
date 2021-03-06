import psycopg2
import os

database = "postgres"
hostname = "in-cluster-pg-hostname"
port = "5432"
user = "postgres"
pwd = os.environ.get('POSTGRES_PASSWORD') or 'password'

con = psycopg2.connect(f'postgresql://{user}:{pwd}@{hostname}:{port}/{database}')
print("Database Connected!")

cur = con.cursor()
cur.execute("DROP TABLE IF EXISTS work_list;")
cur.execute("CREATE TABLE work_list(id numeric, sido_cd text, worker_id text default null, done bool default false);")
cur.execute("INSERT INTO work_list VALUES(1,'11');")
cur.execute("INSERT INTO work_list VALUES(2,'28');")
cur.execute("INSERT INTO work_list VALUES(3,'41');")
con.commit()

cur.execute('select * from work_list')
for id, sido_cd, _, _ in cur.fetchall():
    print(id, sido_cd)
