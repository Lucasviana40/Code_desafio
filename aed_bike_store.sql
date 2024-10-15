-- Listagem de todos os clientes que não realizaram compra:

SELECT cli.*
FROM customers cli
LEFT JOIN orders ord ON cli.customer_id = ord.customer_id
WHERE ord.order_id IS NULL

-- Listagem de todos os produtos que não tenham sido comprados:

SELECT prd.*
FROM products prd
LEFT JOIN order_items oit ON prd.product_id = oit.product_id
WHERE oit.product_id IS NULL

-- Listagem de todos os produtos sem estoque:

SELECT prd.*
FROM products prd
LEFT JOIN stocks stk ON prd.product_id = stk.product_id
WHERE stk.quantity IS NULL OR stk.quantity = 0

-- Agrupar a quantidade de vendas que uma marca fez por Loja:

SELECT brd.brand_name, sto.store_name, SUM(oit.quantity) AS total_vendas
--ENTENDO QUE A TABELA "ORDER_ITEMS" ESTEJA EM QUANTIDADE LITERAL, 
--POR ISSO, ESTAMOS USANDO SUM AO INVÉS DE COUNT
FROM brands brd
INNER JOIN products prd ON brd.brand_id = prd.brand_id
INNER JOIN order_items oit ON prd.product_id = oit.product_id
LEFT JOIN orders ord ON oit.order_id = ord.order_id
LEFT JOIN stores sto ON ord.store_id = sto.store_id
GROUP BY brd.brand_name, sto.store_name

-- Listagem de todos os funcionários que não estejam relacionados a um pedido:

SELECT sff.*
FROM staffs sff
LEFT JOIN orders ord ON sff.staff_id = ord.staff_id
WHERE ord.order_id IS NULL

