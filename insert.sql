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