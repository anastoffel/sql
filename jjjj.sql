
CREATE TABLE clientes (
    -- coluna / tipo de dado / restrição
    idClientes INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(100)
);   


CREATE TABLE Pedidos (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idClientes INT,
    numeroPedido VARCHAR(50),
    valorTotal DECIMAL(10, 2),
    dataPedido DATE,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);   



INSERT INTO Pedidos (idCliente, numeroPedido, valorTotal, dataPedido)
VALUES (1, 'PED-001', 150.00, '2024-07-12'),
       (2, 'PED-002', 250.00, '2024-07-12'),
       (1, 'PED-003', 180.00, '2024-07-13');

--Alterar uma tabela ja criada e adicionar uma coluna:

ALTER TABLE clientes
ADD email VARCHAR(100);


--Alterar uma tabela ja criada e modificar o tipo de uma coluna:

ALTER TABLE clientes 
MODIFY email TEXT;


--Alterar uma tabela ja criada e renomear uma coluna:

ALTER TABLE clientes 
CHANGE COLUMN email emailCliente VARCHAR(255);


--Alterar uma tabela ja criada e remove uma coluna:  

ALTER TABLE clientes 
DROP COLUMN telefone;

--Alterar uma tabela ja criada e altera o nome dela:

ALTER TABLE clientes 
RENAME TO Clientes;


--Como deletar uma tabela:
DROP TABLE Clientes;


--Como inserir dados em uma tabela:

INSERT INTO Clientes (idClientes, nome, email)
VALUES (1, 'João Silva', 'joao.silva@email.com');


--Como atualizar dados em uma tabela:

UPDATE Clientes
SET email = 'novo.email@email.com'
WHERE idCliente = 1; -- condição


(SELECT idClientes


SELECT *
FROM Clientes)


-- VALOR TOTAL

SELECT SUM(valorTotal) AS valor_medio_pedidos
FROM Pedidos;

-- MEDIA VALOR

SELECT AVG(valorTotal) AS valor_medio_pedidos
FROM Pedidos;

-- PEDIDO COM NUMERO MAIS ALTO

SELECT MAX(numeroPedido) AS pedido_com_numero_mais_alto
FROM Pedidos;


-- PEDIDO COM NUMERO MAIS BAIXO 

SELECT MIN (numeroPedido) AS pedido_com_numero_mais_baixo
FROM Pedidos;


--CONSULTA COM JUNÇÃO DE TABELAS INNER

SELECT clientes.idClientes, clientes.nome, clientes.emailCliente, Pedidos.numeroPedido
FROM clientes
INNER JOIN Pedidos ON clientes.idClientes = Pedidos.idClientes;


--CONSULTA COM JUNÇÃO DE TABELAS LEFT

SELECT clientes.idClientes, clientes.nome, Pedidos.numeroPedido
FROM clientes
LEFT JOIN Pedidos ON clientes.idClientes = Pedidos.idClientes;


--CONSULTA COM JUNÇÃO CONDICIONAL

SELECT clientes













-- /////////////
CREATE TABLE departamentos (
    departamento_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);    


CREATE TABLE empregados (
    empregados_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamentos (departamento_id)
);



INSERT INTO departamentos (nome) VALUES
('Vendas'),
('Marketing'),
('TI'),
('recursos Humanos');


INSERT INTO empregados (nome, salario, departamento_id) VALUES
('Maicou Diécson', 5000.00, 1),
('Vandercleison', 6000.00, 1),
('Kerolaine', 4000.00, 2),
('Wanderneidson', 5500.00, 3),
('Kellen', 7000.00, 3),
('Chico', 3000.00, 4),
('Greice Kelly', 4500.00, 2),
('Xonas', 3500.00, 1);




--Subconsultas Escalares
Retornam um único valor.
Consulta para Encontrar Empregados com Salário Acima da Média


SELECT nome, salario
FROM empregados 
WHERE salario > (SELECT AVG(salario) FROM empregados);



ALTER TABLE departamentos ADD localizacao VARCHAR(50);

UPDATE departamentos SET localizacao = 'São Paulo' WHERE nome = 'Vendas';
UPDATE departamentos SET localizacao = 'Rio de Janeiro' WHERE nome = 'Marketing';
UPDATE departamentos SET localizaacao = 'São Paulo' WHERE nome = 'TI';
UPDATE departamentos SET localizaacao = 'Belo Horizonte' WHERE nome = 'Recursos Humanos';




ALTER TABLE empregados ADD titulo VARCHAR(50);

CREATE TABLE cargos (
    cargos_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    departamento_id INT,
    salario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);


ALTER TABLE empregados DROP salario;



UPDATE empregados SET titulo = 'Gerente' WHERE nome = 'Comandos 80';
UPDATE empregados SET titulo = 'Assistente' WHERE nome = 'Comandos 14';
UPDATE empregados SET titulo = 'Analista' WHERE nome = 'Cabo Prass';
UPDATE empregados SET titulo = 'Desenvolvedor' WHERE nome = 'Ten Cel Capitão';
UPDATE empregados SET titulo = 'Engenheiro' WHERE nome = 'Boris Skalovisk';
UPDATE empregados SET titulo = 'assistente' WHERE nome = 'Barroo';
UPDATE empregados SET titulo = 'Analista' WHERE nome = 'Tenente Sincero';
UPDATE empregados SET titulo = 'Estagiário' WHERE nome = 'Maldito Cão de Guerra';


INSERT INTO cargos (titulo, departamento_id, salario) VALUES
('Gerente', 1, 8000.00),
('Assistente', 1, 4000.00),
('Analista', 2, 4500.00),
('Desenvolvedor', 3, 6000.00),
('Engenheiro', 3, 7000.00),
('Assistente', 4, 3500.00),
('Analista', 2, 4600.00),
('Estagiário', 1, 2000.00);