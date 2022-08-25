DROP DATABASE IF EXISTS aprenderjoin;

CREATE DATABASE IF NOT EXISTS aprenderjoin CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE aprenderjoin;

DROP TABLE IF EXISTS restaurantes;

DROP TABLE IF EXISTS cidade;

DROP TABLE IF EXISTS estado;

DROP TABLE IF EXISTS pais;

CREATE TABLE IF NOT EXISTS pais (
    id_pais INTEGER AUTO_INCREMENT,
    nome VARCHAR(255),
    PRIMARY KEY(id_pais)
);

CREATE TABLE IF NOT EXISTS estado (
    id_estado INTEGER AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    regiao ENUM(
        'sul',
        'sudeste',
        'centro-oeste',
        'nordeste',
        'norte'
    ),
    PRIMARY KEY(id_estado)
);

CREATE TABLE IF NOT EXISTS cidade (
    id_cidade INTEGER AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    id_estado INTEGER NOT NULL,
    PRIMARY KEY(id_cidade),
    FOREIGN KEY (id_estado) REFERENCES estado(id_estado)
);

SELECT
    "ADD COUNTRIES" AS "INFO";

INSERT INTO
    pais (nome)
VALUES
    ('Brasil'),
    ('Africa'),
    ('Japão'),
    ('Alemanha'),
    ('Italia');

SELECT
    "ADD STATES" AS "INFO";

INSERT INTO
    estado (nome, regiao)
VALUES
    ('Parana', 'sul'),
    ('São Paulo', 'sudeste'),
    ('Rio de Janeiro', 'sudeste'),
    ('Bahia', 'nordeste'),
    ('Pernambuco', 'nordeste'),
    ('Pará', 'norte'),
    ('Mato Grosso', 'centro-oeste');

SET
    @idParana :=(
        SELECT
            id_estado
        FROM
            estado
        WHERE
            estado.nome = "Parana"
    );

SET
    @idSaoPaulo :=(
        SELECT
            id_estado
        FROM
            estado
        WHERE
            estado.nome = "São Paulo"
    );

SET
    @idRioDeJaneiro :=(
        SELECT
            id_estado
        FROM
            estado
        WHERE
            estado.nome = "Rio de Janeiro"
    );

SET
    @idBahia :=(
        SELECT
            id_estado
        FROM
            estado
        WHERE
            estado.nome = "Bahia"
    );

SET
    @idPernambuco :=(
        SELECT
            id_estado
        FROM
            estado
        WHERE
            estado.nome = "Pernambuco"
    );

SET
    @idPara :=(
        SELECT
            id_estado
        FROM
            estado
        WHERE
            estado.nome = "Pará"
    );

SET
    @idMatoGrosso :=(
        SELECT
            id_estado
        FROM
            estado
        WHERE
            estado.nome = "Mato Grosso"
    );

SELECT
    "ADD CITIES" AS "INFO";

INSERT INTO
    cidade (nome, id_estado)
VALUES
    ('Curitiba', @idParana),
    ('Londrina', @idParana),
    ('Paranagua', @idParana),
    ('São Paulo', @idSaoPaulo),
    ('Rio de Janeiro', @idSaoPaulo),
    ('Niteroi', @idRioDeJaneiro),
    ('Magé', @idRioDeJaneiro),
    ('Porto Real', @idRioDeJaneiro),
    ('Petrópoles', @idRioDeJaneiro),
    ('Salvador', @idBahia),
    ('Feira de Santana', @idBahia),
    ('Recife', @idPernambuco),
    ('Olinda', @idPernambuco),
    ('Petrolina', @idPernambuco),
    ('Belem', @idPara),
    ('Cuiaba', @idMatoGrosso);

SET
    @idParana :=(
        SELECT
            id_estado
        FROM
            estado
        WHERE
            estado.nome = "Parana"
    );

SET
    @idSaoPaulo :=(
        SELECT
            id_estado
        FROM
            estado
        WHERE
            estado.nome = "São Paulo"
    );

SET
    @idRioDeJaneiro :=(
        SELECT
            id_estado
        FROM
            estado
        WHERE
            estado.nome = "Rio de Janeiro"
    );

SET
    @idBahia :=(
        SELECT
            id_estado
        FROM
            estado
        WHERE
            estado.nome = "Bahia"
    );

SET
    @Pernambuco :=(
        SELECT
            id_estado
        FROM
            estado
        WHERE
            estado.nome = "Pernambuco"
    );

SET
    @idPara :=(
        SELECT
            id_estado
        FROM
            estado
        WHERE
            estado.nome = "Pará"
    );

SET
    @idMatoGrosso :=(
        SELECT
            id_estado
        FROM
            estado
        WHERE
            estado.nome = "Mato Grosso"
    );

SELECT
    *
FROM
    cidade;

SELECT
    *
FROM
    pais;

SELECT
    *
FROM
    estado;

SELECT
    estado.nome,
    estado.id_estado
FROM
    estado
WHERE
    estado.id_estado IN (
        SELECT
            cidade.id_estado
        FROM
            cidade
        WHERE
            cidade.nome = "Petrópoles"
    );

SELECT
    *
FROM
    cidade
    CROSS JOIN estado ON cidade.id_estado = estado.id_estado
WHERE
    cidade.nome = "Petrópoles";

CREATE TABLE restaurantes (
    id_restaurante INTEGER AUTO_INCREMENT,
    nome VARCHAR(255),
    descricao VARCHAR(255),
    endereco VARCHAR(255),
    id_cidade INTEGER,
    PRIMARY KEY(id_restaurante),
    FOREIGN KEY(id_cidade) REFERENCES cidade(id_cidade)
);

SET
    @idCuritibaCidade :=(
        SELECT
            id_cidade
        FROM
            cidade
        WHERE
            nome = 'Curitiba'
    );

SET
    @idLondrinaCidade :=(
        SELECT
            id_cidade
        FROM
            cidade
        WHERE
            nome = 'Londrina'
    );

SET
    @idParanaguaCidade :=(
        SELECT
            id_cidade
        FROM
            cidade
        WHERE
            nome = 'Paranagua'
    );

SET
    @idSaoPauloCidade :=(
        SELECT
            id_cidade
        FROM
            cidade
        WHERE
            nome = 'São Paulo'
    );

SET
    @idRioDeJaneiroCidade :=(
        SELECT
            id_cidade
        FROM
            cidade
        WHERE
            nome = 'Rio de Janeiro'
    );

SET
    @idNiteroiCidade :=(
        SELECT
            id_cidade
        FROM
            cidade
        WHERE
            nome = 'Niteroi'
    );

SET
    @idMageCidade :=(
        SELECT
            id_cidade
        FROM
            cidade
        WHERE
            nome = 'Magé'
    );

SET
    @idPortoRealCidade :=(
        SELECT
            id_cidade
        FROM
            cidade
        WHERE
            nome = 'Porto Real'
    );

SET
    @idPetropolesCidade :=(
        SELECT
            id_cidade
        FROM
            cidade
        WHERE
            nome = 'Petrópoles'
    );

SET
    @idSalvadorCidade :=(
        SELECT
            id_cidade
        FROM
            cidade
        WHERE
            nome = 'Salvador'
    );

SET
    @idFeiraDeSantanaCidade :=(
        SELECT
            id_cidade
        FROM
            cidade
        WHERE
            nome = 'Feira de Santana'
    );

SET
    @idRecifeCidade :=(
        SELECT
            id_cidade
        FROM
            cidade
        WHERE
            nome = 'Recife'
    );

SET
    @idOlindaCidade :=(
        SELECT
            id_cidade
        FROM
            cidade
        WHERE
            nome = 'Olinda'
    );

SET
    @idPetrolinaCidade :=(
        SELECT
            id_cidade
        FROM
            cidade
        WHERE
            nome = 'Petrolina'
    );

SET
    @idBelemCidade :=(
        SELECT
            id_cidade
        FROM
            cidade
        WHERE
            nome = 'Belem'
    );

SET
    @idCuiabaCidade :=(
        SELECT
            id_cidade
        FROM
            cidade
        WHERE
            nome = 'Cuiaba'
    );

INSERT INTO
    restaurantes (nome, descricao, id_cidade)
VALUES
    (
        'Minerão',
        'Só tem comida mineria da boa!',
        @idCuritibaCidade
    ),
    (
        'Fogo de Chão',
        'Churrasco gourmet que só rico come!',
        @idLondrinaCidade
    ),
    (
        'O Peixão',
        'Frutos do mar a vontade para quem tem o bolso cheio!',
        @idParanaguaCidade
    ),
    (
        'Boi Dourado',
        'Churrascaria da classe média!',
        @idSaoPauloCidade
    ),
    (
        'Panela Roxa',
        'Restaurante do chef Mauricio de Souza!',
        @idRioDeJaneiroCidade
    ),
    (
        'Gaucho da Pompeia',
        'Churrasco estilo rio grandense!',
        @idNiteroiCidade
    ),
    (
        'Pamplona Quente',
        'Restaurante que só Deus sabe o que tem lá!',
        @idMageCidade
    ),
    (
        'Panela de Barro',
        'Restaurante especializado em Barreado!',
        @idPortoRealCidade
    ),
    (
        'Cesto de Palha',
        'Restaurante vegano especializado em comidas frias.',
        @idPetropolesCidade
    ),
    (
        'Wikimaki',
        'Restaurante especializado em comidas tipicas Japonesas.',
        @idSalvadorCidade
    ),
    (
        'Mãos Mineiras',
        'Restaurante mineiro classe média.',
        @idFeiraDeSantanaCidade
    ),
    (
        'Azeite de Oliva',
        'Restaurante italiano, massas e calzones.',
        @idRecifeCidade
    ),
    (
        'Peixe Frito',
        'Restaurante de frutos do mar, restuarante barato.',
        @idOlindaCidade
    ),
    (
        'X-lombada do Pedrão',
        'Aquele restaurante onde só tem comida satisfátoria!',
        @idPetrolinaCidade
    ),
    (
        'Vegano do Pé Azul',
        'Restaurante do chef Boris Casoi!',
        @idBelemCidade
    ),
    (
        'Panela de Pressão',
        'Restaurante buffet por kilo, proximo ao terminal da cidade Sul!',
        @idCuiabaCidade
    );

SELECT
    *
FROM
    restaurantes;

SELECT
    "JOIN FINDING A 'CHURRASCARIA' ON RESTAURANTES - Restaurantes" AS "INFO";

SELECT
    *
FROM
    restaurantes
    INNER JOIN cidade ON cidade.id_cidade = restaurantes.id_cidade
WHERE
    restaurantes.descricao LIKE '%fruto%';

SELECT
    "JOIN FINDING A 'CHURRASCARIA' ON RESTAURANTES - Cidades" AS "INFO";

SELECT
    *
FROM
    cidade
    INNER JOIN restaurantes ON restaurantes.id_cidade = cidade.id_cidade
WHERE
    restaurantes.descricao LIKE '%minei%';

SELECT
    "CONTROLANDO COLUNAS" AS "INFO";

SELECT
    cidade.nome as nome_da_cidade,
    restaurantes.nome as nome_do_restaurante,
    restaurantes.descricao as descricao_do_restaurante
FROM
    cidade
    INNER JOIN restaurantes ON restaurantes.id_cidade = cidade.id_cidade
WHERE
    restaurantes.descricao LIKE '%minei%';

SELECT
    "JOIN FINDING WITH LEFT AND RIGHT JOIN" AS "INFO";

SELECT
    "JOIN FINDING A 'CHURRASCARIA' ON RESTAURANTES - Restaurantes" AS "INFO";

SELECT
    *
FROM
    restaurantes
    RIGHT JOIN cidade ON cidade.id_cidade = restaurantes.id_cidade
WHERE
    restaurantes.descricao LIKE '%fruto%';

SELECT
    "JOIN FINDING A 'CHURRASCARIA' ON RESTAURANTES - Cidades" AS "INFO";

SELECT
    *
FROM
    cidade
    LEFT JOIN restaurantes ON restaurantes.id_cidade = cidade.id_cidade
WHERE
    restaurantes.descricao LIKE '%minei%';

SELECT
    "TRANSFORMANDO EM UMA TABELA" AS "INFO";

SELECT
    t1.nome_da_cidade,
    t1.nome_do_restaurante
FROM
    (
        SELECT
            cidade.nome as nome_da_cidade,
            restaurantes.nome as nome_do_restaurante,
            restaurantes.descricao as descricao_do_restaurante
        FROM
            cidade
            INNER JOIN restaurantes ON restaurantes.id_cidade = cidade.id_cidade
        WHERE
            restaurantes.descricao LIKE '%m%'
    ) as t1
WHERE
    t1.nome_da_cidade = 'Curitiba';

SELECT
    "MAIS DE UM INNER JOIN" AS "INFO";

SELECT
    cidade.nome as nome_da_cidade,
    estado.nome as nome_do_estado,
    restaurantes.nome as nome_do_restaurante,
    restaurantes.descricao as descricao_do_restaurante
FROM
    cidade
    INNER JOIN restaurantes ON restaurantes.id_cidade = cidade.id_cidade
    INNER JOIN estado ON cidade.id_estado = estado.id_estado
WHERE
    restaurantes.descricao LIKE '%m%';