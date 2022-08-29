#							Atividade 1 BD2D3

#			Criação das querys solicitadas na Atividade avaliativa 1

#           Alunos avaliados:  Sabrina Moura Gandra    GU3021114
#					           Henrique Munhoz Leite   GU3020185

#--------------------------------------------------------------------------------------------------
#Query 1 - Mostra os empregados que estão na região de WA (Washington)
USE northwind;

SELECT *	
    FROM employees
    WHERE Region LIKE 'WA'
    ORDER BY FirstName;
   
    
#--------------------------------------------------------------------------------------------------
#Query 2 - Alterando a tabela suppliers, dropando o fax dela

ALTER TABLE suppliers
DROP Fax;
SELECT * FROM suppliers;


#--------------------------------------------------------------------------------------------------
 #Query 3  select mostrando tabela employees e ordenando pela data de nascimento
 
 
SELECT *
FROM employees
ORDER BY BirthDate;


#--------------------------------------------------------------------------------------------------
 #Query 4 - União de duas colunas que possuem o mesmo número de tabelas
 
SELECT *
FROM shippers
UNION
SELECT *
FROM Territories;

#--------------------------------------------------------------------------------------------------
#Query 5 - Query que mostra a data de contratação dos funcionários entre 1992 e 1993

SELECT *
FROM employees 
WHERE YEAR(HireDate) BETWEEN '1992' AND '1993'
ORDER BY EmployeeID;

#--------------------------------------------------------------------------------------------------

#Query 6 - Exibir os Funcionários que estejam com o salário acima da média geral
SELECT * FROM employees
WHERE salary >=(SELECT avg(salary) FROM Employees)
order by salary desc;

#--------------------------------------------------------------------------------------------------
#Query 7 - Tabela que filtra os funcionários através de seus títulos de costesia, nomes e sobrenomes denominados pelo Alias de cada campo

SELECT titleOfCourtesy as "Pronome honorário do funcionário", 
       employees.FirstName as "Nome do funcionário", 
       employees.LastName as "Sobrenome do funcionário"
FROM employees
order by title asc;

#--------------------------------------------------------------------------------------------------
#Query 8 - Query que conta a quantidade de funcionários cadastrados na tabela employees

SELECT COUNT(DISTINCT EmployeeID) as "Quantidade de empregados cadastrados:" FROM employees;

#--------------------------------------------------------------------------------------------------
#Query 9 - Query que seleciona os pedidos que passaram pela empresa de forma que são organizados pela data cronológica de pedido


SELECT * FROM orders
WHERE OrderDate =
(SELECT max(OrderDate) FROM orders);

#--------------------------------------------------------------------------------------------------
#Query 10 -  Exibir a quantidade de funcionários do sexo feminino através do título de classificação.

SELECT COUNT(DISTINCT employeeID) as "Quantidade de empregados do sexo Feminino:" FROM employees
WHERE TitleOfCourtesy = 'Ms.';

#--------------------------------------------------------------------------------------------------
#18Query 11 - Query que utiliza o DDL - ALTER para alterar a tabela adicionando uma coluna a mais, como a NFL_team
ALTER TABLE customers
ADD NFL_Team varchar(30);


SELECT * FROM customers;
#--------------------------------------------------------------------------------------------------
#Query 12 - Tabela que filtra os clientes de determinados países em determinadas cidades agrupados pelos próprios países 
select *
from customers
where (Country = 'Mexico' and City like 'Mxico D.F%') 
or (Country = 'Germany' and City like 'Berlin%')
group by Country;

#--------------------------------------------------------------------------------------------------
#Query 13 - Query que utiliza o DDL - MODIFY para modificar uma tabela já existente alterando seu nome

ALTER TABLE customercustomerdemo RENAME TO customerdemo;
SELECT * FROM shippers;


#---------------------------------------------------------------------------------------------------
#14 Buscar nome, sobrenome e data dos pedidos com Inner Join

select FirstName, LastName, OrderDate
	from employees inner join
	orders on employees.EmployeeID = orders.EmployeeID
    where title = 'Owner';
#---------------------------------------------------------------------------------------------------
#15 Buscar produto da categoria 2
SELECT ProductName as "Produtos da Categoria"
FROM products
WHERE CategoryID like '2%'
group by ProductName;


#---------------------------------------------------------------------------------------------------
#16 SubQuery

SELECT 
    EmployeeID, FirstName , LastName, Salary
FROM
    employees
WHERE
    salary = (SELECT 
            MAX(salary)
        FROM
            employees)
ORDER BY FirstName , LastName;

#---------------------------------------------------------------------------------------------------

#17 Buscar o ID doempregados jusnto com o ID das ordens utilizando exist

SELECT 
    OrderID, EmployeeID
FROM
    orders o
WHERE
    EXISTS( SELECT 
            1
        FROM
            employees e
        WHERE
            salary > 1000
                AND e.employeeID = o.employeeID)
ORDER BY OrderID; 

#---------------------------------------------------------------------------------------------------

#18 Subquery Select EmployeeID, FirstName, LastName, Salary com salário igual o maior que o menos salário

SELECT 
    EmployeeID, FirstName, LastName, Salary
FROM
    employees
WHERE
    Salary >= ALL (SELECT 
            MIN(salary)
        FROM
            employees
        GROUP BY title)
ORDER BY FirstName , LastName;

#---------------------------------------------------------------------------------------------------

#19 Consulta CTE 
WITH ConsultaCTE(ProductName, UnitPrice, CompanyName, Quantidade) 
AS (SELECT A.ProductName, A.UnitPrice, B.CompanyName,
	ROW_NUMBER() OVER( PARTITION BY A.ProductName ORDER BY B.CompanyName) Quantidade
	FROM products AS A
	INNER JOIN suppliers AS B
	ON a.SupplierID = b.SupplierID) 
SELECT *
from ConsultaCTE
where Quantidade > 0;


#---------------------------------------------------------------------------------------------------

#20 Produtos entre A e Z
select *
from products
where ProductName between 'A' and 'Z'
order by ProductName;

#---------------------------------------------------------------------------------------------------

#21 Union
SELECT *
FROM customerdemographics
UNION
SELECT *
FROM employeeterritories;


#---------------------------------------------------------------------------------------------------

#22 Informa a quantidade de linhas da tabela
select count(*) AS TotalLinhas
from shippers;

#---------------------------------------------------------------------------------------------------

#23 Media salarial
select CAST(AVG(salary) AS DECIMAL (9,2)) AS MediaSalarial
from employees;

#---------------------------------------------------------------------------------------------------

#24 Exibir a quantidade de employees de USA.
SELECT COUNT(DISTINCT employeeID) as "Quantidade de empregados de USA:" FROM employees
WHERE Country = 'USA';

#---------------------------------------------------------------------------------------------------
#25
SELECT orders.ShipName as "ShipName do funcionário", 
       employees.FirstName as "Nome do funcionário", 
       employees.LastName as "Sobrenome do funcionário"
FROM orders
INNER JOIN employees
ON orders.EmployeeID = employees.EmployeeID
order by ShipName asc;


#---------------------------------------------------------------------------------------------------

#26 Buscar Pedido por data
SELECT employees.FirstName as "Nome do funcionário", 
       orders.CustomerID as "ID", 
       orders.OrderDate as "Data"
FROM employees
INNER JOIN orders
ON employees.EmployeeID = orders.EmployeeID
order by OrderDate  asc;

#---------------------------------------------------------------------------------------------------
#27

SELECT * FROM salaries AS S
RIGHT JOIN employees AS E
ON S.emp_no = E.emp_no
order by salary desc;

#---------------------------------------------------------------------------------------------------

#28

#---------------------------------------------------------------------------------------------------

#29

#---------------------------------------------------------------------------------------------------

#30

