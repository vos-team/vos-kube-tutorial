const postgres = require('postgres')

const sql = postgres({
  host: 'in-cluster-pg-hostname',
  port: 5432,
  database: 'postgres',
  username: 'postgres',
  password: process.env.POSTGRES_PASSWORD || 'password',
})

console.log('Database Connected!')

const main = async () => {
  await sql`DROP TABLE IF EXISTS work_list;`
  await sql`CREATE TABLE work_list(id numeric, sido_cd text, worker_id text default null, done bool default false);`
  await sql`INSERT INTO work_list VALUES(1,'11');`
  await sql`INSERT INTO work_list VALUES(2,'28');`
  await sql`INSERT INTO work_list VALUES(3,'41');`

  const res = await sql`select * from work_list;`
  console.log(res)
  sql.close()
}

main()
