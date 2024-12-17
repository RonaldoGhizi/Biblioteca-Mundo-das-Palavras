const client = require('./database');

exports.listar = async function () {
  try {
    const res = await client.query('SELECT * FROM livros');
    return res.rows;
  } catch (err) {
    throw {
      status: 'erro',
      codigo: 500,
      msg: 'Falha na consulta de dados',
    };
  }
};

exports.inserir = async function (obj) {
  try {
    console.log(obj)
    const res = await client.query(
      'INSERT into livros (titulo, autor, isbn, ano, edicao, editora,imagem) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *',
      Object.values(obj)
    );
    return res.rows[0];
  } catch (err) {
    throw {
      status: 'erro',
      codigo: 500,
      msg: 'Falha na inserção de dados',
    };
  }
};

exports.buscarPorId = async function (id) {
  try {
    const res = await client.query(`select l.titulo, a.nome as autor,l.isbn,l.ano,l.edicao,l.imagem,e.nome as editora from livros l
join autores  a on l.autor = a.id
join editora e on l.editora = e.id
where l.id = $1`, [id]);
    return res.rows[0];
  } catch (err) {
    throw {
      status: 'erro',
      codigo: 500,
      msg: 'Falha na consulta de dados',
    };
  }
};

exports.atualizar = async function (id, obj) {
  try {
    const res = await client.query(
      'UPDATE livros SET titulo = $1, autor = $2, isbn = $3, ano = $4, edicao = $5, editora = $6, usuario = $7 WHERE id = $8 RETURNING *',
      [...Object.values(obj), id]
    );
    return res.rows[0];
  } catch (err) {
    throw {
      status: 'erro',
      codigo: 500,
      msg: 'Falha na atualização de dados',
    };
  }
};

exports.deletar = async function (id) {
  try {
    const res = await client.query(
      'DELETE FROM livros WHERE id = $1 RETURNING *',
      [id]
    );
    return res.rows[0];
  } catch (err) {
    throw {
      status: 'erro',
      codigo: 500,
      msg: 'Falha na remoção de dados',
    };
  }
};
