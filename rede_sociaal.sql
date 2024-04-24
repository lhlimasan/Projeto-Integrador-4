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

-- Criando a tabela 'comentarios'
CREATE TABLE comentarios (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    texto_comentario TEXT NOT NULL,
    data_hora DATETIME NOT NULL,
    id_usuarios INT NOT NULL,
    id_postagem INT NOT NULL,
    criado_em DATETIME NOT NULL,
    atualizado_em DATETIME NOT NULL,
    FOREIGN KEY (id_usuarios) REFERENCES usuarios(id_usuarios),
    FOREIGN KEY (id_postagem) REFERENCES postagem(id_postagem)
);

-- Inserindo dados na tabela 'comentarios'
INSERT INTO comentarios (texto_comentario, data_hora, id_usuarios, id_postagem, criado_em, atualizado_em)
VALUES 
('Boa noite', '2023-11-12 20:00:00', 1, 2, '2023-11-12 20:00:00', '2023-11-12 20:00:00'),
('O poder do fogo', '2023-11-12 20:15:00', 2, 3, '2023-11-12 20:15:00', '2023-11-12 20:15:00'),
('Encontramos a verdadeira essência', '2023-11-12 20:30:00', 3, 4, '2023-11-12 20:30:00', '2023-11-12 20:30:00'),
('A noite é meu refúgio', '2023-11-12 20:45:00', 4, 5, '2023-11-12 20:45:00', '2023-11-12 20:45:00'),
('Sigo a luz da lua', '2023-11-12 21:00:00', 5, 6, '2023-11-12 21:00:00', '2023-11-12 21:00:00'),
('Caminhando pela rua', '2023-11-12 21:15:00', 6, 7, '2023-11-12 21:15:00', '2023-11-12 21:15:00'),
('O sol me chama', '2023-11-12 21:30:00', 7, 8, '2023-11-12 21:30:00', '2023-11-12 21:30:00'),
('A noite é testemunha', '2023-11-12 21:45:00', 8, 9, '2023-11-12 21:45:00', '2023-11-12 21:45:00'),
('O time é meu aliado', '2023-11-12 22:00:00', 9, 10, '2023-11-12 22:00:00', '2023-11-12 22:00:00'),
('Sinto a presença dele', '2023-11-12 22:15:00', 10, 1, '2023-11-12 22:15:00', '2023-11-12 22:15:00');

-- Criando a tabela 'curtidas'
CREATE TABLE curtidas (
    id_curtida INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    id_postagem INT NOT NULL,
    id_usuarios INT NOT NULL,
    criado_em DATETIME NOT NULL,
    atualizado_em DATETIME NOT NULL,
    FOREIGN KEY (id_postagem) REFERENCES postagem(id_postagem),
    FOREIGN KEY (id_usuarios) REFERENCES usuarios(id_usuarios)
);

-- Inserindo dados na tabela 'curtidas'
INSERT INTO curtidas (data_hora, id_postagem, id_usuarios, criado_em, atualizado_em)
VALUES 
('2023-11-12 14:00:00', 1, 1, '2023-11-12 14:00:00', '2023-11-12 14:00:00'),
('2023-11-12 14:15:00', 2, 2, '2023-11-12 14:15:00', '2023-11-12 14:15:00'),
('2023-11-12 14:30:00', 3, 3, '2023-11-12 14:30:00', '2023-11-12 14:30:00'),
('2023-11-12 14:45:00', 4, 4, '2023-11-12 14:45:00', '2023-11-12 14:45:00'),
('2023-11-12 15:00:00', 5, 5, '2023-11-12 15:00:00', '2023-11-12 15:00:00'),
('2023-11-12 15:15:00', 6, 6, '2023-11-12 15:15:00', '2023-11-12 15:15:00'),
('2023-11-12 15:30:00', 7, 7, '2023-11-12 15:30:00', '2023-11-12 15:30:00'),
('2023-11-12 15:45:00', 8, 8, '2023-11-12 15:45:00', '2023-11-12 15:45:00'),
('2023-11-12 16:00:00', 9, 9, '2023-11-12 16:00:00', '2023-11-12 16:00:00'),
('2023-11-12 16:15:00', 10, 10, '2023-11-12 16:15:00', '2023-11-12 16:15:00'),
('2023-12-12 18:15:00', 3, 2, '2023-11-12 16:15:00', '2023-11-12 16:15:00'),
('2023-12-12 18:20:00', 3, 5, '2023-11-12 16:15:00', '2023-11-12 16:15:00'),
('2023-12-12 18:22:00', 3, 6, '2023-11-12 16:15:00', '2023-11-12 16:15:00'),
('2023-12-12 18:25:00', 3, 9, '2023-11-12 16:15:00', '2023-11-12 16:15:00'),
('2023-12-13 12:30:00', 5, 2, '2023-11-13 10:30:00', '2023-11-13 10:30:00'),
('2023-12-13 12:35:00', 5, 5, '2023-11-13 10:30:00', '2023-11-13 10:30:00'),
('2023-12-13 12:40:00', 5, 6, '2023-11-13 10:30:00', '2023-11-13 10:30:00'),
('2023-12-13 14:00:00', 9, 2, '2023-11-13 12:00:00', '2023-11-13 12:00:00'),
('2023-12-13 14:05:00', 9, 5, '2023-11-13 12:00:00', '2023-11-13 12:00:00'),
('2023-12-13 14:10:00', 9, 6, '2023-11-13 12:00:00', '2023-11-13 12:00:00'),
('2023-12-13 14:15:00', 9, 8, '2023-11-13 12:00:00', '2023-11-13 12:00:00'),
('2023-12-13 14:20:00', 9, 1, '2023-11-13 12:00:00', '2023-11-13 12:00:00');


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

-- Postagem, usuario, qtd curtidas e qtd comentários
SELECT 
    p.id_postagem, 
    p.texto_postagem, 
    u.nome AS nome_usuario,
    COUNT(cu.id_curtida) AS num_curtidas,
    COUNT(co.id_comentario) AS num_comentarios
FROM postagem p
INNER JOIN usuarios u ON p.id_usuarios = u.id_usuarios
LEFT JOIN curtidas cu ON p.id_postagem = cu.id_postagem
LEFT JOIN comentarios co ON p.id_postagem = co.id_postagem
GROUP BY p.id_postagem, p.texto_postagem, u.nome;

-- Comentario feito por um usuario
SELECT 
    co.texto_comentario, 
    co.data_hora, 
    u.nome AS nome_usuario
FROM comentarios co
INNER JOIN usuarios u ON co.id_usuarios = u.id_usuarios
WHERE co.id_postagem = 4;

-- Curtidas de uma postagem específica, exibindo data da curtida e usuário
SELECT 
    cu.data_hora, 
    u.nome AS nome_usuario
FROM curtidas cu
INNER JOIN usuarios u ON cu.id_usuarios = u.id_usuarios
WHERE cu.id_postagem = 5;
