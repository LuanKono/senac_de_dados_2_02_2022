DROP DATABASE IF EXISTS aprenderjoin;

CREATE DATABASE IF NOT EXISTS aprenderjoin CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE aprenderjoin;

DROP TABLE IF EXISTS garcom_restaurantes;

DROP TABLE IF EXISTS garcom;

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
    ('Japao'),
    ('Alemanha'),
    ('Italia');

SELECT
    "ADD STATES" AS "INFO";

INSERT INTO
    estado (nome, regiao)
VALUES
    ('Parana', 'sul'),
    ('Sao Paulo', 'sudeste'),
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
            estado.nome = "Sao Paulo"
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
    ('Sao Paulo', @idSaoPaulo),
    ('Rio de Janeiro', @idSaoPaulo),
    ('Niteroi', @idRioDeJaneiro),
    ('Mage', @idRioDeJaneiro),
    ('Porto Real', @idRioDeJaneiro),
    ('Petropoles', @idRioDeJaneiro),
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
            estado.nome = "Sao Paulo"
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
            cidade.nome = "Petropoles"
    );

SELECT
    *
FROM
    cidade
    CROSS JOIN estado ON cidade.id_estado = estado.id_estado
WHERE
    cidade.nome = "Petropoles";

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
            nome = 'Sao Paulo'
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
            nome = 'Mage'
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
            nome = 'Petropoles'
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
        'Minerao',
        'So tem comida mineria da boa!',
        @idCuritibaCidade
    ),
    (
        'Fogo de Chao',
        'Churrasco gourmet que so rico come!',
        @idLondrinaCidade
    ),
    (
        'O Peixao',
        'Frutos do mar a vontade para quem tem o bolso cheio!',
        @idParanaguaCidade
    ),
    (
        'Boi Dourado',
        'Churrascaria da classe media!',
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
        'Restaurante que so Deus sabe o que tem lá!',
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
        'Maos Mineiras',
        'Restaurante mineiro classe media.',
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
        'X-lombada do Pedrao',
        'Aquele restaurante onde so tem comida satisfátoria!',
        @idPetrolinaCidade
    ),
    (
        'Vegano do Pe Azul',
        'Restaurante do chef Boris Casoi!',
        @idBelemCidade
    ),
    (
        'Panela de Pressao',
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

SELECT
    "Restaurante com cidade NULL" AS "INFO";

INSERT INTO
    restaurantes (nome, descricao)
VALUES
    (
        'Restaurante sem cidade alguma',
        'Descriçao ja esta no nome'
    );

SELECT
    "Fazendo busca com cidade na esquerda em registro sem relacao entre ambas as tabelas" AS "LOG";

SELECT
    *
FROM
    cidade
    INNER JOIN restaurantes ON cidade.id_cidade = restaurantes.id_cidade
WHERE
    restaurantes.nome = "Restaurante sem cidade alguma";

SELECT
    "Fazendo busca com restaurante na esquerda em registro sem relacao entre ambas as tabelas" AS "LOG";

SELECT
    *
FROM
    restaurantes
    INNER JOIN cidade ON cidade.id_cidade = restaurantes.id_cidade
WHERE
    restaurantes.nome = "Restaurante sem cidade alguma";

SELECT
    "Traga tudo" AS "LOG";

SELECT
    cidade.nome,
    restaurantes.nome
FROM
    restaurantes
    INNER JOIN cidade ON cidade.id_cidade = restaurantes.id_cidade;

SELECT
    "Traga o NULL" AS "LOG";

SELECT
    cidade.nome,
    restaurantes.nome
FROM
    restaurantes
    LEFT JOIN cidade ON cidade.id_cidade = restaurantes.id_cidade;

SELECT
    "Traga o NULL" AS "LOG";

SELECT
    cidade.nome,
    restaurantes.nome
FROM
    cidade
    LEFT JOIN restaurantes ON restaurantes.id_cidade = cidade.id_cidade;

INSERT INTO
    restaurantes (nome, descricao, id_cidade)
VALUES
    (
        'Mc Donalds',
        '3 Bigmacs',
        @idCuritibaCidade
    ),
    (
        'Habbibs',
        'Homem bomba',
        @idCuritibaCidade
    ),
    (
        'Terrazo',
        'Restaurante de rico',
        @idCuritibaCidade
    ),
    (
        'Calabouco ',
        'mais rico ainda',
        @idCuritibaCidade
    );

SELECT
    "Insira restaurante mineiro em Sao Paulo" AS "LOG";

INSERT INTO
    restaurantes (nome, descricao, id_cidade)
VALUES
    (
        'Comida tipica mineira',
        'Comida mineira e nada mais',
        @idSaoPauloCidade
    );

SELECT
    "Traga restaurantes de Curitiba e Sao Paulo" AS "LOG";

SELECT
    *
FROM
    restaurantes
    INNER JOIN cidade ON restaurantes.id_cidade = cidade.id_cidade
WHERE
    cidade.nome IN ('Curitiba', 'Sao Paulo');

CREATE TABLE garcom (
    id_garcom INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR (255) NOT NULL,
    experiencia ENUM ('junior', 'pleno', 'senior '),
    tipo_documento ENUM('cpf', 'rg'),
    documento VARCHAR(255),
    PRIMARY KEY (id_garcom)
);

INSERT INTO
    garcom (
        nome,
        experiencia,
        tipo_documento,
        documento
    )
VALUES
    ('Jorge', 'junior', 'cpf', '08600000000'),
    ('Fernando', 'pleno', 'cpf', '08600000000'),
    ('Roberto', 'pleno', 'rg', '100000000'),
    ('Alexandre', 'pleno', 'rg', '100000000'),
    ('Odair', 'pleno', 'rg', '100000000'),
    ('Gerson', 'senior', 'cpf', '08600000000'),
    ('Pedro', 'senior', 'cpf', '08600000000'),
    ('Joao', 'senior', 'cpf', '08600000000');

SELECT
    "AQUI SELECT" AS "LOG";

SELECT
    *
FROM
    garcom;

SELECT
    "AQUI CREATE" AS "LOG";

CREATE TABLE garcom_restaurantes (
    id_restaurante INTEGER NOT NULL,
    id_garcom INTEGER NOT NULL,
    dia_semana ENUM(
        'segunda',
        'terca',
        'quarta',
        'quinta',
        'sexta',
        'sabado',
        'domingo'
    ),
    FOREIGN KEY (id_restaurante) REFERENCES restaurantes(id_restaurante),
    FOREIGN KEY (id_garcom) REFERENCES garcom(id_garcom)
);

SELECT
    "AQUI INSERT" AS "LOG";

INSERT INTO
    garcom_restaurantes (id_restaurante, id_garcom, dia_semana)
VALUES
    (
        (
            SELECT
                id_restaurante
            FROM
                restaurantes
            WHERE
                restaurantes.nome = "Terrazo"
        ),
        (
            SELECT
                id_garcom
            FROM
                garcom
            WHERE
                garcom.nome = "Jorge"
        ),
        'segunda'
    ),
    (
        (
            SELECT
                id_restaurante
            FROM
                restaurantes
            WHERE
                restaurantes.nome = "Habbibs"
        ),
        (
            SELECT
                id_garcom
            FROM
                garcom
            WHERE
                garcom.nome = "Fernando"
        ),
        'terca'
    ),
    (
        (
            SELECT
                id_restaurante
            FROM
                restaurantes
            WHERE
                restaurantes.nome = "Calabouco"
        ),
        (
            SELECT
                id_garcom
            FROM
                garcom
            WHERE
                garcom.nome = "Roberto"
        ),
        'quarta'
    ),
    (
        (
            SELECT
                id_restaurante
            FROM
                restaurantes
            WHERE
                restaurantes.nome = "Fogo de Chao"
        ),
        (
            SELECT
                id_garcom
            FROM
                garcom
            WHERE
                garcom.nome = "Alexandre"
        ),
        'quinta'
    ),
    (
        (
            SELECT
                id_restaurante
            FROM
                restaurantes
            WHERE
                restaurantes.nome = "v"
        ),
        (
            SELECT
                id_garcom
            FROM
                garcom
            WHERE
                garcom.nome = "Gerson"
        ),
        'sexta'
    ),
    (
        (
            SELECT
                id_restaurante
            FROM
                restaurantes
            WHERE
                restaurantes.nome = "O Peixao"
        ),
        (
            SELECT
                id_garcom
            FROM
                garcom
            WHERE
                garcom.nome = "Joao"
        ),
        'sabado'
    ),
    (
        (
            SELECT
                id_restaurante
            FROM
                restaurantes
            WHERE
                restaurantes.nome = "Panela Roxa"
        ),
        (
            SELECT
                id_garcom
            FROM
                garcom
            WHERE
                garcom.nome = "Pedro"
        ),
        'domingo'
    ),
    (
        (
            SELECT
                id_restaurante
            FROM
                restaurantes
            WHERE
                restaurantes.nome = "Minerao"
        ),
        (
            SELECT
                id_garcom
            FROM
                garcom
            WHERE
                garcom.nome = "Alexandre"
        ),
        'segunda'
    ),
    (
        (
            SELECT
                id_restaurante
            FROM
                restaurantes
            WHERE
                restaurantes.nome = "Calabouco"
        ),
        (
            SELECT
                id_garcom
            FROM
                garcom
            WHERE
                garcom.nome = "Gerson"
        ),
        'terca'
    );

SELECT
    garcom.nome AS nome_garcom,
    restaurantes.nome AS restaurante,
    garcom_restaurantes.dia_semana AS dia_semana
FROM
    garcom
    INNER JOIN garcom_restaurantes ON garcom.id_garcom = garcom_restaurantes.id_garcom
    INNER JOIN restaurantes ON garcom_restaurantes.id_restaurante = restaurantes.id_restaurante
WHERE
    garcom.nome IN ('Jorge', 'Odair', 'Gerson');

USE sakila;

SELECT
    *
FROM
    customer
WHERE
    customer.email = "DOROTHY.TAYLOR@sakilacustomer.org";

SELECT
    "WHAT ACTORS DOROTHY.TAYLOR@sakilacustomer.org WACTHED!" AS "MESSAGE_LOG";

SELECT
    actor.actor_id,
    CONCAT(actor.first_name, " ", actor.last_name) AS "actors"
FROM
    actor
    INNER JOIN film_actor ON film_actor.actor_id = actor.actor_id
    INNER JOIN film ON film.film_id = film_actor.film_id
    INNER JOIN inventory ON inventory.film_id = film.film_id
    INNER JOIN rental ON rental.inventory_id = inventory.inventory_id
    INNER JOIN customer ON rental.customer_id = customer.customer_id
WHERE
    customer.email = "DOROTHY.TAYLOR@sakilacustomer.org"
GROUP BY
    actors
ORDER BY
    actor.actor_id;

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
    ('Ernani', 'Sobrenome do Ernani', 'XX.XXX.XXX.X'),