/*IS NOT NULL, IN*/
SELECT
	numero_de_voo,
	cod_iata_ida,
	cod_iata_volta,
	id_aeronave,
	hora_de_ida
FROM
	Voo
WHERE cod_iata_ida IN ('GRU', 'CGH', 'GIG')
AND hora_de_ida IS NOT NULL;

/*BETWEEN*/
SELECT
numero_de_voo,
cod_iata_ida,
cod_iata_volta,
previsao_de_ida,
hora_de_ida
FROM
Voo
WHERE
(hora_de_ida - previsao_de_ida) BETWEEN INTERVAL '5' MINUTE AND INTERVAL '15' MINUTE;

/*SELECT FROM WHERE, Subconsulta com IN*/
SELECT cpf, Nome, número 
FROM Passageiro 
WHERE cpf IN (SELECT cpf_passageiro FROM Reserva WHERE num_voo = '1203');

/*AVG, SELECT FROM WHERE, Subconsulta com operador relacional*/
SELECT *
FROM Voo
WHERE numero_de_passageiros_a_bordo > (SELECT AVG(numero_de_passageiros_a_bordo) FROM Voo);

/*Subconsulta com IN, SELECT FROM WHERE*/
SELECT nome, cpf
FROM Passageiro
WHERE cpf IN (
    SELECT cpf
    FROM Reserva
);

/*INSERT INTO*/ 
INSERT INTO Funcionário
VALUES ('12045847801', 'Flora Silva Matos', 28);
INSERT INTO Piloto
VALUES ('12045847801', 456875, 875941);

/*INTERSECT*/
SELECT cpf FROM Funcionário
INTERSECT
SELECT cpf FROM Passageiro;

/*MINUS*/
SELECT nome,cpf
FROM Funcionário
WHERE cpf IN (
    SELECT cpf FROM Funcionário
	MINUS
	SELECT cpf_piloto FROM Piloto
);

/*ALTER TABLE*/
ALTER TABLE MODELO_AERONAVE
ADD (icao VARCHAR2(4));

/*GRANT*/
GRANT INSERT ON Voo TO maca;

/*CREATE INDEX*/
CREATE INDEX idx_funcionario
ON Funcionário(nome);

/*INNER JOIN*/
SELECT
    v.numero_de_voo,
    f.Nome AS nome_piloto
FROM Voo v
INNER JOIN Piloto p
    ON v.cpf_piloto = p.cpf_piloto
INNER JOIN Funcionário f
    ON p.cpf_piloto = f.cpf;

/*RIGHT JOIN*/
SELECT v.numero_de_voo, p.cpf_piloto
FROM Voo v
RIGHT JOIN Piloto p
ON v.cpf_piloto = p.cpf_piloto;

/*UPDATE*/
UPDATE Voo
SET previsao_de_ida = previsao_de_ida + INTERVAL '15' MINUTE,
    previsao_de_chegada = previsao_de_chegada + INTERVAL '15' MINUTE
WHERE numero_de_voo = '0451';

/*MIN*/
SELECT modelo_avião 
FROM MODELO_AERONAVE 
WHERE capacidade_de_pessoas_a_bordo IN (SELECT MIN(Capacidade_de_pessoas_a_bordo) 
                                        FROM MODELO_AERONAVE);

/*MAX*/
SELECT *
FROM Voo
WHERE (hora_de_ida - previsao_de_ida) = 
(SELECT MAX(hora_de_ida - previsao_de_ida) FROM Voo);

/*GROUP BY, HAVING, ORDER BY, COUNT*/
SELECT COD_IATA_IDA, COUNT(*)
FROM VOO 
GROUP BY COD_IATA_IDA
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

/*CREATE VIEW*/
CREATE VIEW BAGAGEM_PASSAGEIROS AS
SELECT P.NOME, P.CPF, R.NUMERO_DA_RESERVA, B.ID_DA_BAGAGEM, B.STATUS
FROM PASSAGEIRO P, BAGAGEM B, RESERVA R
WHERE B.NUMERO_DA_RESERVA = R.NUMERO_DA_RESERVA
AND R.CPF_PASSAGEIRO = P.CPF;

/*Subconsulta com ANY*/
SELECT * 
FROM Passageiro
WHERE idade > ANY (SELECT idade
                   FROM Passageiro
                   WHERE cep IN ('67890123', '56789012'));

/*Subconsulta com ALL*/
SELECT numero_de_voo 
FROM Voo 
WHERE numero_de_passageiros_a_bordo > ALL(SELECT numero_de_passageiros_a_bordo 
                                          FROM Voo 
                                          WHERE cod_iata_ida = 'REC');

/*DELETE, SELECT FROM WHERE, LIKE, COUNT, INTERSECT, NOT IN*/
DELETE FROM Modelo_Aeronave
WHERE modelo_avião IN (
    SELECT modelo_avião FROM Modelo_Aeronave
    WHERE modelo_avião LIKE 'Boeing%'
    AND modelo_avião NOT LIKE 'Boeing 737'
    AND (
        SELECT COUNT(*)
        FROM Modelo_Aeronave
        WHERE modelo_avião LIKE 'Boeing%'
    ) > 1
    
    INTERSECT
    
    SELECT modelo_avião FROM Modelo_Aeronave
    WHERE capacidade_de_voo > 3000 

    AND modelo_avião NOT IN (SELECT A.modelo FROM AERONAVE A)
);
