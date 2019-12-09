-- Valoraciones medias de las categorias con mas ventas 
select count(o.product_id) as num_ventas
, p.product_category_name as categoria
, avg(r.review_score) as valoracion
from olist_order_items_dataset as o
inner join olist_products_dataset as p
on o.product_id = p.product_id
inner join olist_order_reviews_dataset as r
on o.order_id = p.order_id
group by categoria
order by num_ventas desc
limit 10 ;

-- Longitud descripcion de las categorias con mas ventas 
select b.product_category_name as categoria
, count(b.product_id) as num_productos
, avg(b.product_description_lenght) as longitud_descripcion
from olist_order_items_dataset as o
inner join olist_products_dataset as p
on o.product_id = p.product_id
where p.product_description_lenght is not null
group by categoria
order by num_productos desc
limit 10 ;

-- A que hora se vende mas
select hour(order_purchase_timestamp) as hora
, count(order_id) as num_pedidos
from olist_orders_dataset
group by hora
order by hora asc;

