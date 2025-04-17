create view sqlproj as
SELECT
ord.order_id,
CONCAT(cus.first_name, '  ', cus.last_name) AS Customer_Name,
ord.order_dates,
cus.state,
cus.city,
SUM(ite.quantity) AS Sales_Volume,
SUM(ite.quantity * ite.list_price) AS Revenue,
pro.product_name,
cat.category_name,
bra.brand_name,
sto.store_name,
CONCAT(sta.first_name,'  ',sta.last_name) AS Sales_Rep
FROM sales.orders AS ord
join sales.customers AS cus
ON cus.customer_id = ord.customer_id
join sales.order_items AS ite
ON ord.order_id =ite.order_id
join production.products AS pro
ON pro.product_id = ite.product_id
join production.categories AS cat
ON pro.category_id = cat.category_id
join production.brands AS bra
ON pro.brand_id = bra.brand_id
join sales.stores AS sto
ON sto.store_id = ord.store_id
join sales.staffs AS sta
ON sta.staff_id = ord.staff_id
GROUP BY 
ord.order_id,
CONCAT(cus.first_name, '  ', cus.last_name),
ord.order_dates,
cus.state,
cus.city,
pro.product_name,
cat.category_name,
bra.brand_name,
sto.store_name,
CONCAT(sta.first_name,'  ',sta.last_name) 
