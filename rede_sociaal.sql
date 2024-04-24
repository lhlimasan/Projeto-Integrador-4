CREATE DATABASE rede_social;
USE rede_social;

-- Criando a tabela
CREATE TABLE usuarios (
    id_usuarios INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    foto_perfil VARCHAR(100) NOT NULL,
    criado_em DATETIME NOT NULL,
    atualizado_em DATETIME NOT NULL
);

-- Inserindo dados na tabela 'usuarios'
INSERT INTO usuarios (nome, data_nascimento, email, senha, foto_perfil, criado_em, atualizado_em) VALUES
('Carla1', '2010-11-01', 'carla1@gmail.com', 'senha321', 'ASOPASKDA4666', '2023-11-12 12:34:56', '2023-11-12 12:34:56'),
('Pedro2', '2017-11-02', 'pedro2@gmail.com', 'senha123', 'ASOPASKDA4667', '2023-11-12 12:36:00', '2023-11-12 12:36:00'),
('Rafaela3', '2018-11-03', 'rafaela3@gmail.com', 'senha456', 'ASOPASKDA4668', '2023-11-12 12:37:30', '2023-11-12 12:37:30'),
('Luis4', '2019-11-04', 'luis4@gmail.com', 'senha654', 'ASOPASKDA4669', '2023-11-12 12:39:15', '2023-11-12 12:39:15'),
('Beatriz5', '2020-11-05', 'beatriz5@gmail.com', 'senha789', 'ASOPASKDA4670', '2023-11-12 12:41:20', '2023-11-12 12:41:20'),
('Gustavo6', '2021-11-06', 'gustavo6@gmail.com', 'senha987', 'ASOPASKDA4671', '2023-11-12 12:43:05', '2023-11-12 12:43:05'),
('Joana7', '2022-11-07', 'joana7@gmail.com', 'senha234', 'ASOPASKDA4672', '2023-11-12 12:45:10', '2023-11-12 12:45:10'),
('Claudia8', '2011-11-08', 'claudia8@gmail.com', 'senha432', 'ASOPASKDA4673', '2023-11-12 12:47:25', '2023-11-12 12:47:25'),
('Leandro9', '2012-11-09', 'leandro9@gmail.com', 'senha345', 'ASOPASKDA4674', '2023-11-12 12:49:40', '2023-11-12 12:49:40'),
('Daniel10', '2013-11-10', 'daniel10@gmail.com', 'senha543', 'ASOPASKDA4675', '2023-11-12 12:51:55', '2023-11-12 12:51:55');

-- Criando a tabela 'postagem'
CREATE TABLE postagem (
    id_postagem INT AUTO_INCREMENT PRIMARY KEY,
    texto_postagem TEXT NOT NULL,
    data_hora DATETIME NOT NULL,
    id_usuarios INT NOT NULL,
    criado_em DATETIME NOT NULL,
    atualizado_em DATETIME NOT NULL,
    FOREIGN KEY (id_usuarios) REFERENCES usuarios(id_usuarios)
);

-- Inserindo dados na tabela 'postagem'
INSERT INTO postagem (texto_postagem, data_hora, id_usuarios, criado_em, atualizado_em) VALUES
('Conteúdo da postagem 1', '2023-11-12 10:00:00', 1, '2023-11-12 10:00:00', '2023-11-12 10:00:00'),
('Conteúdo da postagem 2', '2023-11-12 10:15:00', 2, '2023-11-12 10:15:00', '2023-11-12 10:15:00'),
('Conteúdo da postagem 3', '2023-11-12 10:30:00', 3, '2023-11-12 10:30:00', '2023-11-12 10:30:00'),
('Conteúdo da postagem 4', '2023-11-12 10:45:00', 4, '2023-11-12 10:45:00', '2023-11-12 10:45:00'),
('Conteúdo da postagem 5', '2023-11-12 11:00:00', 5, '2023-11-12 11:00:00', '2023-11-12 11:00:00'),
('Conteúdo da postagem 6', '2023-11-12 11:15:00', 6, '2023-11-12 11:15:00', '2023-11-12 11:15:00'),
('Conteúdo da postagem 7', '2023-11-12 11:30:00', 7, '2023-11-12 11:30:00', '2023-11-12 11:30:00'),
('Conteúdo da postagem extra 999', '2023-11-12 11:30:00', 7, '2023-11-12 11:30:00', '2023-11-12 11:30:00'),
('Conteúdo da postagem extra 96', '2023-11-12 11:30:00', 7, '2023-11-12 11:30:00', '2023-11-12 11:30:00'),
('Conteúdo da postagem extra 42', '2023-11-12 11:30:00', 7, '2023-11-12 11:30:00', '2023-11-12 11:30:00');

-- Consulta listando todas as postagens e os nomes dos usuários que as criaram, ordenadas pela data mais recente
SELECT postagem.id_postagem, postagem.texto_postagem, postagem.data_hora, usuarios.nome AS nome_usuario
FROM postagem
INNER JOIN usuarios ON postagem.id_usuarios = usuarios.id_usuarios
ORDER BY postagem.data_hora DESC;

-- Número de postagens feitas por cada usuário, ordenado pelo número de postagens em ordem decrescente
SELECT usuarios.nome AS nome_usuario, COUNT(postagem.id_postagem) AS num_postagens
FROM usuarios
LEFT JOIN postagem ON usuarios.id_usuarios = postagem.id_usuarios
GROUP BY usuarios.id_usuarios
ORDER BY num_postagens DESC;

-- Listar as postagens e o nome do usuário que as criou, ordenadas pelo nome do usuário em ordem alfabética
SELECT p.id_postagem, p.texto_postagem, u.nome AS nome_usuario
FROM postagem p
INNER JOIN usuarios u ON p.id_usuarios = u.id_usuarios
ORDER BY u.nome ASC;

-- Listar os usuários e a data de nascimento, ordenados pela data de nascimento em ordem crescente
SELECT nome, data_nascimento
FROM usuarios
ORDER BY data_nascimento ASC;

-- Contar o número de postagens feitas por cada usuário, exibindo o nome do usuário e a contagem de postagens, ordenados pelo número de postagens em ordem decrescente
SELECT usuarios.nome AS nome_usuario, COUNT(postagem.id_postagem) AS num_postagens
FROM usuarios
LEFT JOIN postagem ON usuarios.id_usuarios = postagem.id_usuarios
GROUP BY usuarios.id_usuarios
ORDER BY num_postagens DESC;
