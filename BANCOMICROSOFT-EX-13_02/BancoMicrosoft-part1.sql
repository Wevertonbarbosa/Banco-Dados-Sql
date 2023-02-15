--=====QUAL O CUSTO TOTAL DE CADA TIPOP DE FRETE
SELECT ShipVIa, SUM(Freight) Frete_Total
FROM Orders
GROUP BY ShipVia
ORDER BY ShipVia;

--=====MOSTRE QUANTOS PRODUTOS CADA FORNECEDOR DISPONIBILIZA EM CADA CATEGORIA
--==== O DISTINCT REMOVE DUPLICATA
SELECT SupplierID, CategoryID,COUNT(DISTINCT(ProductID)) QuantidadeProdutos
FROM Products
WHERE Discontinued = 0
GROUP BY SupplierID, CategoryID
ORDER BY SupplierID, CategoryID;

--===== GERENTE DE VENDAS DA EMPRESA X PEDE UMA SERIE TEMPORAL (MENSAL) COM O VOLUME DE PEDIDOS E O VALOR DE VENDAS
SELECT FORMAT(OrderDate, 'yyyy-MM') Mes,COUNT(DISTINCT(o.OrderId)) AS numero_pedidos,
ROUND(SUM(od.Quantity*UnitPrice*(1-od.Discount)), 2) Valor_total_Pedido
FROM Orders AS o
JOIN [Order Details] od ON od.OrderID = o.OrderID
GROUP BY FORMAT(OrderDate, 'yyyy-MM');

---===== Retorna uma tabela com uma função
CREATE FUNCTION EmpregadoNome(@empregado_Id int)
RETURNS TABLE
RETURN(
	SELECT FirstName, LastName, HomePhone,Title

	FROM Employees
	WHERE EmployeeID = @empregado_Id
);

SELECT * FROM EmpregadoNome(1);

--==== Retorna apenas o valor para agregar e não uma tabela conforme o exemplo anterior
CREATE FUNCTION funcao_teste(@valor int)
RETURNS INT
AS 
BEGIN
	SET @valor = @valor + 5
	RETURN @valor
END
GO

SELECT dbo.funcao_teste(45);



--=== QUAL A FRAÇÃO DO VALOR VENDIDO POR CADA VENDEDOR EM RELAÇÃO AO VALOR TOTAL DA VENDA
WITH vendas_por_vendedor AS(
SELECT 
emp.FirstName AS vendedor,
SUM(ode.Quantity * UnitPrice*(1 - ode.Discount)) as Valor_individual
FROM Employees emp
JOIN Orders ord ON ord.EmployeeID = emp.EmployeeID
JOIN [Order Details] as ode ON ode.OrderID = ord.OrderID
GROUP BY emp.FirstName)
SELECT
vendedor,
ROUND(valor_individual,2),
ROUND((valor_individual/(SELECT SUM(valor_individual) FROM vendas_por_vendedor)) * 100, 2) as proporcao
FROM vendas_por_vendedor
