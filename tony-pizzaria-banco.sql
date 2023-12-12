use tony_pizzaria;

create table usuarios(
	id integer primary key auto_increment,
    nome varchar(255) NOT NULL,
    foto text,
    telefone varchar(20) NOT NULL,
    email varchar (255) NOT NULL,
    senha varchar(30) CHECK (char_length(senha) >= 8) NOT NULL
);

create table endereco (
	id integer primary key auto_increment,
    id_usuario integer,
    rua text NOT NULL,
    bairro text NOT NULL,
    numero integer NOT NULL,
    complemento varchar(100),
    cep varchar(10),
    
    foreign key(id_usuario) references usuarios(id)
);

create table produtos(
	id integer primary key auto_increment,
    nome varchar(100) NOT NULL,
    foto text NOT NULL,
    preco double NOT NULL,
    descricao varchar(100) NOT NULL,
    avaliacao integer NOT NULL,
    disponibilidade boolean NOT NULL,
    favorita boolean
);

create table comentarios (
	id integer primary key,
    id_usuario integer,
    id_produto integer,
    data_comentario date NOT NULL,
    avaliacao integer NOT NULL,
    titulo varchar(100),
    comentario text,
    
    foreign key (id_usuario) references usuarios(id),
    foreign key (id_produto) references produtos(id)
);

create table categorias(
	id integer primary key auto_increment,
    nome varchar (100) NOT NULL,
    foto text NOT NULL
);

create table possui(
	id integer primary key,
    id_produto integer,
    id_categoria integer,
    
    foreign key (id_produto) references produtos(id),
    foreign key (id_categoria) references categorias(id)
);

create table pedidos(
	id integer primary key,
    id_usuario integer,
    forma_pagamento varchar(50) NOT NULL,
    data_pedido date NOT NULL,
    status_pedido varchar (50) NOT NULL,
    -- desconto double,
    -- taxa_entrega double,
    -- taxa_servico double NOT NULL,
    
    foreign key (id_usuario) references usuarios(id)
);

create table pedidos_produtos(
	id integer primary key,
    id_produto integer,
    id_pedido integer,
    quantidade integer,
    
    foreign key (id_produto) references produtos(id),
    foreign key (id_pedido) references pedidos(id)
);

-- ----------------------------------------------------

insert into usuarios (nome, foto, telefone, email, senha )values
("Maria","../img/", "(11)123456789", "maria@gmail.com","12345675"),
("Luiza","../img/", "(11)987654321", "luiza@gmail.com","00008888"),
("Gomes","../img/", "(11)979754542", "gomes@gmail.com","2451870f"),
("Almeida","../img/", "(11)13217889", "almeida@gmail.com","loasdw81"),
("Marta","../img/", "(11)164765589", "martaa@gmail.com","crisdr121"),
("Jane","../img/", "(11)1278771220", "jnae@gmail.com","janejane0202");

insert into endereco (id_usuario, rua, bairro, numero, complemento, cep) values
(1,"Rua Ali", "Bairro aqui", 66, "", 08874-352),
(2,"Rua Linda", "Bairro Bonito", 21," ", 11447-000),
(3,"Rua Fora", "Bairro Sim", 74, " ", 17117-900),
(4,"Rua Azul", "Bairro Rosa", 33,  " ", " "),
(5,"Rua Maria", "Bairro Luiza", 14, " ", 11021-093),
(6,"Rua Estrela", "Bairro Céu", 01, "113C", 11447-000);

insert into produtos (nome, foto, preco, descricao, avaliacao, disponibilidade) values
("Pizza de calabresa com queijo", "../img/", 16.00, "Hmm delicia", 4, true),
("Pizza palmito com mussarela", "../img/", 16.50, "Hmm delicia muito bom", 5, true),
("Pizza Mussarela, shimeji refogado no shoyo", "../img/", 18.80, "Hmm delicia muito bom", 5, true),
("Pizza Banoffe", "../img/", 15.00, "Hmm", 5, true),
("Petit Gateau'", "../img/", 13.99, "Hmm delicia muito bom", 5, true),
("Sprite", "../img/", 9.99, "Refrigerante Lata 350ml", 5, true),
("Suco Dell Vale", "../img/", 8.99, "Suco Lata 290ml sabor Uva", 5, true),
("Pizza de Brownie", "../img/", 16.00, "Hmm delicia", 5, false),
("Pizza de peperoni com queijo e tomate", "../img/", 17.00, "Hmm que delicia", 5, true);

insert into comentarios (id, id_usuario, id_produto, data_comentario, avaliacao, titulo, comentario) values
(1, 1, 2, '2022-07-01', 5, "Pizza Legal", "Nossa muito bom, adorei."),
(2, 3, 2, '2022-10-30', 5, "Essa pizza é demais, recomendo", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et."),
(3, 1, 4, '2022-10-02', 5, "Pizza Legal", "Nossa muito bom, adorei."),
(4, 5, 1, '2022-05-09', 2, "Pizza Ruim", "Não gostei da massa"),
(5, 2, 3, '2022-12-16', 5, "Pizza Genial", "Nossa sensacional, parabéns!");

insert into categorias (nome, foto) values 
("Pizzas", "../img/Vector (1).png"),
("Bebidas", "../img/Kawaii Soda.png"),
("Pizzas Vegetarianas", "../img/Watermelon.png"),
("Pizzas Salgadas", "../img/Pizza.png"),
("Pizzas Doces", "../img/Ice Cream Sundae.png"),
("Sobremesas", "../img/Kawaii Cupcake.png");

insert into possui (id, id_produto, id_categoria) values 
(1,1,1),(2,1,4),(3,2,1),(4,2,3),(5,3,1),(6,3,3),(7,4,1),(8,4,5),(9,5,6),(10,6,2),(11,7,2),(12,8,1),(13,8,3),(14,9,1),(15,9,4);

insert into pedidos (id, id_usuario, forma_pagamento, data_pedido, status_pedido) values
(1, 1, " Cartão Débito", '2022-07-01', "Concluído"),
(2, 1, " Dinheiro", '2022-10-02', "Concluído"),
(3, 2, " Cartão Débito", '2022-12-16', "Concluído"),
(4, 3, "Cartão Crédito", '2022-10-30', "Concluído"),
(5, 4, " Dinheiro", '2023-02-17', "Cancelado");

 insert into pedidos_produtos (id, id_pedido,id_produto,quantidade) values
(1,1,2,1),
(2,2,4,1),
(3,3,9,2),
(4,3,6,3),
(5,4,1,1);










