--  EXERCÍCIOS 
-- Crie uma view que liste todos os produtos, incluindo o nome da categoria e o nome da marca. A view deve ter as seguintes colunas: produto_id, produto_nome, categoria_nome, marca_nome.
-- Dica: Use JOINs entre as tabelas produto, categoria e marca.

USE loja;
CREATE VIEW vw_produtos_completo AS 
SELECT produto.id "Id do Produto", produto.nome "Produto",
categoria.nome "Categoria", marca.nome "Marca"
FROM produto JOIN categoria ON produto.id_categoria = categoria.id
JOIN marca ON produto.id_marca = marca.id
ORDER BY produto.id;

SELECT vw_produtos_completo;

-- exercício 2
CREATE VIEW vw_estoque_baixo AS
SELECT produto.nome, estoque.tamanho, estoque.cor, estoque.quantidade
FROM produto JOIN estoque ON produto.id = estoque.id_produto
WHERE estoque.quantidade<=5;

SELECT * FROM vw_estoque_baixo;


-- exercício 3 
CREATE VIEW view_cliente_pedidos AS
SELECT
    cliente.nome AS cliente_nome,
    COUNT(pedido.id) AS total_pedidos
FROM
    cliente
JOIN
    pedido ON cliente_id = pedido.cliente_id
GROUP BY
    cliente.nome;
    
-- exercicio 4
CREATE VIEW view_itens_pedidos_detalhada AS
SELECT
    p.id AS pedido_id,
    p.data_pedido,
    c.nome AS cliente_nome,
    pr.nome AS produto_nome,
    e.tamanho,
    e.cor,
    pi.quantidade AS quantidade_vendida,
    pi.valor_unitario
FROM
    pedido_item pi
INNER JOIN pedido p ON pi.pedido_id = p.id
INNER JOIN cliente c ON p.cliente_id = c.id
INNER JOIN estoque e ON pi.estoque_id = e.id
INNER JOIN produto pr ON e.produto_id = pr.id;

-- exercicio 5
CREATE VIEW view_faturamento_por_categoria AS
SELECT
    cat.nome AS categoria_nome,
    SUM(pi.quantidade * pi.valor_unitario) AS faturamento_total
FROM
    pedido_item pi
INNER JOIN estoque e ON pi.estoque_id = e.id
INNER JOIN produto pr ON e.produto_id = pr.id
INNER JOIN categoria cat ON pr.categoria_id = cat.id
GROUP BY
    cat.nome;
    

-- exercicio 6
CREATE VIEW view_pedidos_carlos_silva AS
SELECT
    p.id AS pedido_id,
    p.data_pedido,
    (pi.quantidade * pi.valor_unitario) AS valor_total,
    pr.nome AS produto_nome
FROM
    pedido p
INNER JOIN cliente c ON p.id_cliente = c.id
INNER JOIN pedido_item pi ON p.id = pi.pedido_id
INNER JOIN estoque e ON pi.estoque_id = e.id
INNER JOIN produto pr ON e.produto_id = pr.id
WHERE
    c.nome = 'Carlos Silva';


-- exercicio 7
CREATE VIEW view_catalogo_produtos AS
SELECT
    pr.nome AS produto_nome,
    e.tamanho,
    e.cor,
    e.quantidade
FROM
    estoque e
INNER JOIN produto pr ON e.produto_id = pr.id
WHERE
    e.quantidade > 0;



