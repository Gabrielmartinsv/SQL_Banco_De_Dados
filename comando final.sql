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