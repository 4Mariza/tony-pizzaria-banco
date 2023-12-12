-- LISTAR TODOS OS USUARIOS
select * from usuarios;

-- QUAIS USUARIOS JA FIZERAM PEDIDOS?
select usuarios.id as 'ID usuário', nome, email, pedidos.id as 'ID pedido', data_pedido from usuarios 
INNER JOIN pedidos on usuarios.id = pedidos.id_usuario
WHERE id_usuario in (select usuarios.id from usuarios);

-- QUAIS DETALHES ESTÃO ASSOCIADOS AOS PEDIDOS DE UM USUÁRIO ESPECÍFICO?
select usuarios.id  as 'ID usuário', usuarios.nome, email, pedidos.id as 'ID pedido', SUM(produtos.preco * pedidos_produtos.quantidade)as 'valor total dos pedidos', data_pedido, forma_pagamento, status_pedido from usuarios
INNER JOIN pedidos on usuarios.id = pedidos.id_usuario
INNER JOIN pedidos_produtos on pedidos.id = pedidos_produtos.id_pedido
INNER JOIN produtos on pedidos_produtos.id_produto = produtos.id 
WHERE usuarios.id = 1;

-- VALOR TOTAL DE UM PEDIDO
select id_pedido, SUM(produtos.preco * pedidos_produtos.quantidade)as 'valor total' from pedidos_produtos
INNER JOIN produtos on pedidos_produtos.id_produto = produtos.id
INNER JOIN pedidos on pedidos_produtos.id_pedido = pedidos.id
WHERE pedidos_produtos.id_pedido = 2;

-- QUAIS PRODUTOS ESTÃO ATUALMENTE DISPONÍVEIS PARA PEDIDOS?
select id, nome, preco, disponibilidade from produtos
WHERE disponibilidade = true;

-- QUAIS COMENTÁRIOS FORAM FEITOS SOBRE PRODUTOS?
select id_usuario, data_comentario, comentario, comentarios.avaliacao from comentarios
INNER JOIN produtos on comentarios.id_produto = produtos.id
WHERE produtos.id = 2;

-- COMO ESTÁ DISTRIBUÍDA A QUANTIDADE DE PEDIDOS POR FORMA DE PAGAMENTO?
select forma_pagamento, COUNT(pedidos.id) as 'qntd. pedidos' from pedidos
WHERE forma_pagamento LIKE '%Dinheiro';

-- QUAIS SÃO AS CATEGORIAS DE PRODUTOS E QUAIS PRODUTOS ESTÃO EM CADA CATEGORIA?
select * from categorias;

select id_produto, produtos.nome, id_categoria, categorias.nome from possui
INNER JOIN produtos on possui.id_produto = produtos.id
INNER JOIN categorias on possui.id_categoria = categorias.id
WHERE categorias.id = 1;

-- QUAIS SÃO OS USUÁRIOS QUE TÊM COMPLEMENTO NO ENDEREÇO? --arrumar
select nome, email, complemento from endereco 
LEFT JOIN usuarios on endereco.id_usuario = usuarios.id
WHERE complemento IS NOT NULL;

-- QUAIS SÃO OS USUÁRIOS QUE NÃO FIZERAM NENHUM PEDIDO?
select nome, email from usuarios
LEFT JOIN pedidos on usuarios.id = pedidos.id_usuario
WHERE usuarios.id NOT IN (select pedidos.id_usuario from pedidos);
