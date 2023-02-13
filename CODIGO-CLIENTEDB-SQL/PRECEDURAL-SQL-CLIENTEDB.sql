SELECT * FROM categorias;
USE clientes_db

---============= Terminar esta parte do codigo que ficou faltando na aula
CREATE PROCEDURE busca_categoria
@nome_categoria VARCHAR (20)
AS
SET @nome_categoria = '%' + @nome_categoria




CREATE PROCEDURE buca_contagem_produtos
	@nome_categoria VARCHAR (20)
	AS
	SET @nome_categoria = '%' + @nome_categoria + '%'

SELECT
	COUNT(p.id) contagem_produtos
	FROM produtos p
	JOIN categorias c ON p.id_categoria = c.id
	WHERE c.nome LIKE @nome_categoria
	GROUP BY c.nome;
EXEC buca_contagem_produtos 'Games'

--==== TRIGGER

CREATE TRIGGER tr_log
ON categorias
AFTER UPDATE, INSERT, DELETE
AS 
SELECT * FROM categorias;

CREATE PROCEDURE inserir_categoria
	@nome_categoria VARCHAR(50),
	@ativo CHAR(3)
AS
	BEGIN

	INSERT INTO categorias (nome, ativa)
	VALUES (@nome_categoria, @ativo);
	END;

EXEC inserir_categoria 'Carro', '[v]';
EXEC inserir_categoria 'Moto', '[f]';
