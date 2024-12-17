-- Tabela de Usuários
CREATE TABLE Usuarios (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255),
    Matricula INT UNIQUE,
    Senha VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Telefone VARCHAR(15),
    D_E_L_E_T_E BOOLEAN
);

-- Tabela de Autores
CREATE TABLE Autores (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255),
    Nacionalidade VARCHAR(255)
);

-- Tabela de Bibliotecários
CREATE TABLE Bibliotecario (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255),
    CPF VARCHAR(11) UNIQUE,
    Senha VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Telefone VARCHAR(15),
    D_E_L_E_T_E BOOLEAN
);

-- Tabela de Editora
CREATE TABLE Editora (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255),
    Nacionalidade VARCHAR(255)
);
-- Tabela de Livros
CREATE TABLE Livros (
    ID SERIAL PRIMARY KEY,
    Titulo VARCHAR(255),
    Autor INT, -- Foreign Key para a tabela Autores
    ISBN VARCHAR(13) UNIQUE,
    Ano INT,
    Edicao VARCHAR(50),
    Imagem VARCHAR(255),
    Editora INT, -- Foreign Key para a tabela Editora
    CONSTRAINT fk_autor FOREIGN KEY (Autor) REFERENCES Autores(ID),
    CONSTRAINT fk_editora FOREIGN KEY (Editora) REFERENCES Editora(ID);


-- Tabela de Livros Retirados
CREATE TABLE Livros_Retirados (
    ID SERIAL PRIMARY KEY,
    Livro INT, -- Foreign Key para a tabela Livros
    Usuario INT, -- Foreign Key para a tabela Usuarios
    Data_Retirada DATE,
    Data_Devolucao DATE,
    Data_Devolvido DATE,
    Multa NUMERIC(10, 2),
    CONSTRAINT fk_livro FOREIGN KEY (Livro) REFERENCES Livros(ID),
    CONSTRAINT fk_usuario_livro FOREIGN KEY (Usuario) REFERENCES Usuarios(ID)
);

-- TIRAR USUARIOS DE LIVROS
--ALTER TABLE livro DROP CONSTRAINT fk_usuario;
--ALTER TABLE livros DROP COLUMN usuario;

INSERT INTO Autores (Nome, Nacionalidade) VALUES
('Machado de Assis', 'Brasileiro'),
('J.K. Rowling', 'Britânica'),
('Gabriel García Márquez', 'Colombiano'),
('Jane Austen', 'Britânica'),
('F. Scott Fitzgerald', 'Americano'),
('Ernest Hemingway', 'Americano'),
('Clarice Lispector', 'Brasileira'),
('George Orwell', 'Britânico'),
('Haruki Murakami', 'Japonês'),
('Isaac Asimov', 'Americano');
-- Inserir 10 editoras na tabela Editora
INSERT INTO Editora (Nome, Nacionalidade) VALUES
('Companhia das Letras', 'Brasileira'),
('HarperCollins', 'Americana'),
('Penguin Random House', 'Americana'),
('Editora Record', 'Brasileira'),
('Rocco', 'Brasileira'),
('Alfred A. Knopf', 'Americana'),
('Editora do Brasil', 'Brasileira'),
('Leya', 'Portuguesa'),
('Cia. das Letras', 'Brasileira'),
('Jorge Zahar Editor', 'Brasileira');

-- Inserir 10 usuários na tabela Usuarios
INSERT INTO Usuarios (Nome, Matricula, Senha, Email, Telefone, D_E_L_E_T_E) VALUES
('Maria Silva', 123456, 'senha123', 'maria.silva@email.com', '(11) 98765-4321', FALSE),
('João Pereira', 123457, 'senha456', 'joao.pereira@email.com', '(11) 98876-5432', FALSE),
('Ana Costa', 123458, 'senha789', 'ana.costa@email.com', '(21) 99999-8888', FALSE),
('Carlos Almeida', 123459, 'senha101', 'carlos.almeida@email.com', '(21) 99988-7777', FALSE),
('Fernanda Oliveira', 123460, 'senha112', 'fernanda.oliveira@email.com', '(31) 98877-6666', FALSE),
('Ricardo Souza', 123461, 'senha113', 'ricardo.souza@email.com', '(31) 97766-5555', FALSE),
('Julia Santos', 123462, 'senha114', 'julia.santos@email.com', '(41) 96655-4444', FALSE),
('Pedro Lima', 123463, 'senha115', 'pedro.lima@email.com', '(41) 95544-3333', FALSE),
('Letícia Rocha', 123464, 'senha116', 'leticia.rocha@email.com', '(51) 94433-2222', FALSE),
('Marcelo Ferreira', 123465, 'senha117', 'marcelo.ferreira@email.com', '(51) 93322-1111', FALSE);

-- Inserir 10 bibliotecários na tabela Bibliotecario
INSERT INTO Bibliotecario (Nome, CPF, Senha, Email, Telefone, D_E_L_E_T_E) VALUES
('Luana Almeida', '12345678901', 'senha123', 'luana.almeida@email.com', '(11) 98765-4321', FALSE),
('Pedro Souza', '23456789012', 'senha456', 'pedro.souza@email.com', '(11) 98876-5432', FALSE),
('Juliana Costa', '34567890123', 'senha789', 'juliana.costa@email.com', '(21) 99999-8888', FALSE),
('Carlos Silva', '45678901234', 'senha101', 'carlos.silva@email.com', '(21) 99988-7777', FALSE),
('Fernanda Rocha', '56789012345', 'senha112', 'fernanda.rocha@email.com', '(31) 98877-6666', FALSE),
('Ricardo Pereira', '67890123456', 'senha113', 'ricardo.pereira@email.com', '(31) 97766-5555', FALSE),
('Tânia Lima', '78901234567', 'senha114', 'tania.lima@email.com', '(41) 96655-4444', FALSE),
('Roberta Santos', '89012345678', 'senha115', 'roberta.santos@email.com', '(41) 95544-3333', FALSE),
('Marcelo Ferreira', '90123456789', 'senha116', 'marcelo.ferreira@email.com', '(51) 94433-2222', FALSE),
('Gustavo Martins', '01234567890', 'senha117', 'gustavo.martins@email.com', '(51) 93322-1111', FALSE);

INSERT INTO Livros (Titulo, Autor, ISBN, Ano, Edicao, Imagem, Editora)
VALUES
('A Arte da Guerra', 1, '9788535918378', 2009, '1ª Edição', 'public/assets/img/imagem.pnj', 1),
('O Senhor dos Anéis - A Sociedade do Anel', 2, '9788544100155', 1954, '1ª Edição', 'public/assets/img/imagem.pnj', 2),
('1984', 3, '9780451524935', 1949, '1ª Edição', 'public/assets/img/imagem.pnj', 3),
('Dom Quixote', 4, '9788535912611', 1605, '1ª Edição', 'public/assets/img/imagem.pnj', 4),
('O Pequeno Príncipe', 5, '9788520920038', 1943, '1ª Edição', 'public/assets/img/imagem.pnj', 5),
('Cem Anos de Solidão', 6, '9788580441947', 1967, '1ª Edição', 'public/assets/img/imagem.pnj', 6),
('O Hobbit', 2, '9788544103170', 1937, '1ª Edição', 'public/assets/img/imagem.pnj', 2),
('A Revolução dos Bichos', 3, '9780451526342', 1945, '1ª Edição', 'public/assets/img/imagem.pnj', 3),
('O Primo Basílio', 4, '9788520920113', 1878, '1ª Edição', 'public/assets/img/imagem.jpeg', 4),
('A Metamorfose', 7, '9788535918699', 1915, '1ª Edição', 'public/assets/img/imagem.jpeg', 7);

INSERT INTO Livros_Retirados (Livro, Usuario, Data_Retirada, Data_Devolucao, Data_Devolvido, Multa) VALUES
(1, 1, '2024-10-01', '2024-10-15', NULL, 0.00),
(2, 2, '2024-10-05', '2024-10-20', NULL, 0.00),
(3, 3, '2024-10-10', '2024-10-25', NULL, 5.00);
