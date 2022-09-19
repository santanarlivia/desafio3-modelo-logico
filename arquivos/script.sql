-- construindo o banco de dados para o e-commerce
-- criando tabelas
drop database ecommerce;
create database ecommerce;
use ecommerce;


drop table Cliente;
create table Cliente (
	idCliente int auto_increment primary key,
    Pnome varchar(10),
    NmeioInicial varchar (3),
    Sobrenome varchar(20) not null,
    CPF char (14),
    constraint unique_cpf_cliente unique(CPF),
    Endereço varchar (45) not null,
    DataDeNascimento date not null
	);
    
   
        
	create table Produto (
			IdProduto int not null auto_increment primary key,
            constraint Produto_id unique (IdProduto),
            Categoria varchar(45) not null,
            Descrição varchar(150) not null,
			Valor float not null
        );
        
        create table Estoque (
			idEstoque int not null auto_increment primary key,
			constraint estoque_id unique (IdEstoque),
			Localização varchar (45)
        );

        
    
    create table Fornecedor (
			idFornecedor int not null auto_increment primary key,
            RazãoSocial char(45),
            CNPJ varchar(14),
			constraint unique_atributes_fornec unique (IdFornecedor, RazãoSocial, CNPJ)
        );

    
    
    drop table Entrega;
    
    create table Entrega(
			idEntrega int not null auto_increment primary key,
			Status_E enum('A caminho', 'Entregue') not null,
			CodRastreio int not null 
);

        
    	create table Pedido (
			idPedido int not null auto_increment primary key,
			StatusDoPedido enum ('Em andamento', 'Processando', 'Entregue') not null,
			Descrição varchar (45) not null,
            IdCliente int not null,
            IdEntrega int not null,
			constraint fk_IdCliente_Pedido foreign key (IdCliente) references Cliente (IdCliente), 
			Frete float not null,
		 	constraint fk_IdEntrega_Pedido foreign key (IdEntrega) references Entrega (IdEntrega)
    
    );
    
    drop table Vendedor;
    
    create table Vendedor(
		idVendedor int not null auto_increment primary key,
		RazãoSocial char(45),
		Localização varchar(45),
        constraint uniques_vendedor unique (RazãoSocial, IdVendedor)
    ); 
        
	drop table  DisponibilizandoProduto;
create table DisponibilizandoProduto(
	idFornecedor int not null,
    idProduto int not null,
    Quantidade int not null,
	foreign key (idFornecedor) references Fornecedor (idFornecedor),
	foreign key (idProduto) references Produto (IdProduto)
);

drop table ProdutosPorVendedor;

create table ProdutosPorVendedor(
	IdVendedor int not null,
    IdProduto int not null,
	constraint fk_PPV_IdVendedor foreign key (IdVendedor) references Vendedor (IdVendedor),
	constraint fk_PPV_IdProduto foreign key (IdProduto) references Produto(IdProduto),
	Quantidade int not null
);


create table Pagamento(
	idPagamento int not null primary key auto_increment,
	FormaDePagamento varchar (45),
	DataDeValidade date
);

        
create table Pagamento_Pedido(
	IdCliente int not null,
    IdProduto int not null,
    IdEntrega int not null,
    IdPagamento int not null,
	constraint fk_IdCliente_PP	foreign key (IdCliente) references Cliente (IdCliente),
	constraint fk_IdProduto_PP	foreign key (IdProduto) references Produto(IdProduto),
	constraint fk_IdEntrega_PP	foreign key (IdEntrega) references Entrega(IdEntrega),
	constraint fk_IdPagamento_PP foreign key (IdPagamento) references Pagamento (IdPagamento)
);


drop table Relação_Produto_Pedido ;

create table Relação_Produto_Pedido (
	IdProduto int not null,
    IdPedido int not null,
	constraint fk_IdProduto_RPP foreign key (IdProduto) references Produto (IdProduto),
	constraint fk_IdPedido_RPP  foreign key  (IdPedido) references Pedido(IdPedido), 
	Quantidade int not null,
	StatusP ENUM('Disponível', 'Fora de Estoque')
);


        
        