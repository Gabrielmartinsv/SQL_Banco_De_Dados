--Criação das Tabelas

CREATE TABLE Cliente (
	codigo_cliente SERIAL PRIMARY KEY not null,
	nome_completo VARCHAR(100) NOT NULL,
	nome_usuario VARCHAR(100) NOT NULL unique,
	email TEXT NOT NULL unique,
	senha varchar(100) not null,
	cpf VARCHAR(16) NOT NULL unique,
	data_nascimento DATE NOT NULL,
	criado_em timestamp default current_timestamp,
	atualizado_em timestamp,
	ativo bool default true
);

CREATE TABLE Categoria (
	codigo_categoria SERIAL PRIMARY KEY not null,
	nome VARCHAR(50) NOT NULL,
	descricao TEXT NOT NULL,
	criado_em timestamp default current_timestamp,
	atualizado_em timestamp,
	ativo bool default true
);

CREATE TABLE Produto (
	codigo_produto SERIAL PRIMARY KEY not null,
	nome VARCHAR(100) NOT NULL,
	descricao TEXT NOT NULL,
	quantidade_estoque INT NOT NULL,
	data_fabricacao DATE NOT NULL,
	valor_unitario real NOT NULL,
	criado_em timestamp default current_timestamp,
	atualizado_em timestamp,
	ativo bool default true,
	id_categoria int REFERENCES Categoria(codigo_categoria)
);
	
CREATE TABLE Pedido (
	numero_pedido serial PRIMARY KEY,
	quantidade INT NOT NULL,
	data_pedido timestamp default current_timestamp,
	pedido_atualizado timestamp,
	ativo bool default true,
	id_cliente int REFERENCES Cliente(codigo_cliente)
); 
	
CREATE TABLE Pedido_Item (
	numero_pedido int REFERENCES Pedido(numero_pedido),
	codigo_produto int REFERENCES Produto(codigo_produto),
	primary key (numero_pedido, codigo_produto)
);

Create table funcionario (
	codigo_funcionario serial primary key not null,
	nome varchar(100) not null,
	cpf varchar(16) not null unique
);
	
create table fun_pro (
	codigo_funcionario int references funcionario(codigo_funcionario),
	codigo_produto int references produto(codigo_produto)
);

CREATE TABLE NotaFiscal (
	numero_nota SERIAL PRIMARY KEY,
	data_emissao timestamp default current_timestamp,
	numero_pedido int REFERENCES Pedido(numero_pedido)
);

Create table endereco (
	Endereco varchar(200) not null,
	numero int not null,
	Bairro varchar(200) not null,
	Cidade varchar(200) not null,
	Estado varchar(200) not null,
	cep varchar(200) not null,
	codigo_do_cliente int references cliente(codigo_cliente)
);


--Injeção de dados, no Banco de Dados


insert into categoria (
	nome,
	descricao
)values
	('Eletronico', 'Produtos eletronicos.'),
	('Eletrodomestico', 'Produto de casa.'),
	('Beleza', 'Produtos para seu corpo'),
	('Snacks', 'Biscoito, chocolate, comida'),
	('Esportes', 'Produtos esportivo');

insert into cliente (
	nome_completo,
	nome_usuario,
	email,
	senha,
	cpf,
	data_nascimento
)values
	('Natália Sílvia Pacheco da Silva', 'Natalia', 'Nataliasilva@hotmail.com', 'abobrinha123', '505.768.050-73', '1995-11-25'),
	('Bianca Isadora de Abreu', 'Bianca', 'biancaisadora@hotmail.com','hortela', '584.919.039-54', '2000-03-28'),
	('Pablo Anderson Casanova de Iglesias', 'Pablo', 'pabloanderson@hotmail.com','funeraria1231', '043.315.002-12', '1980-12-15'),
	('Aécio Ismael Fonseca de Leon', 'Aécio', 'aecioismael@hotmail.com','532456a', '014.755.440-43', '2010-06-10'),
	('Henrique Moisés de Aranda Jr', 'Henrique', 'Henriquemoises@hotmail.com','pausa1452', '178.866.250-48', '1990-01-20'),
	('Pablo Escobar Jr', 'Pablo Escobar', 'pabloescobar@hotmail.com','menor123', '198.766.550-48', '1991-01-09');

insert into endereco (
	endereco,
	numero,
	bairro,
	cidade,
	estado,
	cep,
	codigo_do_cliente
)values 
	('Av. dos Girassoes', '456', 'Jardin das Flores', 'Cidade Verde', 'Estado Tranquilo', '54321-987', '1'),
	('Travessa das Palmeiras', '789', 'Centro', 'Cidade do Sol', 'Estado Sereno', '67890-321', '2'),
	('Praça das Rosas', '210', 'Vila Esperança', 'Encantada', 'Estado Pacífico', '98765-432', '3'),
	('Rua das Violetas', '789', 'Bosque das Arvores', 'Amazonas', 'Estado Raivoso', '23456-789', '4'),
	('Almeida dos Ipes', '456', 'Jardin Florenço', 'Cidade Pacífico', 'Estado aconchegante', '54321-012', '5');

insert into funcionario (
	nome,
	cpf
)values
	('Gabriel MARTINS Vasconcellos', '895.449.540-32'),
	('Leony Santos Aragão Henrique', '964.102.572-14'),
	('Geisila Silva da Costa', '731.380.074-56'),
	('Kamille da Cruz do Carmo' ,'590.842.072-32'),
	('Erik Romaneli Hudgins', '990.249.049-54');

insert into produto (
	nome, 
	descricao,
	quantidade_estoque,
	data_fabricacao,
	valor_unitario,
	id_categoria
)values 
	('Televisao', '30 Polegadas', '200', '2024-04-07', '3000.00', '1'),
	('Computador', 'i3-1000, placa integrada...', '20','2024-06-05', '1600.00','1'),
	('Ar-condicionado', '9000btu', '100', '2024-11-09', '2000.00', '2'),
	('Micro-ondas', 'Esquenta sua comida, 20L', '500', '2020-12-27', '500.00', '2'),
	('Geladeira', 'Gela seus alimentos, 50L', '1000','2024-01-03', '8000.00', '2'),
	('Shampoo', '3 em 1', '40', '2023-11-30', '30', '3'),
	('Chocolate', '90% cacau', '10', '2020-01-23', '20.50', '4'),
	('Bola de futebol', 'Feito de materiais compostos de alta qualidade.', '50', '2020-12-03', '60.25', '5');

insert into fun_pro (
	codigo_funcionario,
	codigo_produto
)values
	('1', '1'),
	('1','2'),
	('2','5'),
	('3','3'),
	('4','4'),
	('5','2');

insert into pedido (
	id_cliente,
	quantidade
)values
	('1', '5'),
	('2', '2'),
	('3', '3'),
	('4', '6'),
	('5', '10'),
	('6', '15');

insert into pedido_item (
	numero_pedido,
	codigo_produto
)values 
	('1', '1'),
	('2', '3'),
	('2', '4'),
	('3', '2'),
	('4', '4'),
	('4', '5'),
	('5', '5'),
	('6', '6');

insert into notafiscal (
	numero_pedido
)values 
	('1'),
	('2'),
	('3'),
	('4'),
	('5');
	
--Pelo menos 2 com algum tipo de junção

select 
	f.codigo_funcionario,
	f.nome,
	f.cpf,
	p.codigo_produto,
	p.nome,
	p.descricao,
	p.quantidade_estoque,
	p.data_fabricacao,
	p.valor_unitario,
	p.id_categoria,
	p.atualizado_em,
	p.ativo,
	c.nome
from 
	fun_pro fu
		inner join funcionario f on f.codigo_funcionario =  fu.codigo_funcionario
		inner join produto p on p.codigo_produto = fu.codigo_produto
		inner join categoria c on c.codigo_categoria = p.id_categoria
where
	f.codigo_funcionario = '1';

select 
	c.nome_completo,
	c.nome_usuario,
	c.email,
	c.cpf,
	c.data_nascimento,
	e.endereco,
	e.bairro,
	e.numero,
	e.cidade,
	e.estado,
	e.cep,
	p.numero_pedido
from 
	cliente c
		inner join endereco e on c.codigo_cliente = e.codigo_do_cliente
		inner join pedido p on c.codigo_cliente = p.id_cliente
where 
	c.nome_usuario = 'Aécio';

select 
	c.nome_usuario,
	c.email,
	e.endereco,
	e.numero,
	e.cep,
	pe.numero_pedido,
	p.quantidade,
	p.data_pedido,
	pr.nome,
	pr.valor_unitario
from 
	pedido_item pe
		inner join cliente c on pe.numero_pedido = c.codigo_cliente
		inner join pedido p on pe.numero_pedido = p.numero_pedido
		inner join produto pr on pe.codigo_produto = pr.codigo_produto
		inner join endereco e on c.codigo_cliente = e.codigo_do_cliente
Where 
	pe.numero_pedido = '5';


--Pelo menos 1 com usando count() e group by()

select 
	count
		(p.codigo_produto) as quantos_pedidos_foram_feitos, pr.nome, pr.descricao
from
	pedido_item p
	inner join produto pr on p.codigo_produto = pr.codigo_produto
GROUP BY 
	(pr.nome, pr.descricao);
	
	
--1 SQL para construção de nota fiscal

select 
	Sum 
		(pr.valor_unitario)*pe.quantidade as soma_da_quantiade_por_produto, pr.nome, pr.descricao, pr.data_fabricacao, pr.valor_unitario, e.cep,  c.nome_completo, c.email, c.cpf, n.data_emissao
from 
	produto p 
		inner join pedido_item pi on pi.codigo_produto = p.codigo_produto
		inner join pedido pe on pi.numero_pedido = pe.numero_pedido
		inner join notafiscal n on pi.numero_pedido = n.numero_nota
		inner join cliente c on pe.id_cliente = c.codigo_cliente
		inner join endereco e on c.codigo_cliente = e.codigo_do_cliente
		inner join produto pr on pi.codigo_produto = pr.codigo_produto
where
	pi.numero_pedido = '2'
group by 
	pe.quantidade, pr.nome, pr.descricao, pr.data_fabricacao, pr.valor_unitario, e.cep,  c.nome_completo, c.email, c.cpf, n.data_emissao;

--Atualização de uma tabela, e exclusão.

Update 
	produto
set 
	quantidade_estoque = '1000',
	valor_unitario = '2000',
	atualizado_em = current_timestamp
where 
	nome = 'Televisao';

select * from produto;

delete from 
	pedido_item 
where 
	numero_pedido = '6';

select * from pedido_item;