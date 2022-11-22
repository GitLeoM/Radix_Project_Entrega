#Banco de dados - TCC - Grupo D
create database Radix;
use Radix;

#Tabela Cliente
create table tblCliente(
idCliente int auto_increment primary key,
nomeCliente varchar(50),
cpf varchar(14),
email varchar(50),
senha varchar(15),
statusConta bit
);

#Tabela Vendedor
create table tblVendedor(
idVendedor int auto_increment primary key,
nomeVend varchar(50),
cpfCnpj varchar(20),
email varchar(50),
senha varchar(15),
imagem varchar(500),
statusConta bit
);


#Tabela Vendedores favoritos
create table tblVendedorFav(
idVendedorFav int auto_increment primary key,
idCliente int,
foreign key(idCliente) references tblCliente(idCliente),
idVendedor int,
foreign key(idVendedor) references tblVendedor(idVendedor)
);


#Tabela Endereco
create table tblEndereco(
idEndereco int auto_increment primary key,
endereco varchar(100),
apelidoEndereco varchar(100),
complemento varchar(50),
numero varchar(5),
enderecoPrincipal bit,
statusEndereco bit,
idCliente int,
foreign key (idCliente) references tblCliente(idCliente)
);

#Tabela Produto
create table tblProduto(
idProduto int auto_increment primary key,
nomeProd varchar(50),
preco double,
foto varchar(500),
detalhe varchar(250),
idVendedor int,
foreign key (idVendedor) references tblVendedor(idVendedor),
statusProduto bit
);

#Tabela Item
create table tblItem(
idItem int auto_increment primary key,
qtde int,
idProduto int,
foreign key (idProduto) references tblProduto(idProduto),
idCliente int,
foreign key (idCliente) references tblCliente(idCliente),
statusItem bit
);


#Tabela Pedido
create table tblPedido(
idPedido int auto_increment primary key,
horario datetime,
cupom bit,
frete decimal,
statusPedido int,
idCliente int,
foreign key (idCliente) references tblCliente(idCliente),
idItem int,
foreign key (idItem) references tblItem(idItem),
idVendedor int,
foreign key (idVendedor) references tblVendedor(idVendedor)
);

#Tabela Pedido temporario (carrinho)
create table tblPedidoTemp(
idPedidoTemp int auto_increment primary key,
horario datetime,
cupom bit,
frete decimal,
idCliente int,
foreign key (idCliente) references tblCliente(idCliente),
idItem int,
foreign key (idItem) references tblItem(idItem),
idVendedor int,
foreign key (idVendedor) references tblVendedor(idVendedor)
);



#Tabela Punicao
create table tblPunicao(
idPunicoes int auto_increment primary key,
idVendedor int,
foreign key (idVendedor) references tblVendedor(idVendedor),
tipo varchar(20),
motivo varchar(300),
assunto varchar(25)
);

#Tabela Cupom
create table tblCupom(
idCupom int auto_increment primary key,
nome varchar (20),
detalhe varchar(45),
num varchar(25)
);



#Tabela Reclamacao
create table tblReclamacao(
idReclamacao int auto_increment primary key,
motivo varchar(300),
idVendedor int,
foreign key (idVendedor) references tblVendedor(idVendedor),
idCliente int,
foreign key (idCliente) references tblCliente(idCliente)
);

#Tabela Feedback
create table tblFeedback(
idFeedback int auto_increment primary key,
feedback varchar(300),
nome varchar(20)
);

#Tabela ADM
create table tblADM(
idADM int auto_increment primary key,
userAdm varchar(10),
senhaAdm varchar(10)
);

#Tabela Despesas
create table tblDespesas(
idDespesas int auto_increment primary key,
dia date,
descricao varchar(100),
valor decimal,
conta varchar(20),
situacao varchar(30),
idADM int,
foreign key(idADM) references tblADM(idADM)
);

#Tabela Lembrete
create table tblLembrete(
idLembrete int auto_increment primary key,
titulo varchar(50),
criador varchar(50),
data date,
requisitados varchar(50),
statusLembrete varchar(25)
);

-- Tabela Conversa
create table tblConversa (
idConversa int auto_increment primary key,
idCliente int,
foreign key (idCliente) references tblCliente(idCliente),
idVendedor int,
foreign key (idVendedor) references tblVendedor(idVendedor)
);


-- Tabela Mensagem Cliente
create table tblMsgCliente(
idMsgCliente int auto_increment primary key,
msg varchar(150),
msgData datetime,
idConversa int,
foreign key (idConversa) references tblConversa(idConversa)
);

-- Tabela Mensagem Vendedor
create table tblMsgVendedor(
idMsgVendedor int auto_increment primary key,
msg varchar(150),
msgData datetime,
idConversa int,
foreign key (idConversa) references tblConversa(idConversa)
);

#Tabela Entregador 
create table tblEntregador(
idEntregador int primary key auto_increment,
nome varchar(70),
cpf varchar (15),
rg varchar (15),
idade varchar (3),
email varchar (50),
senha varchar (20),
foto varchar (500),
statusConta bit 
);

#Tabela Veiculo
create table tblVeiculo(
idVeiculo int primary key auto_increment,
nome varchar(50),
ano varchar (5),
placa varchar (8),
modelo varchar(50),
idEntregador int,
foreign key (idEntregador) references tblEntregador(idEntregador)
);

#Selects
SELECT * FROM tblProduto WHERE statusProduto <> 0 ORDER BY RAND() limit 8;
select * from tblCliente;
select * from tblVendedor;
select * from tblLembrete;
select * from tblADM;
select * from tblProduto;
select * from tblDespesas;
select * from tblCupom;
select * from tblPedido;
select * from tblItem;
select * from tblEntregador;
select * from tblVeiculo;
SELECT * FROM tblPedido as ped inner join tblItem as i on ped.idItem = i.idItem inner join tblProduto as p on i.idProduto = p.idProduto;
SELECT SUM(p.preco*i.qtde) AS total FROM tblProduto as p inner join tblItem as i on p.idProduto = i.idProduto where statusProduto <> 0;
SELECT * from tblItem as i inner join tblProduto as p on i.idProduto = p.idProduto inner join tblVendedor as v on p.idVendedor = v.idVendedor where idCliente = 1;
SELECT *  FROM tblProduto as p inner join tblItem as i on p.idProduto = i.idProduto where statusProduto <> 0;
select nome from tblVendedor as v inner join tblProduto as p on v.idVendedor = p.idVendedor WHERE idProduto = 1;
select v.idVendedor from tblVendedor as v inner join tblProduto as p on v.idVendedor = p.idVendedor inner join tblItem as i on p.idProduto = i.idProduto where p.idProduto=1;


#Updates
use Radix;
UPDATE tblItem set statusItem = 0 where idItem = 36;

UPDATE tblItem SET statusItem = 0 WHERE idCliente = 1;
insert into tblADM (userAdm,senhaAdm) values ('root', '123');


#Inserts
insert into tblProduto value (1,'Pimentão',15.99,'4bda7af87610498bdece3b41fbc6612d.png',"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ",1,1);
insert into tblProduto value (2,'Pepino',9,'20285168ce125cf9d86c5d86eaafd181.png',"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ",1,1);
insert into tblProduto value (3,'Tomate',5,'5946899e32dd2003aacb7db220fd8139.png',"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ",1,1);
insert into tblProduto value (4,'Gengibre',3.99,'5804ecc2fa85f418071bd1a5edbdc43f.png',"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ",1,1);
insert into tblProduto value (5,'Repolho',8,'d881fc561116697b682fc00c051e105a.png',"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ",1,1);
insert into tblProduto value (6,'Couve-Flor',3.9,'d1aa69398810b2a463fd0ecb9ea71365.png',"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ",1,1);
insert into tblProduto value (7,'Cenoura',12,'dabd7de234ae65a44208ecff2a5defb7.png',"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ",1,1);
insert into tblProduto value (8,'RÃºcula',5.99,'7e5300afda3059fb11be565c343aae33.png',"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ",1,1);
insert into tblProduto value (9,'Invis',100,'d7c58f766bb0bcfeb9882126fc2d6472.png',"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ",1,1);
insert into tblProduto value (10,'Invis',100,'d7c58f766bb0bcfeb9882126fc2d6472.png',"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ",1,1);


/* Inserts de vendedor e cliente*/
insert into tblVendedor (nomeVend , cpfCnpj , email , senha , imagem , statusConta)
values 
 ('Vitor da Mata','96.235.591/0001-55','vitor71@hotmail.com','VUFcfCL','', 1),
 ('Ana Clara Cardoso','47.558.723/0001-74','ana44@gmail.com','Plpc9Lg','', 1),
 ('Brenda Vieira','55.563.888/0001-62','brendavieira17@yahoo.com','VkcfaaT','', 1),
 ('Kaique Moreira','41.630.822/0001-33','ka.jerde@gmail.com','sluq1m0','', 0),
 ('Pedro Miguel da Silva','87.723.907/0001-67','pe_miguel@gmail.com','pe9dzmO','', 1);
 
 insert into tblCliente (nomeCliente , cpf , email , senha , statusConta)
values 
 ('Antônio Souza','297.460.304-18','antonio_dare@yahoo.com','jOC7EC3', 0),
 ('Davi Luiz Amorim','774.489.347-67','davi_32@hotmail.com','emh91hA', 1),
 ('Vitor Almeida','365.232.770-54','vitor_moore16@hotmail.com','eB0Fgcv', 1),
 ('Diogo da Conceição','756.703.499-97','celine5@gmail.com','9B2EtjA', 1),
 ('Pietra Rocha','856.885.686-15','ro_pietra@gmail.com','QtagEEa', 1);
 
 /* Inserts de entregadores*/
 insert into tblEntregador (nome, cpf, rg, idade, email, senha, foto, statusConta) 
values 
 ('Lucas', '123.456.789-01', '12.345.678-1', 18, 'Lucas@gmail.com', 'senha1','', 1),
 ('Carlos', '123.456.789-02', '12.345.678-2', 20, 'Carlos@gmail.com', 'senha2','', 0),
 ('Larissa', '123.456.789-03', '12.345.678-3', 22, 'Larissa@gmail.com', 'senha3','',  1),
 ('Fábio', '123.456.789-04', '12.345.678-4', 24, 'Fabio@gmail.com', 'senha4','', 1),
 ('Teste', '123.456.789-05', '12.345.678-4', 26, 'Teste@gmail.com', 'teste','', 1);
 /* Inserts de Pedidos */
 insert into tblPedido (horario, cupom, statusPedido , frete, idCliente, idItem, idVendedor) 
 values (null, 1, 1, 86.2, 2, 8, 1),
 (null, 0, 2,  70.2, 3, 10, 2),
 (null, 1, 3, 95.1, 1, 10, 4),
 (null, 1, 1, 41.9, 4, 12, 3),
 (null, 0, 2, 10.7, 3, 13, 4);
 
 /* inserts de Itens */
 insert into tblItem (qtde, idProduto, idCliente, statusItem)
 values (10, 1, 3, 1),
 (51, 8, 1, 1),
 (14, 5, 2, 1),
 (26, 6, 5, 1),
 (75, 2, 4, 1),
 (4, 7, 5, 1),
 (8, 9, 3, 1);
 
  /* inserts de Veículo */
 insert into tblVeiculo (nome, ano, placa, modelo, idEntregador)
 values ('Ferrari','2022', 'ABC2D45', 'California', 1),
 ('Chevrolet','2015', 'ABC2D45', 'Camaro', 2),
 ('Lamborghini','2019', 'ABC2D45', 'Veneno', 4),
 ('Massetari','2014', 'ABC2D45', 'As300', 3),
 ('Fiat','2020', 'ABC2D45', 'Strada', 4),
 ('Wolks','2023', 'ABC2D45', 'T-Cross', 3),
 ('Jeep','2018', 'ABC2D45', 'Compass', 4),
 ('Volvo', '2020', 'EBD2F79', 'C60', 3),
 ('Fiat','2020', 'ABC2D45', 'Strada', 5),
 ('Wolks','2023', 'ABC2D45', 'T-Cross', 5),
 ('Jeep','2018', 'ABC2D45', 'Compass', 5);
 
 describe tblEntregador
/*Drops
TABELAS
use Radix
go
drop table tblEndereco
drop table tblPedido
drop table tblItem
drop table tblProduto
drop table tblVendedor
drop table tblCliente
drop table tblADM
drop table tblEntregador
drop table tblVeiculo


BANCO
use master
go
drop database Radix
*/


