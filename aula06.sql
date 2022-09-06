DROP DATABASE IF EXISTS aprendendoleft;

CREATE DATABASE aprendendoleft;

USE aprendendoleft;

CREATE TABLE classe (
    id_classe INTEGER NOT NULL AUTO_INCREMENT,
    nome_classe VARCHAR(100) NOT NULL,
    descricao TEXT,
    ano VARCHAR(4) NOT NULL,
    PRIMARY KEY(id_classe)
);

CREATE TABLE alunos (
    id_aluno INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    documento VARCHAR(255) NOT NULL,
    id_classe INTEGER,
    PRIMARY KEY (id_aluno),
    FOREIGN KEY (id_classe) REFERENCES classe(id_classe)
);

CREATE TABLE professores (
    id_professor INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    documento VARCHAR(255) NOT NULL,
    id_classe INTEGER,
    PRIMARY KEY (id_professor),
    FOREIGN KEY (id_classe) REFERENCES classe(id_classe)
);

INSERT INTO
    classe (nome_classe, descricao, ano)
VALUES
    ('A', 'Turma que entrou no inicio do ano', '2021'),
    ('B', 'Turma que entrou no meio do ano', '2021');

INSERT INTO
    alunos (nome, sobrenome, documento, id_classe)
VALUES
    ('Brunno', 'Sobrenome do Brunno', 'XX.XXX.XXX.X', 1),
    ('Bryan', 'Sobrenome do Bryan', 'XX.XXX.XXX.X', 1),
    ('Leandro', 'Sobrenome do Leandro', 'XX.XXX.XXX.X', 1),
    ('Luan', 'Sobrenome do Luan', 'XX.XXX.XXX.X', 1),
    ('Lucas', 'Sobrenome do Lucas', 'XX.XXX.XXX.X', 2),
    ('Aryon', 'Sobrenome do Aryon', 'XX.XXX.XXX.X', 2),
    ('Raphael', 'Sobrenome do Raphael', 'XX.XXX.XXX.X', 2),
    ('Leticia', 'Sobrenome do Leticia', 'XX.XXX.XXX.X', 2),
    ('Pedro', 'Sobrenome do Pedro', 'XX.XXX.XXX.X', 2),
    ('Guilherme', 'Sobrenome do Guilherme', 'XX.XXX.XXX.X', 2);

INSERT INTO
    alunos (nome, sobrenome, documento)
VALUES
    ('Ernani', 'Sobrenome do Ernani', 'XX.XXX.XXX.X');

SELECT "ALUNOS - INNER JOIN" AS "MESSAGE LOG";

SELECT
    alunos.nome
FROM
    alunos
INNER JOIN
    classe ON alunos.id_classe = classe.id_classe;

SELECT "ALUNOS - LEFT JOIN" AS "MESSAGE LOG";

SELECT
    alunos.nome
FROM
    alunos
LEFT JOIN
    classe ON alunos.id_classe = classe.id_classe;

SELECT "ALUNOS - INNER JOIN" AS "MESSAGE LOG";
