-- populando as tabelas

 insert into Cliente (Pnome, NmeioInicial, Sobrenome, CPF, Endereço, DataDeNascimento) values
		('Luiz','RS', 'Santana','189.711.600-47', 'Alcântaras- CE', '1979-07-12'),
		('John', 'B', 'Smith', '765.767.788-78' , 'Vitória do Jari- AP ','1965-01-09'),
		( 'Lucas', 'EF', 'Farias', '086.687.780-05', 'Paulista - PE','1987-06-11'),
		('Rafael', 'RSS', 'Soares', '076.092.060-59', 'Paulista-PE','2007-04-07'),
		( 'Luana', 'CF', 'Almeida', '909.861.050-15', 'Assunção-PI', '1999-03-12'),
        ( 'Maria', 'GT', 'Souza', '785.587.860-20' , 'Barra Alcântara-PI','1975-09-09' );
        
        select * from Cliente where idCliente % 2 = 0 -- id pares
        order by Pnome;
        
        select * from Produto;
        
insert into Produto (Categoria, Descrição, Valor ) values 
				('Moda',' Camisa amarela emoji', '55.66' ),
				('Beleza' ,'Batom Vermelho cereja bruna tavares', '22.50'),
				('Tecnologia', 'Fone de ouvido bluetooh sem fio jbl', '150.59'),
				('Livros','A culpa é das estrelas - John Green', '25.66');

SELECT Valor, AVG(Produto.Valor)  
FROM Produto INNER JOIN Estoque 
GROUP BY IdProduto % 2 = 0
HAVING AVG(Valor) > 10;
                
insert into Estoque (Localização) values ('São Luís - MA'),
		('Recife-PE'),
		('Salvador-BA'),
		('Teresina-PI'),
		('João Pessoa-PB'),
		('Campina Grande-PB');

select * from Estoque where idEstoque % 2 = 1; -- id ímpares
          
insert into Fornecedor (RazãoSocial, CNPJ) values
		('Teresinha e Isabelle Produtos Ltda','23634306000103'),
		('Vitor e César Ltda','96029009000102'),
		('Raimunda e Marcela Entregas Expressas Ltda','96029009000102'),
		('Márcio e Joaquim Tecnoloy','17375230000138'),
		('Rosana e Mariah Coisas Ltda ','41206558000105'),
		('Rosa e Gabriel Eletrônica Ltda','17841726000150');
        
select * from Fornecedor
group by idFornecedor % 2 = 0;  

    select * from Fornecedor where idFornecedor > 2 and  idFornecedor < 10;
      
insert into Pedido (StatusDoPedido, Descrição, IdCliente, IdEntrega, Frete) values 
	('Em andamento','Fone de ouvido bluetooh sem fio jbl','6', '2', '15.09'),
	(default, 'Batom Vermelho cereja bruna tavares', '4', '1', '22.00'),
	('Entregue','A culpa é das estrelas - John Green', '3', '3', '02.30');

select * from Pedido;

insert into Entrega (Status_E, CodRastreio) values ('A caminho','4297'),
	('Entregue','8518'),
	('Entregue', '1606'),
	('A caminho','1606'),
	('Entregue','9602') ;
    
    select * from Entrega;
          
insert into Vendedor (RazãoSocial, Localização) values ('Boneca Modas','São Luís - MA'),
	('Tic Tecnologia','Belo Horizonte - MG'),
	('Makeup Gata', 'Itumbiara - GO ');
          
    
insert into DisponibilizandoProduto (IdProduto, IdFornecedor, Quantidade) values 
    ('1', '3','10'),
    ('2', '4','30'),
    ('3', '1','10'),
    ('4', '5', '20')
    ;

select * from Pagamento where idPagamento = 1;
select * from Pagamento where FormaDePagamento = 'pix'
order by DataDeValidade;
        
insert into Pagamento (FormaDePagamento, DataDeValidade) values ('Crédito', '2022-08-12'),
('pix','2022-07-08'),
('pix','2022-05-03');
          
insert into Pagamento_Pedido (IdCliente,IdProduto,IdEntrega,IdPagamento) values ('6','2', '1','2'),
('4', '4','1','1'), 
('3', '3', '3', '3');

select * from Relação_Produto_Pedido;



insert into Relação_Produto_Pedido (IdProduto, IdPedido, Quantidade, StatusP) values
('3','1','1', 'disponível'),
('2', '2', '2', 'disponível'),
('4', '3', '1', 'Fora de Estoque');