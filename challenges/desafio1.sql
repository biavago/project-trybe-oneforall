
DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.planos(
	plano_id INT PRIMARY KEY AUTO_INCREMENT,
	plano_tipo	VARCHAR(25) NOT NULL,
	plano_valor	DECIMAL(3, 2)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (plano_tipo, plano_valor) VALUES
	('gratuito', 0.00),
	('familiar', 7.99),
	('universitário', 6.99),
	('pessoal', 5.99);

CREATE TABLE SpotifyClone.artistas(
    artista_id	INT PRIMARY KEY AUTO_INCREMENT,
    artista	VARCHAR(100) NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.artistas (artista_id, artista) VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

CREATE TABLE SpotifyClone.cancoes(
    cancao_id	INT PRIMARY KEY AUTO_INCREMENT,
    cancoes	VARCHAR(100) NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (artista_id),
    duracao_segundos	INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns (album_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.cancoes (cancao_id, cancoes, artista_id, duracao_segundos, album_id) VALUES
	('BREAK MY SOUL', 1, 279, 1),
	("VIRGO'S GROOVE", 1, 369, 1),
	('ALIEN SUPERSTAR', 1, 116, 1),
	("Don't Stop Me Now", 2, 203, 2),
	('Under Pressure', 2, 152, 3),
	('Como Nossos Pais', 3, 105, 4),
	('O Medo de Amar é o Medo de Ser Livre', 3, 207, 5),
	('Samba em Paris', 4, 267, 6),
	("The Bard's Song", 5, 244, 7),
	( 'Feeling Good', 6, 100, 8);

CREATE TABLE SpotifyClone.albuns(
    album_id	INT PRIMARY KEY AUTO_INCREMENT,
    album	VARCHAR(100),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (artista_id),
    ano_lancamento	YEAR NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.albuns (album_id, album, artista_id, ano_lancamento) VALUES
	('Renaissance', 1, '2022'),
	('Jazz', 2, '1978'),
	('Hot Space', 2, '1982'),
	('Falso Brilhante', 3, '1998'),
	('Vento de Maio', 3, '2001'),
	('QVVJFA?', 4, '2003'),
	('Somewhere Far Beyond', 5, '2007'),
	('I Put A Spell On You', 6, '2012');

CREATE TABLE SpotifyClone.pessoas_usuarias(
    pessoa_usuaria_id	INT PRIMARY KEY AUTO_INCREMENT,
    nome_pessoa_usuaria	VARCHAR(150) NOT NULL,
    idade	INT NOT NULL,
		FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos (plano_id),
    data_assinatura	DATE NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.pessoas_usuarias (pessoa_usuaria_id, nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES
	('Barbara Liskov', 82, 1, '2019-10-20'),
	('Robert Cecil Martin', 58, 1, '2017-01-06'),
	('Ada Lovelace', 37, 2, '2017-12-30'),
	('Martin Fowler', 46, 2, '2017-01-17'),
	('Sandi Metz', 58, 2, '2018-04-29'),
	('Paulo Freire', 19, 3, '2018-02-14'),
	('Bell Hooks', 26, 3, '2018-01-05'),
	('Christopher Alexander', 85, 4, '2019-06-05'),
	('Judith Butler', 45, 4, '2020-05-13'),
	('Jorge Amado', 58, 4, '2017-02-17');

CREATE TABLE SpotifyClone.seguindo(
    seguindo_id	INT PRIMARY KEY AUTO_INCREMENT,
		FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.pessoas_usuarias (pessoa_usuaria_id),
		FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (artista_id),
) engine = InnoDB;

INSERT INTO SpotifyClone.seguindo (seguindo_id, pessoa_usuaria_id, artista_id) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(4, 4),
	(5, 5),
	(5, 6),
	(6, 1),
	(6, 6),
	(7, 6),
	(8, ''),
	(9, 3),
	(10, 2);

CREATE TABLE SpotifyClone.historico(
    historico_id	INT PRIMARY KEY AUTO_INCREMENT,
		FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.pessoas_usuarias (pessoa_usuaria_id),
		FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes (cancao_id),
    data_reproducao	DATETIME NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.historico (historico_id, pessoa_usuaria_id, cancao_id, data_reproducao) VALUES
	(1, 8, "2022-02-28 10:45:55"),
	(1, 2, "2020-05-02 05:30:35"),
	(1, 10, "2020-03-06 11:22:33"),
	(2, 10, "2022-08-05 08:05:17"),
	(2, 7, "2020-01-02 07:40:33"),
	(3, 10, "2020-11-13 16:55:13"),
	(3, 2, "2020-12-05 18:38:30"),
	(4, 8, "2021-08-15 17:10:10"),
	(5, 8, "2022-01-09 01:44:33"),
	(5, 5, "2020-08-06 15:23:43"),
	(6, 7, "2017-01-24 00:31:17"),
	(6, 1, "2017-10-12 12:35:20"),
	(7, 4, "2011-12-15 22:30:49"),
	(8, 4, "2012-03-17 14:56:41"),
	(9, 9, "2022-02-24 21:14:22"),
	(10, 3, "2015-12-13 08:30:22");
