/*RECORD, %ROWTYPE*/
DECLARE 
    TYPE piloto_info IS RECORD (
        cpf VARCHAR2(11),
        nome VARCHAR2(45),
        cadastro NUMBER(6)
    );
    v_piloto_info piloto_info;
    v_funcionario Funcionário%ROWTYPE;
BEGIN
   
    SELECT * INTO v_funcionario
    FROM Funcionário
    WHERE cpf = '12345678901';

    SELECT cpf_piloto, v_funcionario.Nome, cadastro_aviação
    INTO v_piloto_info
    FROM Piloto
    WHERE cpf_piloto = v_funcionario.cpf;
   
    DBMS_OUTPUT.PUT_LINE('CPF: ' || v_piloto_info.cpf);
    DBMS_OUTPUT.PUT_LINE('Nome: ' || v_piloto_info.nome);
    DBMS_OUTPUT.PUT_LINE('Cadastro Aviação: ' || v_piloto_info.cadastro);
END;
/

/*CREATE OR REPLACE FUNCTION, SELECT INTO */
CREATE OR REPLACE FUNCTION get_pilot_name(p_voo_id IN NUMBER)
RETURN VARCHAR2
IS
    v_nome VARCHAR2(100);
BEGIN
    SELECT f.Nome
    INTO v_nome
    FROM Voo v
    JOIN Piloto p ON v.cpf_piloto = p.cpf_piloto
    JOIN Funcionário f ON f.cpf = p.cpf_piloto
    WHERE v.numero_de_voo = p_voo_id;

    RETURN v_nome;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Nenhum piloto encontrado';
END;
/

SELECT get_pilot_name('1724') AS piloto
FROM dual;

/*CASE WHEN*/
SELECT
    cep_passageiro,
    cidade,
    estado,
    bairro,
    rua,
    CASE
        WHEN estado IN ('São Paulo', 'Rio de Janeiro', 'Minas Gerais') THEN 'Sudeste'
        WHEN estado IN ('Rio Grande do Sul', 'Paraná', 'Santa Catarina') THEN 'Sul'
        WHEN estado IN ('Bahia', 'Pernambuco', 'Ceará') THEN 'Nordeste'
        WHEN estado IN ('Amazonas') THEN 'Norte'
        ELSE 'Outra Região/Centro-Oeste'
    END AS Regiao 
FROM
    Endereço;

/*TRIGGER DE LINHA*/
CREATE OR REPLACE TRIGGER trg_idade_minima_passageiro
BEFORE INSERT OR UPDATE OF idade ON Passageiro
FOR EACH ROW
DECLARE
    IDADE_MINIMA CONSTANT INTEGER := 2;
BEGIN
    IF :NEW.idade < IDADE_MINIMA THEN
        RAISE_APPLICATION_ERROR(-20002, 
            'A idade mínima permitida para o passageiro é ' || IDADE_MINIMA || ' anos.');
    END IF;
END;
/

/*TRIGGER DE COMANDO*/
CREATE OR REPLACE TRIGGER trg_log_delete_funcionario_console AFTER DELETE ON Funcionário 
BEGIN
DBMS_OUTPUT.PUT_LINE( '--- LOG DE (DELETE STATEMENT) ---' ); DBMS_OUTPUT.PUT_LINE( 'USUÁRIO: ' || USER || ' | DATA/HORA: ' || TO_CHAR(SYSTIMESTAMP, 'DD-MON-YYYY HH24:MI:SS') ); 
END; 
/

/*WHILE LOOP, BLOCO ANÔNIMO, %TYPE*/
DECLARE
    v_nome_pass   Passageiro.Nome%TYPE;
    v_idade_pass  Passageiro.idade%TYPE;
    v_idade_minima INTEGER := 40;

    CURSOR c_passageiros_seniores IS
        SELECT Nome, idade
        FROM Passageiro
        WHERE idade >= v_idade_minima
        ORDER BY idade DESC; 

BEGIN
    OPEN c_passageiros_seniores;
    FETCH c_passageiros_seniores INTO v_nome_pass, v_idade_pass;
    WHILE c_passageiros_seniores%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(
            'Nome: ' || v_nome_pass || ' | Idade: ' || v_idade_pass
        );
        FETCH c_passageiros_seniores INTO v_nome_pass, v_idade_pass;     
    END LOOP; 
    CLOSE c_passageiros_seniores;
END;
/

/*FOR LOOP*/
BEGIN
    FOR reg_bagagem IN ( 
        SELECT
            numero_da_reserva,
            id_da_bagagem,
            status,
            hora_despacho
        FROM
            Bagagem
        WHERE
            TRUNC(hora_despacho) = TO_DATE('2025-10-23', 'YYYY-MM-DD')
        ORDER BY
            hora_despacho ASC 
            
    ) LOOP        
        DBMS_OUTPUT.PUT_LINE(
            'Reserva: ' || reg_bagagem.numero_da_reserva ||
            ' | ID Bagagem: ' || reg_bagagem.id_da_bagagem ||
            ' | Status: ' || reg_bagagem.status
        );

    END LOOP;
    DBMS_OUTPUT.PUT_LINE('--- Fim do processamento de bagagens do dia 23 ---');
END;
/

/*CREATE OR REPLACE PROCEDURE*/
CREATE OR REPLACE PROCEDURE inserir_piloto(
    p_cpf FUNCIONÁRIO.cpf%TYPE, 
    p_nome FUNCIONÁRIO.nome%TYPE, 
    p_idade FUNCIONÁRIO.idade%TYPE, 
    p_cad_aviação PILOTO.cadastro_aviação%TYPE,
    p_licença PILOTO.licença_piloto_linha_aérea%TYPE) IS
BEGIN
    INSERT INTO FUNCIONÁRIO(cpf, Nome, Idade)
    VALUES(p_cpf, p_nome, p_idade);
    INSERT INTO PILOTO(cpf_piloto, cadastro_aviação, licença_piloto_linha_aérea)
    VALUES(p_cpf, p_cad_aviação, p_licença);
    COMMIT;
END inserir_piloto;
/

/*SELECT INTO*/
DECLARE
r_voo RESERVA.num_voo%TYPE := 9223;
r_qtd INTEGER;

BEGIN
SELECT COUNT(*) INTO r_qtd
FROM RESERVA R
WHERE R.num_voo = r_voo;
    DBMS_OUTPUT.PUT_LINE('Quantidade de passageiros no voo ' || TO_CHAR(r_voo) || ': ' ||TO_CHAR(r_qtd));
EXCEPTION
WHEN NO_DATA_FOUND THEN
 DBMS_OUTPUT.PUT_LINE('Nenhum passageiro registrado nesse voo.');
END;
/

/*CREATE OR REPLACE PACKAGE*/
CREATE OR REPLACE PACKAGE pkg_gestao_passageiros AS
  PROCEDURE registrar_novo_passageiro (
      p_cpf         IN Passageiro.cpf%TYPE,
      p_nome        IN Passageiro.Nome%TYPE,
      p_idade       IN Passageiro.idade%TYPE,
      p_cep         IN Passageiro.cep%TYPE,
      p_num_porta   IN Passageiro.número%TYPE,
      p_telefone    IN Telefone_passageiro.telefone_passageiro%TYPE
  );

END pkg_gestao_passageiros;
/

/*CREATE OR REPLACE PACKAGE BODY*/
CREATE OR REPLACE PACKAGE BODY pkg_gestao_passageiros AS
  PROCEDURE registrar_novo_passageiro (
      p_cpf         IN Passageiro.cpf%TYPE,
      p_nome        IN Passageiro.Nome%TYPE,
      p_idade       IN Passageiro.idade%TYPE,
      p_cep         IN Passageiro.cep%TYPE,
      p_num_porta   IN Passageiro.número%TYPE,
      p_telefone    IN Telefone_passageiro.telefone_passageiro%TYPE
  )
  IS
  BEGIN
    
    INSERT INTO Passageiro (cpf, cep, Nome, idade, número)
    VALUES (p_cpf, p_cep, p_nome, p_idade, p_num_porta);
    
    INSERT INTO Telefone_passageiro (cpf_passageiro, telefone_passageiro)
    VALUES (p_cpf, p_telefone);
    
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE;
      
  END registrar_novo_passageiro;

END pkg_gestao_passageiros;
/

/*IF ELSE IF*/
DECLARE
  cpf_passageiro Passageiro.cpf%TYPE;
  cep_passageiro Passageiro.cep%TYPE;
BEGIN
  cpf_passageiro := '42819365017';
  SELECT cep INTO cep_passageiro FROM PASSAGEIRO WHERE cpf = cpf_passageiro;

  IF cep_passageiro IN ('50070001', '50010010') THEN
    DBMS_OUTPUT.PUT_LINE('Está em um CEP especial');
  ELSIF cep_passageiro IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('Não se aplica');
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('ERRO: Nenhum dado foi encontrado');
END;
/

/*LOOP EXIT WHEN*/
DECLARE
    TYPE Tabela_Voos IS TABLE OF Voo.numero_de_voo %TYPE
        INDEX BY BINARY_INTEGER;

    CURSOR c_voos_selecionados IS
        SELECT numero_de_voo
        FROM Voo
        WHERE previsao_de_ida = TIMESTAMP '2025-10-23 20:00:00'; 

    v_voo_atual Voo.numero_de_voo %TYPE; 
    v_voos_encontrados Tabela_Voos;     
    v_indice BINARY_INTEGER := 1;        
BEGIN
    OPEN c_voos_selecionados;
    LOOP
        FETCH c_voos_selecionados INTO v_voo_atual;
        
        EXIT WHEN c_voos_selecionados%NOTFOUND;
        
        v_voos_encontrados(v_indice) := v_voo_atual;
        
        v_indice := v_indice + 1;
        
    END LOOP;
    CLOSE c_voos_selecionados;

    IF v_voos_encontrados.COUNT > 0 THEN
        v_indice := v_voos_encontrados.FIRST;
        WHILE v_indice IS NOT NULL LOOP
            DBMS_OUTPUT.PUT_LINE('- Voo N° ' || v_voos_encontrados(v_indice));
            v_indice := v_voos_encontrados.NEXT(v_indice);
        END LOOP;
    END IF;
END;
/

/*CURSOR*/
DECLARE
    n_voo VOO.numero_de_voo%TYPE;
    d_voo VOO.previsao_de_ida%TYPE;
    parte_voo VOO.cod_iata_ida%TYPE:='BSB';
    dest_voo VOO.cod_iata_volta%TYPE:='REC';
    CURSOR v_voo IS
    SELECT numero_de_voo, previsao_de_ida
    FROM VOO v
    WHERE V.cod_iata_ida = parte_voo 
        AND V.cod_iata_volta = dest_voo;

BEGIN
    OPEN v_voo;
LOOP 
    FETCH v_voo INTO n_voo, d_voo;
    EXIT WHEN v_voo%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Voo indo de'|| ' ' || TO_CHAR(parte_voo)|| ' ' || 'para' || ' ' || TO_CHAR(dest_voo)|| ': ' || TO_CHAR(n_voo)|| ' ' || TO_CHAR(d_voo));
END LOOP;

CLOSE v_voo;
END;
/
