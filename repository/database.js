const pg = require('pg');
const { Client } = pg;

const client = new Client({
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'postgres',
});

client
  .connect()
  .then(() =>
    console.log('Conexão com banco de dados estabelecida com sucesso')
  )
  .catch((err) => console.log(err.message));
/*
client.query('Select * from bibliotecario', (err, res) => {
  if (!err) console.log(res);
  else console.log(err.message);
});*/

module.exports = client;
