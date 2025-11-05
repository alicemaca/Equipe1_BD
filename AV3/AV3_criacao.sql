CREATE TABLE Funcionário (
    cpf VARCHAR2 (11),
    Nome VARCHAR2 (45),
    Idade INTEGER,
    CONSTRAINT Funcionário_pkey PRIMARY KEY (cpf)
);

CREATE TABLE Piloto ( 
    cpf_piloto VARCHAR2 (11), 
    cadastro_aviação NUMBER (6, 0), 
    licença_piloto_linha_aérea INTEGER, 
    CONSTRAINT Piloto_pkey  PRIMARY KEY (cpf_piloto),
    CONSTRAINT Piloto_fkey FOREIGN KEY (cpf_piloto) REFERENCES FUNCIONÁRIO(cpf) 
);

CREATE TABLE Copiloto (
    cpf_copiloto VARCHAR2 (11),
    cadastro_aviação NUMBER (6, 0),
    CONSTRAINT Copiloto_pkey PRIMARY KEY (cpf_copiloto),
    CONSTRAINT Copiloto_fkey FOREIGN KEY (cpf_copiloto) REFERENCES FUNCIONÁRIO(cpf) 
);

CREATE TABLE Comissário (
    cpf_comissario VARCHAR2 (11),
    cpf_supervisor VARCHAR2 (11),
    cht INTEGER,
    CONSTRAINT Comissário_pkey PRIMARY KEY (cpf_comissario),
    CONSTRAINT Comissário_fkey1 FOREIGN KEY (cpf_comissario) REFERENCES FUNCIONÁRIO(cpf),
	CONSTRAINT Comissário_fkey2 FOREIGN KEY (cpf_supervisor) REFERENCES COMISSÁRIO(cpf_comissario)
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
    numero_de_voo VARCHAR2 (4),
    id_aeronave INTEGER,
    cod_iata_ida VARCHAR2 (3) NOT NULL,
    cod_iata_volta VARCHAR2 (3) NOT NULL,
    cpf_piloto VARCHAR2 (11),
    cpf_copiloto VARCHAR2 (11),
    numero_de_passageiros_a_bordo INTEGER,
    status VARCHAR2 (20),
    previsao_de_ida TIMESTAMP,
    previsao_de_chegada TIMESTAMP,
    hora_de_ida TIMESTAMP,
    hora_de_chegada TIMESTAMP,
    CONSTRAINT Voo_pkey PRIMARY KEY (numero_de_voo),
    CONSTRAINT Voo_fkey FOREIGN KEY (id_aeronave) REFERENCES AERONAVE(id_aeronave),
    CONSTRAINT Voo_fkey1 FOREIGN KEY (cod_iata_ida) REFERENCES Aeroporto(iata),
    CONSTRAINT Voo_fkey2 FOREIGN KEY (cod_iata_volta) REFERENCES Aeroporto(iata),
    CONSTRAINT Voo_fkey3 FOREIGN KEY (cpf_piloto) REFERENCES Piloto(cpf_piloto),
    CONSTRAINT Voo_fkey4 FOREIGN KEY (cpf_copiloto) REFERENCES Copiloto(cpf_copiloto)
);

CREATE TABLE Gerencia (
    numero_de_voo VARCHAR2 (4),
    cpf_comissario VARCHAR2 (11),
    CONSTRAINT Gerencia_pkey PRIMARY KEY (numero_de_voo, cpf_comissario),
    CONSTRAINT Gerencia_fkey1 FOREIGN KEY (numero_de_voo) REFERENCES Voo(numero_de_voo),
    CONSTRAINT Gerencia_fkey2 FOREIGN KEY (cpf_comissario) REFERENCES Comissário(cpf_comissario)
);

CREATE TABLE Endereço(
    cep_passageiro VARCHAR2 (8),
    estado VARCHAR2 (30),
    cidade VARCHAR2 (30),
    bairro VARCHAR2 (30),
    rua VARCHAR2 (30),
    CONSTRAINT Endereço_pkey PRIMARY KEY (cep_passageiro)
);

CREATE TABLE Passageiro(
    cpf VARCHAR2 (11),
    cep VARCHAR2 (8),
    Nome VARCHAR2 (30),
    idade INTEGER,
    número INTEGER,
    CONSTRAINT Passageiro_pkey PRIMARY KEY (cpf),
    CONSTRAINT Passageiro_fkey FOREIGN KEY (cep) REFERENCES Endereço(cep_passageiro)
);

CREATE TABLE Telefone_passageiro(
	 cpf_passageiro VARCHAR2 (11),
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
    forma_de_pagamento VARCHAR2 (20), 
    embarcou NUMBER (1,0), 
    classe VARCHAR2 (15), 
    CONSTRAINT Informações_reserva_pkey PRIMARY KEY (numero_da_reserva),
    CONSTRAINT Informações_reserva_check_bool CHECK (embarcou = 0 OR embarcou = 1)
);

CREATE TABLE Reserva (
    numero_da_reserva INTEGER,
    num_voo VARCHAR2 (4),
    cpf_passageiro VARCHAR2 (11),
    CONSTRAINT Reserva_pkey PRIMARY KEY (numero_da_reserva),
    CONSTRAINT Reserva_fkey1 FOREIGN KEY(numero_da_reserva) REFERENCES Informações_reserva(numero_da_reserva),
	CONSTRAINT Reserva_fkey2 FOREIGN KEY(num_voo) REFERENCES Voo(numero_de_voo),
	CONSTRAINT Reserva_fkey3 FOREIGN KEY(cpf_passageiro) REFERENCES Passageiro(cpf)
);

CREATE TABLE Bagagem (
    numero_da_reserva INTEGER,
    id_da_bagagem INTEGER,
    status VARCHAR2 (15),
    hora_despacho TIMESTAMP,
    CONSTRAINT Bagagem_pkey PRIMARY KEY (numero_da_reserva, id_da_bagagem),
	CONSTRAINT Bagagem_fkey FOREIGN KEY(numero_da_reserva) REFERENCES Reserva(numero_da_reserva)
);
