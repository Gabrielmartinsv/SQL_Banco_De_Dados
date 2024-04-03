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