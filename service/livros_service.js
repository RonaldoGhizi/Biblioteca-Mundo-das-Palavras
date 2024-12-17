const livrosRepository = require('../repository/livros_repository');

exports.listar = async function () {
  return await livrosRepository.listar();
};

exports.inserir = async function (livro) {
  if (
    livro &&
    livro.titulo &&
    livro.autor &&
    livro.isbn &&
    livro.ano &&
    livro.edicao &&
    livro.editora &&
    livro.imagem
  ) {
    return livrosRepository.inserir(livro);
  } else {
    throw {
      status: 'erro',
      codigo: 400,
      msg: 'Livro inserido com dados incorretos',
    };
  }
};

exports.buscarPorId = async function (id) {
  const livroEncontrado = await livrosRepository.buscarPorId(id);
  if (livroEncontrado) return livroEncontrado;
  else
    throw {
      status: 'erro',
      codigo: 404,
      msg: 'Livro com este id não existe',
    };
};

exports.atualizar = async function (id, atualizacao) {
  const livroEncontrado = await livrosRepository.buscarPorId(id);
  if (livroEncontrado) {
    if (
      atualizacao &&
      atualizacao.titulo &&
      atualizacao.autor &&
      atualizacao.isbn &&
      atualizacao.ano &&
      atualizacao.edicao &&
      atualizacao.editora &&
      atualizacao.usuario
    ) {
      return livrosRepository.atualizar(id, atualizacao);
    } else {
      throw {
        status: 'erro',
        codigo: 400,
        msg: 'Livro inserido com dados incorretos',
      };
    }
  } else
    throw {
      status: 'erro',
      codigo: 404,
      msg: 'Livro com este id não existe',
    };
};

exports.deletar = async function (id) {
  const livroEncontrado = await livrosRepository.buscarPorId(id);
  if (livroEncontrado) return livrosRepository.deletar(id);
  else
    throw {
      status: 'erro',
      codigo: 404,
      msg: 'Livro com este id não existe',
    };
};
