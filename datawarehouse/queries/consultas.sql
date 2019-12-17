-- Consultas para Impala correspondientes al taller de E-commerce basado en el dataset de Olist
-- Ejecutar con: 
-- 	impala-shell -f consultas.sql
-- Dataset descargado de: 
-- 	https://www.kaggle.com/olistbr/brazilian-ecommerce

use default; 

-- Categorias con mayor numero de ventas
select p.product_category_name categorias , count(o.product_id) num_ventas
from order_items_dataset as o
inner join products_dataset as p
on o.product_id = p.product_id
group by categorias
order by num_ventas desc
limit 10 ;

-- Ingresos en funcion del mes
SELECT month(orders.order_purchase_timestamp) mes,
round(sum(order_items.price)) ingresos
FROM orders_dataset as orders 
join order_items_dataset as order_items on orders.order_id=order_items.order_id
GROUP BY mes
ORDER BY ingresos DESC;

-- Categorias de producto con peores evaluaciones
SELECT products.product_category_name categoria, 
avg(cast(order_reviews.review_score as FLOAT)) evaluacion
FROM orders_dataset as orders 
join order_reviews_dataset as order_reviews on orders.order_id=order_reviews.order_id 
join order_items_dataset as order_items on orders.order_id=order_items.order_id 
join products_dataset as products on order_items.product_id=products.product_id
GROUP BY products.product_category_name
ORDER BY evaluacion ASC
LIMIT 10;

-- Estados que generan el mayor numero de pedidos
SELECT customers.customer_state, count(*) num_orders 
FROM orders_dataset as orders 
join customers_dataset as customers on orders.customer_id=customers.customer_id 
GROUP BY customers.customer_state
order by num_orders desc;

-- Cuanto tardan los pedidos por estado
-- Tiempo medido como diferencia entre fecha de la entrega y fecha de la compra
-- Donde se tarda menos
select round(avg(datediff(o.order_delivered_customer_date, o.order_purchase_timestamp))) dias
, c.customer_state as state
from orders_dataset as o
inner join customers_dataset as c
on o.customer_id=c.customer_id
group by state
order by dias asc
limit 10;

-- Retraso de los pedidos por estado
-- Retraso medido como diferencia entre fecha de entrega estimada y fecha de entrega real
select round(avg(datediff(o.order_estimated_delivery_date, o.order_delivered_customer_date))) retraso
, c.customer_state as state
from orders_dataset as o
inner join customers_dataset as c
on o.customer_id=c.customer_id
group by state
order by retraso desc
limit 10; 
