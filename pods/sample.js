const postgres = require('postgres')

const sql = postgres({
  host: 'postgres',
  port: 5432,
  database: 'postgres',
  username: 'postgres',
  password: '1234',
})

console.log('Database Connected!')

const main = async () => {
  await sql`DROP TABLE IF EXISTS work_list;`
  await sql`CREATE TABLE work_list(id numeric, sido_cd text);`
  await sql`INSERT INTO work_list VALUES(1,'11');`
  await sql`INSERT INTO work_list VALUES(2,'28');`
  await sql`INSERT INTO work_list VALUES(3,'41');`

  const res = await sql`select * from work_list;`
  console.log(res)
  sql.close()
}

main()
