const client = require('./database');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

exports.registrarUsuario = async function (usuario) {
  const { nome, matricula, senha, email, telefone } = usuario;

  try {
    const result = await client.query(
      'INSERT INTO usuarios (nome, matricula, senha, email, telefone, D_E_L_E_T_E) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *',
      [nome, matricula, senha, email, telefone, false]
    );
    return result.rows[0];
  } catch (err) {
    throw {
      status: 'erro',
      codigo: 500,
      erro: err.code,
      msg: 'Falha na inserção de dados do usuario',
    };
  }
};

exports.verificarUsuarioExistente = async function (usuario) {
  try {
    const contaExistente = await client.query(
      'SELECT * FROM usuarios WHERE matricula = $1',
      [usuario.matricula]
    );
    if (contaExistente.rows.length > 0) return contaExistente.rows[0];
    else return null;
  } catch (err) {
    throw {
      status: 'erro',
      codigo: 500,
      msg: 'Falha na consulta de dados',
    };
  }
};
