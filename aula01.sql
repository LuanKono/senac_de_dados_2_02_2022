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
    "Select specific columns! --version 00" AS "INFO";

/*-----------------------------------------------------------*/
SELECT
    *
FROM
    students;

/*-----------------------------------------------------------*/
SELECT
    "Select specific columns! --version 01" AS "INFO";

/*-----------------------------------------------------------*/
SELECT
    first_name,
    last_name,
    gender
FROM
    students;

/*-----------------------------------------------------------*/
SELECT
    "Select specific columns! --version 02" AS "INFO";

/*-----------------------------------------------------------*/
SELECT
    students.first_name,
    students.last_name,
    students.gender
FROM
    students;

/*-----------------------------------------------------------*/
SELECT
    "Select specific columns! --version 03" AS "INFO";

/*-----------------------------------------------------------*/
SELECT
    aula1.students.first_name,
    aula1.students.last_name,
    aula1.students.gender
FROM
    aula1.students;

/*-----------------------------------------------------------*/
SELECT
    "Select specific columns! --version 04" AS "INFO";

/*-----------------------------------------------------------*/
SELECT
    aula1.students.first_name as primeiro_nome,
    aula1.students.last_name as segundo_nome,
    aula1.students.gender as sexo
FROM
    aula1.students;

/*-----------------------------------------------------------*/
SELECT
    "Select specific columns! --version 05" AS "INFO";

/*-----------------------------------------------------------*/
SELECT
    students.first_name as primeiro_nome,
    students.last_name as segundo_nome,
    students.gender as sexo
FROM
    students WHERE students.first_name = 'Ernani';