import psycopg2

database = "postgres"
hostname = "postgres"
port = "5432"
user = "postgres"
pwd = "1234"

con = psycopg2.connect(f'postgresql://{user}:{pwd}@{hostname}:{port}/{database}')
print("Database Connected!")

cur = con.cursor()
cur.execute("DROP TABLE IF EXISTS work_list;")
cur.execute("CREATE TABLE work_list(id numeric, sido_cd text);")
cur.execute("INSERT INTO work_list VALUES(1,'11');")
cur.execute("INSERT INTO work_list VALUES(2,'28');")
cur.execute("INSERT INTO work_list VALUES(3,'41');")
con.commit()

cur.execute('select * from work_list')
for id, sido_cd in cur.fetchall():
    print(id, sido_cd)
