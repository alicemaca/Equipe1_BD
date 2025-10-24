CREATE TABLE Funcionário (
    cpf NUMBER (11, 0),
    Nome VARCHAR2 (45),
    Idade INTEGER,
    CONSTRAINT Funcionário_pkey PRIMARY KEY (cpf)
);

CREATE TABLE Piloto ( 
    cpf_piloto NUMBER (11, 0), 
    cadastro_aviação NUMBER (6, 0), 
    licença_piloto_linha_aérea INTEGER, 
    CONSTRAINT Piloto_pkey  PRIMARY KEY (cpf_piloto),
    CONSTRAINT Piloto_fkey FOREIGN KEY (cpf_piloto) REFERENCES FUNCIONÁRIO(cpf) 
);

CREATE TABLE Copiloto (
    cpf_copiloto NUMBER (11, 0),
    cadastro_aviação NUMBER (6, 0),
    CONSTRAINT Copiloto_pkey PRIMARY KEY (cpf_copiloto),
    CONSTRAINT Copiloto_fkey FOREIGN KEY (cpf_copiloto) REFERENCES FUNCIONÁRIO(cpf) 
);

CREATE TABLE Comissário (
    cpf_comissario NUMBER (11, 0),
    cpf_supervisor NUMBER (11, 0),
    cht INTEGER,
    CONSTRAINT Comissário_pkey PRIMARY KEY (cpf_comissario),
    CONSTRAINT Comissário_fkey FOREIGN KEY (cpf_comissario) REFERENCES FUNCIONÁRIO(cpf)
);

CREATE TABLE Aeroporto (
    iata VARCHAR2 (3),
    cnpj VARCHAR2 (14),
    nome VARCHAR2 (40),
    CONSTRAINT Aeroporto_pkey PRIMARY KEY (iata)
);

CREATE TABLE Modelo_Aeronave (
    modelo_avião VARCHAR2 (40),
    capacidade_de_pessoas_a_bordo INTEGER,
    capacidade_de_combustível INTEGER,
    capacidade_de_voo INTEGER,
    CONSTRAINT Modelo_Aeronave_pkey PRIMARY KEY (modelo_avião)
);

CREATE SEQUENCE seq_id_aeronave
INCREMENT BY 1
START WITH 1;

CREATE TABLE Aeronave(
    id_aeronave INTEGER DEFAULT seq_id_aeronave.NEXTVAL,
    estado VARCHAR2 (20),
    modelo VARCHAR2 (40),
    CONSTRAINT Aeronave_pkey PRIMARY KEY (id_aeronave),
    CONSTRAINT Aeronave_fkey FOREIGN KEY (modelo) REFERENCES Modelo_Aeronave(modelo_avião)
);

CREATE TABLE Voo (
    numero_de_voo NUMBER (4, 0),
    id_aeronave INTEGER,
    numero_de_passageiros_a_bordo INTEGER,
    status VARCHAR2 (20),
    previsao_de_ida TIMESTAMP,
    previsao_de_chegada TIMESTAMP,
    hora_de_ida TIMESTAMP,
    hora_de_chegada TIMESTAMP,
    CONSTRAINT Voo_pkey PRIMARY KEY (numero_de_voo),
    CONSTRAINT Voo_fkey FOREIGN KEY (id_aeronave) REFERENCES AERONAVE(id_aeronave)
);

CREATE TABLE Gerencia (
    numero_de_voo INTEGER,
    cpf_comissario INTEGER,
    CONSTRAINT Gerencia_pkey PRIMARY KEY (numero_de_voo, cpf_comissario),
    CONSTRAINT Gerencia_fkey1 FOREIGN KEY (numero_de_voo) REFERENCES Voo(numero_de_voo),
    CONSTRAINT Gerencia_fkey2 FOREIGN KEY (cpf_comissario) REFERENCES Voo(numero_de_voo)
);

CREATE TABLE Endereço(
    cep_passageiro NUMBER (8, 0),
    estado VARCHAR2 (30),
    cidade VARCHAR2 (30),
    bairro VARCHAR2 (30),
    rua VARCHAR2 (30),
    CONSTRAINT Endereço_pkey PRIMARY KEY (cep_passageiro)
);

CREATE TABLE Passageiro(
    cpf NUMBER (11, 0),
    cep NUMBER (8, 0),
    Nome VARCHAR2 (30),
    idade INTEGER,
    número INTEGER,
    CONSTRAINT Passageiro_pkey PRIMARY KEY (cpf),
    CONSTRAINT Passageiro_fkey FOREIGN KEY (cep) REFERENCES Endereço(cep_passageiro)
);

CREATE TABLE Telefone_passageiro(
	 cpf_passageiro NUMBER (11,0),
	 telefone_passageiro NUMBER (11,0),
	 CONSTRAINT Telefone_passageiro_pkey PRIMARY KEY (cpf_passageiro, telefone_passageiro),
	 CONSTRAINT Telefone_passageiro_fkey FOREIGN KEY (cpf_passageiro) REFERENCES Passageiro(cpf)
);

CREATE SEQUENCE seq_reserva 
INCREMENT BY 1 
START WITH 1;

CREATE TABLE Informações_reserva ( 
    numero_da_reserva INTEGER DEFAULT seq_reserva.NEXTVAL, 
    n_da_poltrona INTEGER, 
    forma_de_pagamento INTEGER, 
    embarcou NUMBER (1,0), 
    classe VARCHAR2 (15), 
    CONSTRAINT Informações_reserva_pkey PRIMARY KEY (numero_da_reserva),
    CONSTRAINT Informações_reserva_check_bool CHECK (embarcou = 0 OR embarcou = 1)
);

CREATE TABLE Reserva (
    numero_da_reserva INTEGER,
    num_voo INTEGER,
    cpf_passageiro NUMBER(11,0),
    CONSTRAINT Reserva_pkey PRIMARY KEY (numero_da_reserva),
    CONSTRAINT Reserva_fkey FOREIGN KEY(numero_da_reserva) REFERENCES Informações_reserva(numero_da_reserva)
);

CREATE TABLE Bagagem (
    numero_da_reserva INTEGER,
    id_da_bagagem INTEGER,
    status VARCHAR2 (15),
    hora_despacho TIMESTAMP,
    CONSTRAINT Bagagem_pkey PRIMARY KEY (numero_da_reserva, id_da_bagagem)
);

INSERT INTO Funcionário
VALUES (12345678901, 'Ana Silva Pereira', 25);
INSERT INTO Piloto
VALUES (12345678901, 123456, 987654);
INSERT INTO Funcionário
VALUES (23456789012, 'José Carvalho de Barros', 47);
INSERT INTO Piloto
VALUES (23456789012, 234567, 876543);
INSERT INTO Funcionário
VALUES (34567890123, 'André De Moura Souza', 36);
INSERT INTO Piloto
VALUES (34567890123, 345678, 765432);
INSERT INTO Funcionário
VALUES (45678901234, 'Maurício de Lima Rocha', 51);
INSERT INTO Piloto
VALUES (45678901234, 456789, 654321);
INSERT INTO Funcionário
VALUES (56789012345, 'Clara Queiroz Vieira', 29);
INSERT INTO Piloto
VALUES (56789012345, 567890, 543210);
INSERT INTO Funcionário
VALUES (67890123456, 'Pedro Barros Oliveira', 31);
INSERT INTO Piloto
VALUES (67890123456, 678901, 432109);
INSERT INTO Funcionário
VALUES (78901234567, 'Simone Andrade Freire', 45);
INSERT INTO Piloto
VALUES (78901234567, 789012, 321098);
INSERT INTO Funcionário
VALUES (89012345678, 'Caique Santos de Moura', 33);
INSERT INTO Piloto
VALUES (89012345678, 890123, 210987);
INSERT INTO Funcionário
VALUES (90123456789, 'Lucas Leal Andrade', 38);
INSERT INTO Piloto
VALUES (90123456789, 901234, 109876);
INSERT INTO Funcionário
VALUES (01234567890, 'Vinicíus Torres Chaves', 24);
INSERT INTO Piloto
VALUES (01234567890, 012345, 098765);
INSERT INTO Funcionário
VALUES (24612345678, 'Eduardo Caetano Falcão', 28);
INSERT INTO Copiloto
VALUES (24612345678, 246123);
INSERT INTO Funcionário
VALUES (24623456789, 'Vitor Machado Ferreira', 32);
INSERT INTO Copiloto
VALUES (24623456789, 246234);
INSERT INTO Funcionário
VALUES (24634567890, 'Lucas Ferreira Souza', 41);
INSERT INTO Copiloto
VALUES (24634567890, 246345);
INSERT INTO Funcionário
VALUES (24645678901, 'Aline Freitas Durães', 30);
INSERT INTO Copiloto
VALUES (24645678901, 246567);
INSERT INTO Funcionário
VALUES (24667890123, 'Gabriel José Marques Vieira', 39);
INSERT INTO Copiloto
VALUES (24667890123, 246678);
INSERT INTO Funcionário
VALUES (24678901234, 'Heitor da Cunha Lopes', 40);
INSERT INTO Copiloto
VALUES (24678901234, 246789);
INSERT INTO Funcionário
VALUES (24689012345, 'Renato Ribeiro de Jesus', 49);
INSERT INTO Copiloto
VALUES (24689012345, 247890);
INSERT INTO Funcionário
VALUES (46901234567, 'Silvano Sales Pessoa', 42);
INSERT INTO Copiloto
VALUES (46901234567, 247890);
INSERT INTO Funcionário
VALUES (46912345673, 'Leonardo Santana', 29);
INSERT INTO Copiloto
VALUES (46912345673, 247899);
INSERT INTO Funcionário
VALUES (46912345674, 'Pietro Martins', 29);
INSERT INTO Copiloto
VALUES (46912345674, 247899);


INSERT INTO Funcionário
VALUES (42819365007, 'Lucas Pereira da Silva', 45);
INSERT INTO Comissário
VALUES(42819365007, 12345678900, 48219);
INSERT INTO Funcionário
VALUES (51284097003,'Maria Eduarda Santos Oliveira', 21);
INSERT INTO Comissário
VALUES(51284097003, 12345678900, 19374);
INSERT INTO Funcionário
VALUES (61920783055,'Gabriel Ferreira de Souza', 26);
INSERT INTO Comissário
VALUES(61920783055, 23456789011, 57231);
INSERT INTO Funcionário
VALUES (74065129082, 'Ana Carolina Rodrigues Costa', 27);
INSERT INTO Comissário
VALUES(74065129082, 34567890122, 64915);
INSERT INTO Funcionário
VALUES (82341057026, 'Pedro Henrique Almeida Rocha', 30);
INSERT INTO Comissário
VALUES(82341057026, 23456789011, 78103);
INSERT INTO Funcionário
VALUES (93421864040, 'Juliana Gomes Martins', 30);
INSERT INTO Comissário
VALUES(93421864040, 45678901233, 86129);


INSERT INTO Aeroporto
Values('GRU',12345678000190 , 'Guarulhos');
INSERT INTO Aeroporto
Values('GIG', 98765432000121 , 'Galeão');
INSERT INTO Aeroporto
Values('BSB', 45112998000137, 'Aeroporto Internacional de Brasília');
INSERT INTO Aeroporto
Values('CNF',67908123000155, 'Confins');
INSERT INTO Aeroporto
Values('SSA',23456789000102 , 'Aeroporto Internacional de Salvador');
INSERT INTO Aeroporto
Values('POA',81990321000166 , 'Aeroporto Internacional Salgado Filho');
INSERT INTO Aeroporto
Values('REC',54778900000114 , 'Guararapes');


INSERT INTO Modelo_Aeronave VALUES ('Airbus A320-200', 150, 23858, 6150);
INSERT INTO Modelo_Aeronave VALUES ('Boeing 737-800', 162, 26020, 5436);
INSERT INTO Modelo_Aeronave VALUES ('Embraer E195-E2', 120, 13200, 4815);
INSERT INTO Modelo_Aeronave VALUES ('ATR 72-600', 70, 5000, 1528);
INSERT INTO Modelo_Aeronave VALUES ('Cessna 172 Skyhawk', 4, 212, 100);

INSERT INTO Endereço
VALUES (12345678, 'São Paulo', 'São Paulo', 'Vila Mariana', 'Rua das Flores');
INSERT INTO Endereço
VALUES (23456789, 'Rio de Janeiro', 'Rio de Janeiro', 'Copacabana', 'Avenida Atlântica');
INSERT INTO Endereço
VALUES (34567890, 'Minas Gerais', 'Belo Horizonte', 'Savassi', 'Rua da Bahia');
INSERT INTO Endereço
VALUES (45678901, 'Bahia', 'Salvador', 'Pituba', 'Rua Padre Anchieta');
INSERT INTO Endereço
VALUES (56789012, 'Rio Grande do Sul', 'Porto Alegre', 'Moinhos de Vento', 'Rua Padre Chagas');
INSERT INTO Endereço
VALUES (67890123, 'Pernambuco', 'Recife', 'Boa Viagem', 'Avenida Boa Viagem');
INSERT INTO Endereço
VALUES (78901234, 'Paraná', 'Curitiba', 'Batel', 'Rua 24 de Maio');
INSERT INTO Endereço
VALUES (89012345, 'Santa Catarina', 'Florianópolis', 'Centro', 'Rua Felipe Schmidt');
INSERT INTO Endereço
VALUES (90123456, 'Ceará', 'Fortaleza', 'Meireles', 'Avenida Beira Mar');
INSERT INTO Endereço
VALUES (11223344, 'Amazonas', 'Manaus', 'Adrianópolis', 'Rua Belo Horizonte');

INSERT INTO Passageiro
VALUES (42819365017, 12345678, 'Maria Silva', 34, 245);
INSERT INTO Passageiro
VALUES (51284097003, 23456789, 'João Santos', 28, 112);
INSERT INTO Passageiro
VALUES (61920783055, 34567890, 'Ana Pereira', 42, 78);
INSERT INTO Passageiro
VALUES (74065129082, 45678901, 'Carlos Souza', 37, 310);
INSERT INTO Passageiro
VALUES (82341057026, 56789012, 'Beatriz Lima', 25, 56);
INSERT INTO Passageiro
VALUES (93421864040, 67890123, 'Ricardo Alves', 50, 102);
INSERT INTO Passageiro
VALUES (10439285099, 45678901, 'Fernanda Rocha', 31, 420);
INSERT INTO Passageiro
VALUES (21547396071, 56789012, 'Paulo Oliveira', 45, 211);
INSERT INTO Passageiro
VALUES (32658417058, 67890123, 'Juliana Castro', 29, 87);
INSERT INTO Passageiro
VALUES (43769528043, 78901234, 'Rafael Martins', 36, 190);
INSERT INTO Passageiro
VALUES (54870639022, 89012345, 'Camila Fernandes', 27, 305);


INSERT INTO Telefone_passageiro
VALUES (42819365017, 11987654321);
INSERT INTO Telefone_passageiro
VALUES (51284097003, 21991234567);
INSERT INTO Telefone_passageiro
VALUES (61920783055, 31999887766);
INSERT INTO Telefone_passageiro
VALUES (74065129082, 41988776655);
INSERT INTO Telefone_passageiro
VALUES (82341057026, 51999887744);
INSERT INTO Telefone_passageiro
VALUES (93421864040, 61988776633);
INSERT INTO Telefone_passageiro
VALUES (10439285099, 71999887722);
INSERT INTO Telefone_passageiro
VALUES (21547396071, 81988776611);
INSERT INTO Telefone_passageiro
VALUES (32658417058, 91999887700);
INSERT INTO Telefone_passageiro
VALUES (43769528043, 11988776699);
INSERT INTO Telefone_passageiro
VALUES (54870639022, 21999887788);
