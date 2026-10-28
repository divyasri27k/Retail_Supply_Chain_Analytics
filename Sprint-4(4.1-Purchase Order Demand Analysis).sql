use retail_supply_chain;
-- 1. How many purchase orders are placed for each product category?
SELECT product_category,COUNT(*) AS total_orders
FROM purchase_orders
GROUP BY product_category
ORDER BY total_orders DESC;
-- 2. Which suppliers receive the highest number of purchase orders?
SELECT s.supplier_id,s.supplier_name,COUNT(p.po_id) AS total_orders
FROM suppliers s
JOIN purchase_orders p
ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY total_orders DESC;
-- 3. Which warehouses place the highest number of purchase orders?
SELECT w.warehouse_id,w.warehouse_name,COUNT(p.po_id) AS total_orders
FROM warehouses w
JOIN purchase_orders p
ON w.warehouse_id = p.warehouse_id
GROUP BY w.warehouse_id, w.warehouse_name
ORDER BY total_orders DESC;
-- 4. How does purchase-order demand vary by priority?
SELECT order_priority,COUNT(*) AS total_orders,
SUM(quantity_ordered) AS total_quantity
FROM purchase_orders
GROUP BY order_priority
ORDER BY total_orders DESC;
-- 5. How many purchase orders are placed each month?
SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month,
COUNT(*) AS total_orders
FROM purchase_orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY order_month;
-- 6. Which product categories have the highest total purchase-order cost?
SELECT product_category,
SUM(total_cost) AS total_cost
FROM purchase_orders
GROUP BY product_category
ORDER BY total_cost DESC;
