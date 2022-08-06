SELECT
    "Use of database mysql" AS "INFO";

USE mysql;

/*-----------------------------------------------------------*/
SELECT
    "Drop database aula1 if exist!" AS "INFO";

DROP DATABASE IF EXISTS aula1;

/*-----------------------------------------------------------*/
SELECT
    "The creating of database" AS "INFO";

CREATE DATABASE aula1;

/*-----------------------------------------------------------*/
SELECT
    "Use of database aula1" AS "INFO";

USE aula1;

/*-----------------------------------------------------------*/
SELECT
    "Drop database alunos if exist!" AS "INFO";

DROP TABLE IF EXISTS alunos;

SELECT
    "Drop database alunos if exist!" AS "INFO";

DROP TABLE IF EXISTS students;

/*-----------------------------------------------------------*/
SELECT
    "Create table students" AS "INFO";

CREATE TABLE students (
    id_aluno INTEGER AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    gender ENUM('MA', 'FE'),
    code_registration INTEGER UNIQUE,
    status BOOLEAN DEFAULT true,
    created_at DATETIME DEFAULT NOW(),
    deleted_at DATETIME,
    PRIMARY KEY (id_aluno)
);

/*-----------------------------------------------------------*/
DESC students;

/*-----------------------------------------------------------*/
INSERT INTO
    students (
        first_name,
        last_name,
        gender,
        code_registration
    )
VALUES
    (
        'Brunno',
        'Oliveira',
        'MA',
        1
    ),
    (
        'Ernani',
        'da Paz',
        'MA',
        2
    ),
    (
        'Douglas',
        'Arving',
        'MA',
        3
    );

/*-----------------------------------------------------------*/
SELECT
    *
FROM
    students;