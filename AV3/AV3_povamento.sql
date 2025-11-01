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
INSERT INTO Modelo_Aeronave VALUES ('Bombardier Q400', 70, 5700, 2500);
INSERT INTO Modelo_Aeronave VALUES ('Boeing 787-9 Dreamliner',290, 57220, 14140);

INSERT INTO Aeronave (estado, modelo)
VALUES ('manutenção','Airbus A320-200');
INSERT INTO Aeronave (estado, modelo)
VALUES ('funcionamento', 'Boeing 737-800');
INSERT INTO Aeronave (estado, modelo)
VALUES ('funcionamento','Embraer E195-E2');
INSERT INTO Aeronave (estado, modelo)
VALUES ('funcionamento','ATR 72-600');
INSERT INTO Aeronave (estado, modelo)
VALUES ('manutenção','Cessna 172 Skyhawk');
INSERT INTO Aeronave (estado, modelo)
VALUES ('manutenção','Bombardier Q400');
INSERT INTO Aeronave (estado, modelo)
VALUES ('funcionamento', 'Boeing 787-9 Dreamliner');
INSERT INTO Aeronave (estado, modelo)
VALUES ('funcionamento', 'Boeing 737-800');

INSERT INTO Voo 
VALUES (
    1724, 1, 'BSB', 'REC', 78901234567, 24645678901, 148, 'aterrissou',
    TO_TIMESTAMP('2025-10-02 20:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-02 23:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-02 20:10:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-02 23:10:00', 'YYYY-MM-DD HH24:MI:SS')
);


INSERT INTO Voo 
VALUES (
    1725, 2, 'GIG', 'BSB', 01234567890, 24634567890, 160, 'em voo',
    TO_TIMESTAMP('2025-10-23 20:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-23 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-23 20:10:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-23 22:23:00', 'YYYY-MM-DD HH24:MI:SS')
);


INSERT INTO Voo 
VALUES (
    3620, 3, 'SSA', 'POA', 23456789012, 24612345678, 117, 'em voo',
    TO_TIMESTAMP('2025-10-23 20:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-23 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-23 20:10:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-23 22:23:00', 'YYYY-MM-DD HH24:MI:SS')
);


INSERT INTO Voo 
VALUES (
    0451, 4, 'CNF', 'GRU', 45678901234, 46901234567, 68, 'em voo',
    TO_TIMESTAMP('2025-10-20 20:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-20 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-20 20:10:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-20 22:23:00', 'YYYY-MM-DD HH24:MI:SS')
);


INSERT INTO Voo 
VALUES (
    2237, 5, 'REC', 'CNF', 56789012345, 46912345673, 4, 'atrasado',
    TO_TIMESTAMP('2025-10-23 20:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-23 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-23 20:10:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-23 22:23:00', 'YYYY-MM-DD HH24:MI:SS')
);


INSERT INTO Voo 
VALUES (
    9810, 6, 'POA', 'GRU', 12345678901, 24667890123, 75, 'em voo',
    TO_TIMESTAMP('2025-10-23 20:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-23 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-23 20:10:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-23 22:23:00', 'YYYY-MM-DD HH24:MI:SS')
);


INSERT INTO Voo 
VALUES (
    2871, 7, 'BSB', 'CNF', 34567890123, 24612345678, 294, 'em voo',
    TO_TIMESTAMP('2025-10-23 20:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-23 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-23 20:10:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-23 22:23:00', 'YYYY-MM-DD HH24:MI:SS')
);


INSERT INTO Voo 
VALUES (
    3310, 8, 'GIG', 'GRU', 01234567890, 24612345678, 323, 'aterrissou',
    TO_TIMESTAMP('2025-10-26 20:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-26 22:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-26 20:10:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2025-10-26 22:23:00', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO Gerencia
VALUES (1724, 42819365007);
INSERT INTO Gerencia
VALUES (1725, 51284097003);
INSERT INTO Gerencia
VALUES (3620, 61920783055);
INSERT INTO Gerencia
VALUES (2237, 74065129082);
INSERT INTO Gerencia
VALUES (9810, 82341057026);
INSERT INTO Gerencia
VALUES (2871, 93421864040);
INSERT INTO Gerencia
VALUES (0451, 93421864040);
INSERT INTO Gerencia
VALUES (3310, 74065129082);

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

INSERT INTO Informações_Reserva (n_da_poltrona, forma_de_pagamento, embarcou, classe)
VALUES (8, 'crédito', 1, 'prioridade');
INSERT INTO Informações_Reserva (n_da_poltrona, forma_de_pagamento, embarcou, classe)
VALUES (70, 'débito', 0, 'econômica');
INSERT INTO Informações_Reserva (n_da_poltrona, forma_de_pagamento, embarcou, classe)
VALUES (20, 'dinheiro', 1, 'econômica');
INSERT INTO Informações_Reserva (n_da_poltrona, forma_de_pagamento, embarcou, classe)
VALUES (79, 'dinheiro', 1, 'prioridade');
INSERT INTO Informações_Reserva (n_da_poltrona, forma_de_pagamento, embarcou, classe)
VALUES (24, 'débito', 0, 'econômica');
INSERT INTO Informações_Reserva (n_da_poltrona, forma_de_pagamento, embarcou, classe)
VALUES (1, 'crédito', 1, 'prioridade');
INSERT INTO Informações_Reserva (n_da_poltrona, forma_de_pagamento, embarcou, classe)
VALUES (69, 'débito', 0, 'econômica');
INSERT INTO Informações_Reserva (n_da_poltrona, forma_de_pagamento, embarcou, classe)
VALUES (4, 'crédito',0, 'prioridade');
INSERT INTO Informações_Reserva (n_da_poltrona, forma_de_pagamento, embarcou, classe)
VALUES (10, 'crédito',1, 'prioridade');
INSERT INTO Informações_Reserva (n_da_poltrona, forma_de_pagamento, embarcou, classe)
VALUES (2, 'crédito',1, 'prioridade');

INSERT INTO Reserva
VALUES (1, 6567,42819365017);
INSERT INTO Reserva
VALUES (2, 5431,51284097003);
INSERT INTO Reserva
VALUES (3, 4539,61920783055);
INSERT INTO Reserva
VALUES (4, 4729, 74065129082);
INSERT INTO Reserva
VALUES (5, 7850,82341057026);
INSERT INTO Reserva
VALUES (6, 4752, 10439285099);
INSERT INTO Reserva
VALUES (7, 6166, 21547396071);
INSERT INTO Reserva
VALUES (8, 4203, 32658417058);
INSERT INTO Reserva
VALUES (9, 1203, 43769528043);
INSERT INTO Reserva
VALUES (10, 9223, 54870639022);

INSERT INTO Bagagem
VALUES (1, 1, 'Despachada', TO_TIMESTAMP('2025-10-23 08:15:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Bagagem
VALUES (1, 2, 'Despachada', TO_TIMESTAMP('2025-10-23 08:17:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Bagagem
VALUES (2, 1, 'Em trânsito', TO_TIMESTAMP('2025-10-23 06:40:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Bagagem
VALUES (3, 1, 'Entregue', TO_TIMESTAMP('2025-10-22 12:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Bagagem
VALUES (3, 2, 'Entregue', TO_TIMESTAMP('2025-10-22 12:32:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Bagagem
VALUES (4, 1, 'Extraviada', TO_TIMESTAMP('2025-10-23 14:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Bagagem
VALUES (5, 1, 'Despachada', TO_TIMESTAMP('2025-10-23 09:50:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Bagagem
VALUES (6, 1, 'Em trânsito', TO_TIMESTAMP('2025-10-23 07:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Bagagem
VALUES (6, 2, 'Em trânsito', TO_TIMESTAMP('2025-10-23 07:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Bagagem
VALUES (7, 1, 'Entregue', TO_TIMESTAMP('2025-10-25 01:07:00', 'YYYY-MM-DD HH24:MI:SS'));
