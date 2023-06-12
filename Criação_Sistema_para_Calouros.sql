CREATE DATABASE IF NOT EXISTS Sistema_para_Calouros;
USE Sistema_para_Calouros;
CREATE TABLE IF NOT EXISTS Aluno(
fk_campus_ID INTEGER,
FOREIGN KEY (fk_campus_ID) REFERENCES Campus(ID),
nome VARCHAR(50) NOT NULL, CPF VARCHAR(11) UNIQUE NOT NULL,
RA VARCHAR(15) NOT NULL, telefone VARCHAR(20) NOT NULL, email VARCHAR(100),
PRIMARY KEY (RA)
);

CREATE TABLE IF NOT EXISTS Professor(
fk_campus_ID INTEGER,
FOREIGN KEY (fk_campus_ID) REFERENCES Campus (ID),
nome VARCHAR(50) NOT NULL, CPF VARCHAR(11) NOT NULL,
telefone VARCHAR(20) NOT NULL, email VARCHAR(50),
PRIMARY KEY (CPF)
);

CREATE TABLE IF NOT EXISTS IES(
ID INTEGER NOT NULL AUTO_INCREMENT,
nome VARCHAR(30) NOT NULL,
PRIMARY KEY(ID)
);

CREATE TABLE IF NOT EXISTS Campus(
ID INTEGER NOT NULL AUTO_INCREMENT,
nome VARCHAR(30),
PRIMARY KEY(ID),
fk_IES_Id INTEGER,
FOREIGN KEY	 (fk_IES_Id) REFERENCES IES(ID)
);


CREATE TABLE IF NOT EXISTS Curso(
ID INTEGER NOT NULL AUTO_INCREMENT, 
nome VARCHAR(30),
materia VARCHAR(30),
cargaH INTEGER,
PRIMARY KEY(ID),
fk_eventos_atividades INTEGER,
fk_treinamento_workshops INTEGER,
FOREIGN KEY (fk_eventos_atividades) REFERENCES Eventos_atividades(idevento),
FOREIGN KEY (fk_treinamento_workshops) REFERENCES Treinamento_workshops(idnumero)
);

CREATE TABLE IF NOT EXISTS Sala_de_aula(
IDnumero INT NOT NULL,
predio INT NOT NULL,
PRIMARY KEY(IDnumero),
fk_cpf_professor VARCHAR(11),
FOREIGN KEY(fk_cpf_professor) REFERENCES Professor(CPF)
);

CREATE TABLE IF NOT EXISTS Treinamento_workshops(
idnumero INT NOT NULL Auto_increment , nome VARCHAR(50) NOT NULL, dia DATE, 
data DATE,
PRIMARY KEY(idnumero)
);

CREATE TABLE IF NOT EXISTS Eventos_atividades(
idevento INT NOT NULL,nome VARCHAR(50), dia DATE NOT NULL, 
data DATE,
PRIMARY KEY(idevento)
);

INSERT INTO Aluno (fk_campus_ID, nome, CPF, RA, telefone, email)
VALUES
    (1,'Matheus Henrique', '12345678901', 'RA001', '1234567890', 'matheushenrique@exemplo.com'),
    (3,'Keyla Andrade', '23456789012', 'RA002', '2345678901', 'keylaandrade@exemplo.com'),
    (4,'Gabrielly Moreira', '34567890123', 'RA003', '3456789012', 'gabriellymoreira@exemplo.com'),
    (2,'Cauã Veloso','45678901235','RA004', '4567890123', 'cauaveloso@exemplo.com'),
    (5,'Arthur Favato', '56789012345', 'RA005', '5678901234', 'arthurfavato@exemplo.com');
INSERT INTO Campus (ID, nome, fk_IES_Id)
VALUES
    (1, 'Linha Verde', 1),
    (2, 'Cristiano Machado', 1),
    (3, 'Buritis', 2),
    (4, 'Vespasiano', 3),
    (5, 'Nova Lima', 4);

INSERT INTO IES(ID, nome)
VALUES
(1, 'UNA'),
(2, 'UNIBH'),
(3, 'FASEH'),
(4, 'MILTON CAMPOS');

INSERT INTO Professor(fk_campus_ID, nome, CPF, telefone, email)
VALUES
(1, 'Rafaela Guimarães rosa', 19566293511, 31988230383, 'rafaela.guimaraes@gmail.com'),
(2, 'Leonardo Silveira', 26245598314, 31986629855, 'leonardo.silveira@gmail.com' ),
(5, 'Robson Rodrigues Silva', 18962185886, 31996524826, 'robson.rodrigues@gmail.com'),
(4, 'Domingos Salvadore', 14226218177, 31992000081, 'domingos.salvadore@gmail.com'),
(3, 'Larissa Rodrigues Silveira', 16298524214, 31986164265, 'larissa.rodrigues@gmail.com');

INSERT INTO Curso(ID, nome, materia, cargaH,fk_eventos_atividades, fk_treinamento_workshops)
VALUES
(1, 'Engenharia Eletromecânica', 'Cálculo III', 200, 1526, 1425 ),
(2, 'Psicologia', 'Filosofia', 100 , 1365, 1445 ),
(3, 'Sistemas de Informação', 'Modelagem de Software', 340, 2544, 1633),
(4, 'Direito', 'Sociologia', 100, 3252, 1255),
(5, 'Arqueologia', 'História', 200, 1423, 2541 );

INSERT INTO Sala_de_aula(IDnumero, predio, fk_cpf_professor)
VALUES
(36, 2, 19566293511),
(22, 1, 26245598314),
(55, 3, 18962185886),
(77, 4, 14226218177),
(68, 4, 16298524214);

INSERT INTO Treinamento_workshops(idnumero, nome, dia)
VALUES
(1425, 'Segurança do Trabalho', '2023-07-30'),
(1445, 'Inteligência Emocional', '2023-05-17'),
(1633, 'Liderança e Gestão de Equipes', '2023-10-22'),
(1255, 'Desenvolvimento de Habilidades de Comunicação', '2023-08-14'),
(2541, 'Inovação Secular da História', '2023-11-15');

INSERT INTO Eventos_atividades(idevento, nome, dia)
VALUES
(1526, 'Curso NR35 Trabalho em Altura', '2023-12-02'),
(1365, 'Treinamento do Comportamento Infantil', '2023-04-12'),
(2544, 'Curso treinamento Programação', '2023-07-07'),
(3252, 'Aula de Arqueologia', '2023-05-16'),
(1423, 'Semana Cultural de raças', '2023-09-19');
